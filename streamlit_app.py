import streamlit
import pandas as pd
from snowflake.snowpark import Session
import numpy as np
from PIL import Image
streamlit.set_page_config(page_title="Portfolio Viewer",layout="wide")

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

    options = streamlit.multiselect(
        'Select Portfolios',
        # ['HAXJ', 'USEQ', 'GDAP','GLBD'],
        portfolios,
        placeholder="Select Portfolio..."
    )
    # lookthrough = streamlit.checkbox('Holdings Look through',help='tooltip_text')
    lookthrough = streamlit.toggle('Account Lookthrough', help='Something')

    streamlit.divider()
    # image = Image.open('images/snowflake.png')
    # streamlit.image(image, width=200)

in_str = '('
for opt in options:
    in_str = in_str + " '" + opt + "', "
in_str = in_str + "'')"

# streamlit.write (in_str)
# stmt = "select * from DW.WIDE_HOLDINGS where DATE_KEY = 20230930 AND PORTFOLIO_CODE IN " + in_str
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

stmt = stmt + in_str
df = snow.query(stmt)

streamlit.subheader('Holdings Lookthrough: 2023/09/30, Portfolios: ' + in_str)

tab1, tab2, tab3, tab4 = streamlit.tabs(["📀 Holdings Data ", "💲Asset Class ", "📈Exposure By Country ", "📈Exposure By Security Type"])
with tab1:
    # streamlit.subheader("Portfolio Holdings")
    # Display the table on the page.
    # output = df.to_pandas()
    streamlit.dataframe(df, use_container_width=True)

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
