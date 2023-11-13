import streamlit
import pandas as pd
import streamlit_echarts as echarts
from snowflake.snowpark import Session
import numpy as np
from PIL import Image
import altair as alt

streamlit.set_page_config(
    page_title="Cutter Portfolio Analytics",
    page_icon="🧊",
    layout="wide",
    initial_sidebar_state="expanded",
    menu_items={
        'About': ''' 
### Portfolio Analytics Viewer     
#### Project Links
* [Data glossary](https://purview.microsoft.com)
* [Snowflake](https://pejhwwn-lt54429.snowflakecomputing.com)
* [Power BI]()
* [Coalese.io](https://app.coalescesoftware.io)
* [DBT Cloud](https://cloud.getdbt.com)
    > Copyright (c) Cutter Associates 2023.    
'''}
)

#@streamlit.cache_resource
def get_snow():
    return streamlit.connection("snowflake")


#@streamlit.cache_data  # 👈 Add the caching decorator
def get_portfolios():
    stmt = "select portfolio_code as ID, portfolio_short_name as Name from DW.DIM_PORTFOLIO where LATEST_FLAG = 'TRUE'"
    return get_snow().query(stmt)

portfolios = get_portfolios()

# TODO:  Generate a list of portfolios with the code & name combined.
# need to identify if CODE can be selected based on the INDEX selected rather than the value.
# Then populate the Portfolio selection selectbox
stmt = "select distinct( TO_DATE( TO_CHAR( DATE_KEY) , 'YYYYMMDD') )  as Effective_Date  from DW.WIDE_HOLDINGS"
df = get_snow().query(stmt)

with streamlit.sidebar:
    image = Image.open('images/cutter-associates-logo.webp')
    streamlit.image(image, width=100)
    streamlit.divider()

    # TODO default to current system effective date.
    selected_date = streamlit.selectbox(
        'Effective Date',
        (df),
        index=0,
        placeholder="Select Effective Date..."
    )

    portfolio = streamlit.selectbox(
        'Select Portfolio',
        (portfolios['NAME']),
        # index=None,
        placeholder="Select Portfolio..."
    )

    portfolio_id = ''
    portfolio_details = ''

    if portfolio == None:
        portfolio_id = ''
        portfolio = ''
    else:
        idx= portfolios.index[portfolios['NAME']==portfolio].tolist()
        portfolio_id = portfolios.loc[idx[0]]['ID']
        portfolio_df = get_snow().query("select * from CUTTER_DW.DW.portfolio_analytics where portfolio_code = '" + portfolio_id  + "'")

    lookthrough = streamlit.toggle('Account Lookthrough', help='When active enables looking through funds into underlying securities')
    streamlit.divider()
    # image = Image.open('images/snowflake.png')
    # streamlit.image(image, width=200)

stmt = '''select
    TO_DATE( TO_CHAR(DATE_KEY), 'YYYYMMDD') as "Effective Date",
    PORTFOLIO_CODE as "Code",
    PORTFOLIO_LEGAL_NAME as "Name",
    SECURITY_NAME as "Security",
    SECURITY_TYPE as "Security Type",
    TICKER as "Ticker",
    ISIN,
    CURRENCY_CODE as "Currency",
    COUNTRY_OF_DOMICILE as "Country CD",
    COUNTRY_NAME as "Country",
    REGION as "Region",   
    GICS_SECTOR_LEVEL1 as "GICS Level 1",
    GICS_SECTOR_LEVEL2 as "GICS Level 2",
    GICS_SECTOR_LEVEL3 as "GICS Level 3",
    GICS_SECTOR_LEVEL4  as "GICS Level 4",
    ASSET_CLASS_LEVEL1 as "Asset Class Level 1",
    ASSET_CLASS_LEVEL2 as "Asset Class Level 2",
    ASSET_CLASS_LEVEL3 as "Asset Class Level 3",
    ISSUER_NAME as "Issuer",
    Quantity as "Quantity",
    Price as "Price",
    Market_Value as "Market Value",
    Portfolio_Value as "Total Portfolio Value",
    Portfolio_Weight as "Weight",
    LOOKTHROUGH as "Lookthrough",
    LOOKTHROUGH_PORTFOLIO as ETF_PORT_ID
    from DW.WIDE_HOLDINGS where DATE_KEY = 20230930 AND PORTFOLIO_CODE IN '''
stmt = stmt + "('" + portfolio_id + "')"
if lookthrough != True:
    stmt = stmt + " AND LOOKTHROUGH = 'N'"
else:
    stmt = stmt + " AND SECURITY_TYPE <> 'Portfolio'"

df = get_snow().query(stmt)

benchmark_df = get_snow().query("select * from DW.BENCHMARK_CONSTITUENTS WHERE benchmark_code= '" + portfolio_df['BENCHMARK_CODE'].values[0]  + "'")

streamlit.subheader("Portfolio: " + portfolio + " (" + portfolio_id + ")")
t_overview, tab2, tab3, tab4,t_exposure, t_data, benchmark_tab = streamlit.tabs(["Overview ", "💲Asset Allocation ", "📈Performance ", "📈Attribution ", "Exposures ", "📀 Holdings Data ", " Benchmark Data "])
with t_overview:
    overview_1, overview_2 = streamlit.columns(2)
    streamlit.markdown("""
            <style>
            [data-testid=column]:nth-of-type(1) [data-testid=stVerticalBlock]{
                gap: 0rem;
            }
            </style>
            """,unsafe_allow_html=True)

    with overview_1:
        # portfolio_df
        label_col, value_col = streamlit.columns(2)
        with label_col:
            "Investment Strategy: "
            "Benchmark: "
            "Inception Date: "
            "Assets Under Management: "
            "Base Currency: "

        with value_col:
            portfolio_df['PORTFOLIO_GROUP'].values[0]
            portfolio_df['BENCHMARK_CODE'].values[0]
            dval = portfolio_df['INCEPTION_DATE'].values[0].strftime("%m/%d/%Y")
            dval
            val = str(portfolio_df['MARKET_CAP'].values[0])
            val
            portfolio_df['BASE_CURRENCY'].values[0]

        streamlit.divider()
        "Investment Objective"
        "Market Review"

    with overview_2:
        holdings_by_asset = df[['Asset Class Level 1','Weight']]

        # If lookthrough then exclude records with securitytype = 'portfolio' to stop double counting. (done) sum is still wrong when using lookthrough
        totals = holdings_by_asset.groupby(['Asset Class Level 1'], as_index=False).agg({ 'Weight': 'sum'})
        totals.loc[:, 'Weight'] = round( totals.loc[:, 'Weight'] * 100,6)
        for index, row in totals.iterrows():
                totals.loc[index, 'Asset Class Level 1'] = row['Asset Class Level 1'] + ' '+  str( row['Weight'])  + '%'

        newdf = totals.rename(columns={'Weight': 'value', 'Asset Class Level 1': 'name'})
        edata = newdf.to_dict('records')

        chart_option = {
            "tooltip": {"trigger": "item"},
            "title": {"text": "Asset Allocation", "subtext": "by Security Class", "left": "left"},
            # "legend": {"top": "5%", "right": "center"},
            "legend": {"orient": "vertical", "right": "right",},
            "series": [
                {
                    "name": "Asset Allocation",
                    "type": "pie",
                    "radius": ["40%", "70%"],
                    "avoidLabelOverlap": True,
                    "itemStyle": {
                        "borderRadius": 10,
                        "borderColor": "#fff",
                        "borderWidth": 2,
                    },
                    "label": {"show": False, "position": "right"},
                    "emphasis": {
                        "label": {"show": True, "fontSize": "25", "fontWeight": "bold"}
                    },
                    "labelLine": {"show": True},
                     "data": edata,
                    }
                ],
            }
        echarts.st_echarts(
            options=chart_option, height="400px",
        )

        "Annualized Performance"
        chart_data = pd.DataFrame(
            {
                "Year": ['2023','2024','2025','2026','2027'] * 2,
                "Relative": ["Fund","Benchmark"] * 5,
                "Value": np.random.rand(10),
            }
        )

        chart = alt.Chart(chart_data).mark_bar().encode(
            column=alt.Column('Year'),
            x=alt.X('Relative').title(''),
            y=alt.Y('Value').title('Market Value ($M)'),
            # color=alt.Color('Relative', scale=alt.Scale(range=['#EA98D2', '#659CCA']))
            color=alt.Color('Relative')
        )
        streamlit.altair_chart(chart)

with tab2:
    # streamlit.header("Asset Type breakdown")
    asset_col1, asset_col2 = streamlit.columns(2)
    assetclass_agg = df[["Code","Asset Class Level 1", "Asset Class Level 2", "Asset Class Level 3", "Weight", "Market Value" ]]
    agg_ass = assetclass_agg.groupby(["Code","Asset Class Level 1", "Asset Class Level 2", "Asset Class Level 3"]).sum()

    with asset_col1:
        # streamlit.subheader('Weight By Asset Class')
        # Some distinct set of countries from the database.
        # streamlit.dataframe(agg_ass, use_container_width=True)

        streamlit.subheader("Sector Exposure (by Weight)")
        top_holdings_df = df.copy()
        top_holdings_df = top_holdings_df[["GICS Level 1", "Weight"]].groupby(["GICS Level 1"]).sum()

        # streamlit.dataframe(top_holdings_df)
        streamlit.bar_chart(top_holdings_df.sort_values('Weight', ascending=False), y="Weight", height=500)


    with asset_col2:
        # Group by security ID to sum weight & value then get top largest holdings by size
        top_holdings_df = df.copy()
        top_holdings_df = top_holdings_df[["Issuer","Market Value", "Weight"]].groupby(["Issuer"]).sum()

        streamlit.subheader("Top 10 Issuers")
        streamlit.dataframe(top_holdings_df.sort_values('Market Value', ascending=False).head(10))

        # chart_data = pd.DataFrame(
        #     {
        #         "Relative": ["Fund","Benchmark"] * 3,
        #         "Weight": np.random.randn(6),
        #         "Asset Class": ["Fixed Income"] * 2 + ["Equity"] * 2 + ["ETF"] * 2,
        #     }
        # )
        #
        # streamlit.bar_chart(chart_data, x="Relative", y="Weight", color="Asset Class")

with tab3:
    streamlit.subheader("Exposure")
    ex_col1, ex_col2 = streamlit.columns(2)

    with ex_col1:
        streamlit.subheader('Some Selection Criteria')
        # Some distinct set of countries from the database.

    with ex_col2:
        streamlit.subheader('Some Result set')
        streamlit.bar_chart({"data": [1, 5, 2, 6, 2, 1]})


with tab4:
    streamlit.subheader("Exposure")

with t_exposure:
    selected_date = streamlit.selectbox(
        'Exposure Type',
         ('🌎 Portfolio Geographic Exposure',
          '📈 Equity Geographic Exposure',
          'Fixed Income Geographic Exposure',
          'Fixed Income Exposures'
          ),
        index=None,
        placeholder="Select Exposure Report...",
        label_visibility='collapsed'
    )

with t_data:
    # streamlit.subheader("Portfolio Holdings")
    # Display the table on the page.
    # output = df.to_pandas()
    streamlit.dataframe(df, use_container_width=True, hide_index=True, column_config={"Effective Date": None, "Code": None, "Name":None} )
    # data_df = pd.DataFrame(
    #     {
    #         "sales": [
    #             [0, 4, 26, 80, 100, 40],
    #             [80, 20, 80, 35, 40, 100],
    #             [10, 20, 80, 80, 70, 0],
    #             [10, 100, 20, 100, 30, 100],
    #         ],
    #     }
    # )
    #
    # streamlit.data_editor(
    #     data_df,
    #     column_config={
    #         "sales": streamlit.column_config.LineChartColumn(
    #             "Sales (last 6 months)",
    #             help="The sales volume in the last 6 months",
    #             y_min=0,
    #             y_max=100,
    #         ),
    #     },
    #     hide_index=True,
    # )


with benchmark_tab:
    benchmark_df