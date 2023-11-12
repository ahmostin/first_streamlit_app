import streamlit
import pandas
from snowflake.snowpark import Session
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


col1, col2 = streamlit.columns(2)
with col1:
    image = Image.open('images/cutter-associates-logo.webp')
    streamlit.image(image, width=100)

    options = streamlit.multiselect(
        'Select Portfolios',
        ['HAXJ', 'USEQ', 'GDAP','GLBD'],
        placeholder="Select Portfolio..."
    )

with col2:
    image = Image.open('images/snowflake.png')
    streamlit.image(image, width=200)

    stmt = "select distinct( TO_DATE( TO_CHAR( DATE_KEY) , 'YYYYMMDD') )  as Effective_Date  from DW.WIDE_HOLDINGS"
    df = snow.query(stmt)

    selected_date = streamlit.selectbox(
        'Select Date',
         (df),
        # ('2023/09/30', '2023/10/30', '2023/11/30'),
        index=None,
        placeholder="Select Effective Date..."
    )
    lookthrough = streamlit.checkbox('Holdings Look through',help='tooltip_text')

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
    COUNTRY_OF_DOMICILE as "Country_CD",
    COUNTRY_NAME,
    REGION,   
    GICS_SECTOR_LEVEL1,
    GICS_SECTOR_LEVEL2,
    GICS_SECTOR_LEVEL3,
    GICS_SECTOR_LEVEL4,
    ASSET_CLASS_LEVEL1,
    ASSET_CLASS_LEVEL2,
    ASSET_CLASS_LEVEL3,
    ISSUER_NAME as "Issuer",
    Quantity,
    Price,
    Market_Value,
    Portfolio_Value,
    Portfolio_Weight as "Weight",
    LOOKTHROUGH as "Lookthrough",
    LOOKTHROUGH_PORTFOLIO as ETF_PORT_ID
    from DW.WIDE_HOLDINGS where DATE_KEY = 20230930 AND PORTFOLIO_CODE IN '''

stmt = stmt + in_str
df = snow.query(stmt)

#streamlit.subheader('Holdings Lookthrough: 2023/09/30, Portfolios: ' + in_str)

tab1, tab2, tab3, tab4 = streamlit.tabs(["🗃Holdings ", "Asset Class ", "📈Exposure By Country ", "📈Exposure By Security Type"])
with tab1:
    streamlit.header("Portfolio Holdings")
    # Display the table on the page.
    # output = df.to_pandas()
    streamlit.dataframe(df, use_container_width=True)

with tab2:
    streamlit.header("Asset Type breakdown")
    asset_col1, asset_col2 = streamlit.columns(2)

    with asset_col1:
        streamlit.subheader('Some Selection Criteria')
        # Some distinct set of countries from the database.

    with asset_col2:
        streamlit.subheader('Some Result set')
        streamlit.bar_chart({"data": [1, 5, 2, 6, 2, 1]})


with tab3:
    streamlit.header("Exposure")
    ex_col1, ex_col2 = streamlit.columns(2)

    with ex_col1:
        streamlit.subheader('Some Selection Criteria')
        # Some distinct set of countries from the database.

    with ex_col2:
        streamlit.subheader('Some Result set')
        streamlit.bar_chart({"data": [1, 5, 2, 6, 2, 1]})


with tab4:
    streamlit.header("An owl")
