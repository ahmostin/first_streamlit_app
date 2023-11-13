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
        'Get Help': 'https://www.extremelycoolapp.com/help',
        'Report a bug': "https://www.extremelycoolapp.com/bug",
        'About':
''' ### Portfolio Analytics Viewer     
    * [Data glossary](https://purview.microsoft.com)
    * [Snowflake](https://pejhwwn-lt54429.snowflakecomputing.com)
    * [Power BI]())
    * [Coalese.io]()
    * [DBT Cloud]()
    
    > Copyright (c) Cutter Associates 2023.
    
'''

    }
)

#@streamlit.cache_resource
def get_snow():
    return streamlit.connection("snowflake")

snow = get_snow()

#@streamlit.cache_data  # 👈 Add the caching decorator
def get_portfolios():
    stmt = "select portfolio_code as ID, portfolio_short_name as Name from DW.DIM_PORTFOLIO"
    return snow.query(stmt)

portfolios = get_portfolios()

# TODO:  Generate a list of portfolios with the code & name combined.
# need to identify if CODE can be selected based on the INDEX selected rather than the value.
# Then populate the Portfolio selection selectbox
stmt = "select distinct( TO_DATE( TO_CHAR( DATE_KEY) , 'YYYYMMDD') )  as Effective_Date  from DW.WIDE_HOLDINGS"
df = snow.query(stmt)

with streamlit.sidebar:
    image = Image.open('images/cutter-associates-logo.webp')
    streamlit.image(image, width=100)
    streamlit.divider()

    # TODO default to current system effective date.
    selected_date = streamlit.selectbox(
        'Effective Date',
        (df),
        # ('2023/09/30', '2023/10/30', '2023/11/30'),
        index=0,
        placeholder="Select Effective Date..."
    )

    portfolio = streamlit.selectbox(
        'Select Portfolios',
        (portfolios['NAME']),
        placeholder="Select Portfolio..."
    )

    idx= portfolios.index[portfolios['NAME']==portfolio].tolist()
    portfolio_id = portfolios.loc[idx[0]]['ID']

    # lookthrough = streamlit.checkbox('Holdings Look through',help='tooltip_text')
    lookthrough = streamlit.toggle('Account Lookthrough', help='When active enables looking through funds into underlying securities')

    streamlit.divider()
    # image = Image.open('images/snowflake.png')
    # streamlit.image(image, width=200)

stmt = '''select
    TO_DATE( TO_CHAR(DATE_KEY), 'YYYYMMDD') as "Effective Date",
    PORTFOLIO_CODE as "Code",
    PORTFOLIO_LEGAL_NAME as "Name",
    SECURITY_NAME as "Security",
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

df = snow.query(stmt)
streamlit.subheader("Portfolio: " + portfolio)
t_overview, tab2, tab3, tab4,t_exposure, t_data = streamlit.tabs(["Overview ", "💲Asset Allocation ", "📈Performance ", "📈Attribution ", "Exposures ", "📀 Holdings Data "])
with t_overview:
    overview_1, overview_2 = streamlit.columns(2)

    with overview_1:
        # col1, col2, col3 = streamlit.columns(3)
        # col1.metric("Market Value", "70 M$", "1.2 M$")
        # col2.metric("Wind", "9 mph", "-8%")
        # col3.metric("Humidity", "86%", "4%")
        #
        # streamlit.markdown("""
        #     <style>
        #     [data-testid=column]:nth-of-type(1) [data-testid=stVerticalBlock]{
        #         gap: 0rem;
        #     }
        #     </style>
        #     """,unsafe_allow_html=True)
        # streamlit.divider()

        "Investment Strategy: "
        "Benchmark: "
        "Assets Under Management: "
        "Base Currency"
        streamlit.divider()
        "Investment Objective"

        "Market Review"

    with overview_2:
        streamlit.markdown("""
            <style>
            [data-testid=column]:nth-of-type(1) [data-testid=stVerticalBlock]{
                gap: 0rem;
            }
            </style>
            """,unsafe_allow_html=True)
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
                    "data": [
                        {"value": 1048, "name": "Equity 52.82%"},
                        {"value": 735, "name": "Fixed Income 32.82%"},
                        {"value": 580, "name": "Alternatives 16.82%"},
                        {"value": 484, "name": "Cash and Equivalents 12.82%"},
                        ],
                    }
                ],
            }
        echarts.st_echarts(
            options=chart_option, height="500px",
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
        streamlit.subheader('Weight By Asset Class')
        # Some distinct set of countries from the database.
        streamlit.dataframe(agg_ass, use_container_width=True)

    with asset_col2:
        # streamlit.subheader('Some Result set')
        # streamlit.write(agg_ass.columns)

        chart_data = pd.DataFrame(
            {
                "Relative": ["Fund","Benchmark"] * 3,
                "Weight": np.random.randn(6),
                "Asset Class": ["Fixed Income"] * 2 + ["Equity"] * 2 + ["ETF"] * 2,
            }
        )

        streamlit.bar_chart(chart_data, x="Relative", y="Weight", color="Asset Class")

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
    streamlit.dataframe(df, use_container_width=True, hide_index=True,)

    data_df = pd.DataFrame(
        {
            "sales": [
                [0, 4, 26, 80, 100, 40],
                [80, 20, 80, 35, 40, 100],
                [10, 20, 80, 80, 70, 0],
                [10, 100, 20, 100, 30, 100],
            ],
        }
    )

    streamlit.data_editor(
        data_df,
        column_config={
            "sales": streamlit.column_config.LineChartColumn(
                "Sales (last 6 months)",
                help="The sales volume in the last 6 months",
                y_min=0,
                y_max=100,
            ),
        },
        hide_index=True,
    )
