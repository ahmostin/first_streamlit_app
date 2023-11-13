import streamlit
import pandas as pd
import streamlit_echarts as echarts
from snowflake.snowpark import Session
import numpy as np
from PIL import Image
import altair as alt
import datetime as dt

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
    from DW.WIDE_HOLDINGS where DATE_KEY ='''

stmt = stmt + "'" + selected_date.strftime("%Y%m%d") + "' AND PORTFOLIO_CODE IN "

stmt = stmt + "('" + portfolio_id + "')"
if lookthrough != True:
    stmt = stmt + " AND LOOKTHROUGH = 'N'"
else:
    stmt = stmt + " AND SECURITY_TYPE <> 'Portfolio'"

df = get_snow().query(stmt)

benchmark_df = get_snow().query("select * from DW.BENCHMARK_CONSTITUENTS WHERE benchmark_code= '" + portfolio_df['BENCHMARK_CODE'].values[0]  + "'"  + " AND DATE_KEY = '" + selected_date.strftime("%Y%m%d") + "'")
performance_df = get_snow().query("select * from DW.PERFORMANCE_RETURN where portfolio_code = '" + portfolio_id  + "' AND DATE_KEY = '" + selected_date.strftime("%Y%m%d") +"'")

streamlit.subheader("Portfolio: " + portfolio + " (" + portfolio_id + "), Effective Date: " +  str(selected_date) )
# t_overview, t_asset, t_perf, t_attr ,t_exposure, t_data, benchmark_tab, performance_tab = streamlit.tabs(["Overview ", " Asset Allocation ", "📈Performance ", "📈Attribution ", "Exposures ", " Holdings Data ", " Benchmark Data ", " Performance Data "])

t_overview, t_asset, t_perf,  t_data, benchmark_tab, performance_tab = streamlit.tabs(["Overview ", " Asset Allocation ", "Performance ",  " Holdings Data ", " Benchmark Data ", " Performance Data "])


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
            portfolio_df['BENCHMARK_NAME'].values[0]
            dval = portfolio_df['INCEPTION_DATE'].values[0].strftime("%m/%d/%Y")
            dval
            val = str(portfolio_df['MARKET_CAP'].values[0])
            val
            portfolio_df['BASE_CURRENCY'].values[0]

        streamlit.divider()
        streamlit.subheader("Investment Objective")

        "Lorem ipsum dolor sit amet, labitur alienum honestatis mei eu, quo sint veritus suscipiantur et. Vis ut erat reque iisque, pro eros prima delicatissimi ea, cu nec saepe disputationi. At eum nostrum nominati."

        streamlit.subheader("Market Review")
        streamlit.markdown('''
* Lorem ipsum dolor sit amet, labitur alienum honestatis mei eu, quo sint veritus suscipiantur et. 
* Vis ut erat reque iisque, pro eros prima delicatissimi ea, cu nec saepe disputationi. At eum nostrum nominati. 
        ''')

        streamlit.subheader("Performance")
        streamlit.markdown('''
* Mea falli equidem dignissim ex. Recteque rationibus qui an, an usu nihil tation detraxit. Est aeque altera graeci ei, pri velit numquam ex. 
* Quot possim feugiat ex his, cibo oblique antiopam sed id, est ne libris.
* Vix elaboraret percipitur et, ad vix fugit vivendo oporteat, ei sea viderer feugiat recusabo. 

        ''')

        streamlit.subheader("Outlook")
        streamlit.markdown('''
* Lorem ipsum dolor sit amet, labitur alienum honestatis mei eu, quo sint.
* Vis ut erat reque iisque, pro eros prima delicatissimi ea, cu nec saepe disputationi. At eum nostrum nominati. 
* Cum ei timeam eleifend. Has ei vivendo delectus concludaturque. Usu solum iuvaret ea. Pro luptatum periculis cu, ius at error causae. 
        ''')


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
        m_df = performance_df[ performance_df['PERFORMANCE_RETURN_TYPE_NAME'].str.contains('Net C')][["PERFORMANCE_ENTITY_TYPE",'RETURN_1M', 'RETURN_3M', 'RETURN_6M', 'RETURN_YTD', 'RETURN_1Y', 'RETURN_3Y','RETURN_5Y','RETURN_10Y','RETURN_SI']].melt( id_vars=['PERFORMANCE_ENTITY_TYPE'] )

        chart = alt.Chart(m_df).mark_bar().encode(
            column=alt.Column('variable' ).title('Net Cumulative Performance'),
            x=alt.X('PERFORMANCE_ENTITY_TYPE').title(''),
            y=alt.Y('value').title('Market Value ($M)'),
            color=alt.Color('PERFORMANCE_ENTITY_TYPE')
        )
        streamlit.altair_chart(chart)


with t_asset:
    # streamlit.header("Asset Type breakdown")
    asset_col1, asset_col2 = streamlit.columns(2)
    assetclass_agg = df[["Code","Asset Class Level 1", "Asset Class Level 2", "Asset Class Level 3", "Weight", "Market Value" ]]
    agg_ass = assetclass_agg.groupby(["Code","Asset Class Level 1", "Asset Class Level 2", "Asset Class Level 3"]).sum()

    with asset_col1:
        streamlit.subheader("Sector Exposure (by Weight)")
        top_holdings_df = df.copy()
        top_holdings_df = top_holdings_df[["GICS Level 1", "Weight"]].groupby(["GICS Level 1"]).sum()

        streamlit.bar_chart(top_holdings_df.sort_values('Weight', ascending=False), y="Weight", height=500)

        chart_data = pd.DataFrame([[20, 30, 50], [50, 20, 30], [50, 30, 20]],
                                  columns=['Equities EMEA', 'Equities Global', 'Equities Switzerland'],
                                  index=[dt.datetime(2017, 1, 1),
                                         dt.datetime(2018, 1, 2),
                                         dt.datetime(2019, 1, 3)])
        streamlit.area_chart(chart_data)

    with asset_col2:
        asset_col1, asset_col2 = streamlit.columns(2)
        with asset_col1:
            # Group by security ID to sum weight & value then get top largest holdings by size
            top_holdings_df = df.copy()
            top_holdings_df = top_holdings_df[["Issuer","Market Value", "Weight"]].groupby(["Issuer"]).sum()

            streamlit.subheader("Top 10 Issuers")
            streamlit.dataframe(top_holdings_df.sort_values('Market Value', ascending=False).head(10))

        with asset_col2:
            top_holdings_df = df.copy()
            top_holdings_df = top_holdings_df[["Region","Market Value", "Weight"]].groupby(["Region"]).sum()

            streamlit.subheader("Top 10 Region")
            streamlit.dataframe(top_holdings_df.sort_values('Market Value', ascending=False).head(10))

            top_holdings_df = df.copy()
            top_holdings_df = top_holdings_df[["Currency","Market Value", "Weight"]].groupby(["Currency"]).sum()

            streamlit.subheader("Top 10 Currencies")
            streamlit.dataframe(top_holdings_df.sort_values('Market Value', ascending=False).head(10))



with t_perf:
    ex_col1, ex_col2 = streamlit.columns(2)

    with ex_col1:
        streamlit.subheader('Net Cumulative Performance')
        # streamlit.line_chart( performance_df[["", "", ""]] )
        m_df = performance_df[ performance_df['PERFORMANCE_RETURN_TYPE_NAME'].str.contains('Net C')][["PERFORMANCE_ENTITY_TYPE",'RETURN_1M', 'RETURN_3M', 'RETURN_6M', 'RETURN_YTD', 'RETURN_1Y', 'RETURN_3Y','RETURN_5Y','RETURN_10Y','RETURN_SI']].melt( id_vars=['PERFORMANCE_ENTITY_TYPE'] )

        chart = alt.Chart(m_df).mark_bar().encode(
            column=alt.Column('variable' ).title('Period'),
            x=alt.X('PERFORMANCE_ENTITY_TYPE').title(''),
            y=alt.Y('value').title('Market Value ($M)'),
            color=alt.Color('PERFORMANCE_ENTITY_TYPE')
        )
        streamlit.altair_chart(chart)

        streamlit.subheader('Net Accrued Mid Day Performance')
        # streamlit.line_chart( performance_df[["", "", ""]] )
        m_df = performance_df[ performance_df['PERFORMANCE_RETURN_TYPE_NAME'].str.contains('Net A')][["PERFORMANCE_ENTITY_TYPE",'RETURN_1M', 'RETURN_3M', 'RETURN_6M', 'RETURN_YTD', 'RETURN_1Y', 'RETURN_3Y','RETURN_5Y','RETURN_10Y','RETURN_SI']].melt( id_vars=['PERFORMANCE_ENTITY_TYPE'] )

        chart = alt.Chart(m_df).mark_bar().encode(
            column=alt.Column('variable' ).title('Period'),
            x=alt.X('PERFORMANCE_ENTITY_TYPE').title(''),
            y=alt.Y('value').title('Market Value ($M)'),
            color=alt.Color('PERFORMANCE_ENTITY_TYPE')
        )
        streamlit.altair_chart(chart)


    with ex_col2:
        streamlit.subheader('Gross Annualised Arithmetic Performance')
        # streamlit.line_chart( performance_df[["", "", ""]] )
        m_df = performance_df[ performance_df['PERFORMANCE_RETURN_TYPE_NAME'].str.contains('Gro')][["PERFORMANCE_ENTITY_TYPE",'RETURN_1M', 'RETURN_3M', 'RETURN_6M', 'RETURN_YTD', 'RETURN_1Y', 'RETURN_3Y','RETURN_5Y','RETURN_10Y','RETURN_SI']].melt( id_vars=['PERFORMANCE_ENTITY_TYPE'] )

        chart = alt.Chart(m_df).mark_bar().encode(
            column=alt.Column('variable' ).title('Period'),
            x=alt.X('PERFORMANCE_ENTITY_TYPE').title(''),
            y=alt.Y('value').title('Market Value ($M)'),
            color=alt.Color('PERFORMANCE_ENTITY_TYPE')
        )
        streamlit.altair_chart(chart)


# with t_attr:
#     streamlit.subheader("Exposure")
#
# with t_exposure:
#     selected_date = streamlit.selectbox(
#         'Exposure Type',
#          ('🌎 Portfolio Geographic Exposure',
#           '📈 Equity Geographic Exposure',
#           'Fixed Income Geographic Exposure',
#           'Fixed Income Exposures'
#           ),
#         index=None,
#         placeholder="Select Exposure Report...",
#         label_visibility='collapsed'
#     )
#
with t_data:
    streamlit.dataframe(df, use_container_width=True, hide_index=True, column_config={"Effective Date": None, "Code": None, "Name":None} )

with benchmark_tab:
    streamlit.dataframe(benchmark_df, hide_index=True, column_config={"DATE_KEY": None})

with performance_tab:
    streamlit.dataframe(performance_df, hide_index=True, column_config={"DATE_KEY": None, "PORTFOLIO_CODE": None, "PORTFOLIO_LEGAL_NAME":None})