USE EMISSARY_DB;
CREATE SCHEMA DW;

CREATE  or replace TABLE DW.DIM_ACCOUNT ( 
	ACCOUNT_KEY          integer NOT NULL   ,
	ACCOUNT_NUMBER       varchar(30)    ,
	ACCOUNT_NAME         varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_ACCOUNT_ACCOUNT_KEY PRIMARY KEY ( ACCOUNT_KEY )
 );

CREATE  or replace TABLE DW.DIM_ATTRIBUTION_METHOD ( 
	ATTRIBUTION_METHOD_KEY integer NOT NULL   ,
	ATTRIBUTION_METHOD_NAME varchar(100)    ,
	ATTRIBUTION_METHOD_DESCRIPTION varchar(200)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_ATTRIBUTION_METHOD_ATTRIBUTION_METHOD_KEY PRIMARY KEY ( ATTRIBUTION_METHOD_KEY )
 );

CREATE  or replace TABLE DW.DIM_BENCHMARK ( 
	BENCHMARK_KEY        integer NOT NULL   ,
	BENCHMARK_CODE       varchar(50) NOT NULL   ,
	BENCHMARK_NAME       varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	IS_CURRENT           boolean    ,
	CONSTRAINT PK_DIM_BENCHMARK_BENCHMARK_KEY PRIMARY KEY ( BENCHMARK_KEY )
 );

CREATE  or replace TABLE DW.DIM_BROKER ( 
	BROKER_KEY           integer NOT NULL   ,
	BROKER_CODE          varchar(30)    ,
	BROKER_NAME          varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_BROKER_BROKER_KEY PRIMARY KEY ( BROKER_KEY )
 );

CREATE  or replace TABLE DW.DIM_CLIENT ( 
	CLIENT_KEY           integer NOT NULL   ,
	CLIENT_NAME          varchar(100)    ,
	CLIENT_DESCRIPTION   varchar(16777216)    ,
	STREET_ADDRESS       varchar(100)    ,
	CITY                 varchar(50)    ,
	STATE                varchar(50)    ,
	ZIP_CODE             varchar(20)    ,
	TELEPHONE_NUMBER     varchar(30)    ,
	CONTACT_NAME         varchar(50)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_CLIENT_CLIENT_KEY PRIMARY KEY ( CLIENT_KEY )
 );

CREATE  or replace TABLE DW.DIM_COUNTRY ( 
	COUNTRY_KEY          integer NOT NULL   ,
	COUNTRY_CODE         varchar(5)    ,
	COUNTRY_NAME         varchar(100)    ,
	REGION               varchar(50)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_COUNTRY_COUNTRY_KEY PRIMARY KEY ( COUNTRY_KEY )
 );

CREATE  or replace TABLE DW.DIM_CURRENCY ( 
	CURRENCY_KEY         integer NOT NULL   ,
	CURRENCY_CODE        varchar(5)    ,
	CURRENCY_NAME        varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_CURRENCY_CURRENCY_KEY PRIMARY KEY ( CURRENCY_KEY )
 );

CREATE  or replace TABLE DW.DIM_CUSTOM_ATTRIBUTION_FACTOR ( 
	ATTRIBUTION_FACTOR_KEY integer NOT NULL   ,
	ATTRIBUTION_FACTOR_LEVEL1 varchar(100)    ,
	ATTRIBUTION_FACTOR_LEVEL2 varchar(100)    ,
	ATTRIBUTION_FACTOR_LEVEL3 varchar(100)    ,
	ATTRIBUTION_FACTOR_LEVEL4 varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_ATTRIBUTION_FACTOR_ATTRIBUTION_FACTOR_KEY PRIMARY KEY ( ATTRIBUTION_FACTOR_KEY )
 );

CREATE  or replace TABLE DW.DIM_DATE ( 
	DATE_KEY             integer NOT NULL   ,
	DATE                 date NOT NULL   ,
	DAY                  integer    ,
	WEEKDAY_NAME         varchar(20)    ,
	WEEK_NUMBER          integer    ,
	MONTH_NUMBER         integer    ,
	MONTH_NAME           varchar(10)    ,
	QUARTER              varchar(5)    ,
	YEAR                 integer    ,
	WEEKDAY_FLAG         boolean    ,
	MONTH_END_FLAG       boolean    ,
	QUARTER_END_FLAG     boolean    ,
	CONSTRAINT PK_DIM_DATE_DATE_KEY PRIMARY KEY ( DATE_KEY )
 );

CREATE  or replace TABLE DW.DIM_ISSUER ( 
	ISSUER_KEY           integer NOT NULL   ,
	ISSUER_ID            varchar(20)    ,
	ISSUER_NAME          varchar(100)    ,
	ISSUER_LEI           varchar(50)    ,
	FACTSET_ENTITY_ID    varchar(50)    ,
	HEADQUARTERS_STREET_ADDRESS varchar(100)    ,
	HEADQUARTERS_CITY    varchar(50)    ,
	HEADQUARTERS_STATE   varchar(50)    ,
	HEADQUARTERS_ZIP_CODE varchar(20)    ,
	HEADQUARTERS_COUNTRY_CODE varchar(5)    ,
	PARENT_ISSUER_ID     varchar(50)    ,
	PARENT_ISSUER_NAME   varchar(100)    ,
	ULTIMATE_PARENT_ISSUER_ID varchar(50)    ,
	ULTIMATE_PARENT_ISSUER_NAME varchar(100)    ,
	COUNTRY_OF_RISK      varchar(5)    ,
	COUNTRY_OF_DOMICILE  varchar(5)    ,
	COUNTRY_OF_INCORPORATION varchar(5)    ,
	GICS_SECTOR_LEVEL1   varchar(100)    ,
	GICS_SECTOR_LEVEL2   varchar(100)    ,
	GICS_SECTOR_LEVEL3   varchar(100)    ,
	GICS_SECTOR_LEVEL4   varchar(100)    ,
	ICE_SECTOR_LEVEL1    varchar(100)    ,
	ICE_SECTOR_LEVEL2    varchar(100)    ,
	ICE_SECTOR_LEVEL3    varchar(100)    ,
	ICE_SECTOR_LEVEL4    varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_ISSUER_ISSUER_KEY PRIMARY KEY ( ISSUER_KEY )
 );

CREATE  or replace TABLE DW.DIM_PERFORMANCE_RETURN_PERIOD ( 
	PERFORMANCE_RETURN_PERIOD_KEY integer NOT NULL   ,
	PERFORMANCE_RETURN_PERIOD_CODE varchar(30)    ,
	PERFORMANCE_RETURN_PERIOD_NAME varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_PERFORMANCE_RETURN_PERIOD_PERFORMANCE_RETURN_PERIOD_KEY PRIMARY KEY ( PERFORMANCE_RETURN_PERIOD_KEY )
 );

CREATE  or replace TABLE DW.DIM_PERFORMANCE_RETURN_TYPE ( 
	PERFORMANCE_RETURN_TYPE_KEY integer NOT NULL   ,
	PERFORMANCE_RETURN_TYPE_NAME varchar(100)    ,
	PERFORMANCE_RETURN_TYPE_DESCRIPTION varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_PERFORMANCE_TYPE_PERFORMANCE_TYPE_KEY PRIMARY KEY ( PERFORMANCE_RETURN_TYPE_KEY )
 );

CREATE  or replace TABLE DW.DIM_PORTFOLIO ( 
	PORTFOLIO_KEY        integer NOT NULL   ,
	PORTFOLIO_CODE       varchar(50) NOT NULL   ,
	PORTFOLIO_LEGAL_NAME varchar(200)    ,
	PORTFOLIO_SHORT_NAME varchar(100)    ,
	PORTFOLIO_STATUS     varchar(30)    ,
	PORTFOLIO_TYPE       varchar(30)    ,
	BASE_CURRENCY        varchar(10)    ,
	INCEPTION_DATE       date    ,
	BENCHMARK_CODE       varchar(50)    ,
	PORTFOLIO_GROUP      varchar(100)    ,
	LEGAL_STRUCTURE      varchar(100)    ,
	TAX_EXEMPT_INDICATOR boolean    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_PORTFOLIO PRIMARY KEY ( PORTFOLIO_KEY )
 );

CREATE  or replace TABLE DW.DIM_PRODUCT ( 
	PRODUCT_KEY          integer NOT NULL   ,
	PRODUCT_NAME         varchar(100)    ,
	PRODUCT_DESCRIPTION  varchar(50)    ,
	PRODUCT_LEGAL_STRUCTURE varchar(16777216)    ,
	PRODUCT_FEE_STRUCTURE varchar(100)    ,
	PRODUCT_REGULATOR    varchar(100)    ,
	INVESTMENT_TEAM      varchar(100)    ,
	INVESTMENT_STRATEGY  varchar(100)    ,
	INVESTMENT_VEHICLE   varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          timestamp_ntz(9)    ,
	CONSTRAINT PK_DIM_PRODUCT_PRODUCT_KEY PRIMARY KEY ( PRODUCT_KEY )
 );

CREATE  or replace TABLE DW.DIM_SECTOR ( 
	SECTOR_KEY           integer NOT NULL   ,
	CLASSIFICATION_SCHEME varchar(50)    ,
	SECTOR_CODE_LEVEL1   varchar(50)    ,
	SECTOR_CODE_LEVEL2   varchar(50)    ,
	SECTOR_CODE_LEVEL3   varchar(50)    ,
	SECTOR_CODE_LEVEL4   varchar(50)    ,
	SECTOR_NAME_LEVEL1   varchar(100)    ,
	SECTOR_NAME_LEVEL2   varchar(100)    ,
	SECTOR_NAME_LEVEL3   varchar(100)    ,
	SECTOR_NAME_LEVEL4   varchar(100)    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_DIM_SECTOR_SECTOR_KEY PRIMARY KEY ( SECTOR_KEY )
 );

CREATE  or replace TABLE DW.DIM_SECURITY ( 
	SECURITY_KEY         integer NOT NULL   ,
	SECURITY_NAME        varchar(100)    ,
	SECURITY_TYPE        varchar(50)    ,
	PORTFOLIO_CODE       varchar(50)    ,
	ISIN                 varchar(20)    ,
	SEDOL                varchar(20)    ,
	CUSIP                varchar(20)    ,
	TICKER               varchar(20)    ,
	BLOOMBERG_ID         varchar(30)    ,
	FACTSET_ID           varchar(30)    ,
	ISSUER_KEY           integer    ,
	ASSET_CLASS_LEVEL1   varchar(50)    ,
	ASSET_CLASS_LEVEL2   varchar(50)    ,
	ASSET_CLASS_LEVEL3   varchar(50)    ,
	CURRENCY_CODE        varchar(5)    ,
	COUNTRY_OF_RISK      varchar(5)    ,
	COUNTRY_OF_DOMICILE  varchar(5)    ,
	GICS_SECTOR_LEVEL1   varchar(100)    ,
	GICS_SECTOR_LEVEL2   varchar(100)    ,
	GICS_SECTOR_LEVEL3   varchar(100)    ,
	GICS_SECTOR_LEVEL4   varchar(100)    ,
	ICE_SECTOR_LEVEL1    varchar(100)    ,
	ICE_SECTOR_LEVEL2    varchar(100)    ,
	ICE_SECTOR_LEVEL3    varchar(100)    ,
	ICE_SECTOR_LEVEL4    varchar(100)    ,
	SANDP_RATING_LONG_TERM varchar(10)    ,
	SANDP_RATING_SHORT_TERM varchar(10)    ,
	MOODYS_RATING_LONG_TERM varchar(10)    ,
	MOODYS_RATING_SHORT_TERM varchar(10)    ,
	FITCH_RATING_LONG_TERM varchar(10)    ,
	FITCH_RATING_SHORT_TERM varchar(10)    ,
	MATURITY_DATE        date    ,
	VALID_FROM           timestamp_ntz(9)    ,
	VALID_TO             timestamp_ntz(9)    ,
	LATEST_FLAG          boolean    ,
	CONSTRAINT PK_SECURITY PRIMARY KEY ( SECURITY_KEY )
 );

CREATE  or replace TABLE DW.FACT_BENCHMARK_CONSTITUENT ( 
	DATE_KEY             integer NOT NULL   ,
	BENCHMARK_KEY        integer NOT NULL   ,
	SECURITY_KEY         integer NOT NULL   ,
	WEIGHT               number(15,10) NOT NULL   ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_BENCHMARK_CONSTITUENT PRIMARY KEY ( DATE_KEY, BENCHMARK_KEY, SECURITY_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP ( 
	CLIENT_KEY           integer NOT NULL   ,
	ACCOUNT_KEY          integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	PRODUCT_KEY          integer NOT NULL   ,
	DESCRIPTION          varchar(100)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_PORTFOLIO_ACCOUNT_CLIENT_RELATIONSHIP_ACCOUNT_KEY PRIMARY KEY ( ACCOUNT_KEY, CLIENT_KEY, PORTFOLIO_KEY, PRODUCT_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_HOLDING ( 
	DATE_KEY             integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	SECURITY_KEY         integer NOT NULL   ,
	QUANTITY             number(20,6)    ,
	PRICE_BASE_CCY       number(20,6)    ,
	PRICE_LOCAL_CCY      number(20,6)    ,
	MARKET_VALUE_BASE_CCY number(20,6) NOT NULL   ,
	MARKET_VALUE_LOCAL_CCY number(20,6) NOT NULL   ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_HOLDING PRIMARY KEY ( DATE_KEY, PORTFOLIO_KEY, SECURITY_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ( 
	DATE_KEY             integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	PERFORMANCE_RETURN_PERIOD_KEY integer NOT NULL   ,
	ATTRIBUTION_METHOD_KEY integer NOT NULL   ,
	ATTRIBUTION_FACTOR_KEY integer NOT NULL   ,
	PORTFOLIO_WEIGHT     number(15,10)    ,
	PORTFOLIO_CONTRIBUTION number(15,10)    ,
	BENCHMARK_WEIGHT     number(15,10)    ,
	BENCHMARK_CONTRIBUTION number(15,10)    ,
	DURATION_EFFECT      number(15,10)    ,
	YIELD_CURVE_EFFECT   number(15,10)    ,
	ALLOCATION_EFFECT    number(15,10)    ,
	SELECTION_EFFECT     number(15,10)    ,
	FX_EFFECT            number(15,10)    ,
	TOTAL_EFFECT         number(15,10)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_PERFORMANCE_ATTRIBUTION_DATE_KEY PRIMARY KEY ( DATE_KEY, PORTFOLIO_KEY, PERFORMANCE_RETURN_PERIOD_KEY, ATTRIBUTION_METHOD_KEY, ATTRIBUTION_FACTOR_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_PERFORMANCE_RETURN ( 
	DATE_KEY             integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	PERFORMANCE_RETURN_TYPE_KEY integer NOT NULL   ,
	PERFORMANCE_ENTITY_TYPE varchar(30) NOT NULL   ,
	RETURN_1M            number(20,10)    ,
	RETURN_3M            number(20,10)    ,
	RETURN_6M            number(20,10)    ,
	RETURN_YTD           number(20,10)    ,
	RETURN_1Y            number(20,10)    ,
	RETURN_3Y            number(20,10)    ,
	RETURN_5Y            number(20,10)    ,
	RETURN_10Y           number(20,10)    ,
	RETURN_SI            number(20,10)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_PERFORMANCE_RETURN_DATE_KEY PRIMARY KEY ( DATE_KEY, PORTFOLIO_KEY, PERFORMANCE_RETURN_TYPE_KEY, PERFORMANCE_ENTITY_TYPE, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_PORTFOLIO_ANALYTIC ( 
	DATE_KEY             integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	NUMBER_OF_HOLDINGS   integer    ,
	NUMBER_OF_ISSUERS    integer    ,
	MARKET_CAP           number(20,6)    ,
	PRICE_TO_EARNING_RATIO_TTM number(20,6)    ,
	PRICE_TO_BOOK_RATIO_TTM number(20,6)    ,
	WEIGHTED_AVERAGE_COUPON number(20,6)    ,
	WEIGHTED_AVERAGE_CREDIT_QUALITY varchar(20)    ,
	CURRENT_YIELD        number(20,6)    ,
	SPREAD_DURATION      number(20,6)    ,
	EFFECTIVE_MATURITY   number(20,6)    ,
	MODIFIED_DURATION    number(20,6)    ,
	DURATION_TIMES_SPREAD number(20,6)    ,
	STANDARD_DEVIATION_1Y number(20,6)    ,
	SHARPE_RATIO_1Y      number(20,2)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_PORTFOLIO_ANALYTIC_DATE_KEY PRIMARY KEY ( DATE_KEY, PORTFOLIO_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_PORTFOLIO_VALUATION ( 
	DATE_TIME            integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	NAV                  number(20,6)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_PORTFOLIO_VALUATION_DATE_TIME PRIMARY KEY ( DATE_TIME, PORTFOLIO_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP ( 
	PRODUCT_KEY          integer NOT NULL   ,
	PORTFOLIO_KEY        integer NOT NULL   ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_PRODUCT_DEFINITI_PRODUCT_KEY PRIMARY KEY ( PRODUCT_KEY, PORTFOLIO_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_SECURITY_ANALYTIC ( 
	DATE_KEY             integer NOT NULL   ,
	SECURITY_KEY         integer NOT NULL   ,
	YIELD_TO_MATURITY    number(20,6)    ,
	YIELD_TO_WORST       number(20,6)    ,
	MODIFIED_DURATION    number(20,6)    ,
	SPREAD_DURATION      number(20,6)    ,
	OPTION_ADJUSTED_DURATION number(20,6)    ,
	SPREAD               number(20,6)    ,
	DURATION_TIMES_SPREAD number(20,6)    ,
	COUPON               number(20,6)    ,
	WEIGHTED_AVERAGE_LIFE number(20,6)    ,
	MATURITY_BUCKET      varchar(20)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_SECURITY_ANALYTICS PRIMARY KEY ( DATE_KEY, SECURITY_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TABLE DW.FACT_TRANSACTION ( 
	TRANSACTION_KEY      varchar(50) NOT NULL   ,
	TRADE_DATE_KEY       integer NOT NULL   ,
	SETTLEMENT_DATE_KEY  integer NOT NULL   ,
	SECURITY_KEY         integer NOT NULL   ,
	BROKER_KEY           integer NOT NULL   ,
	TRANSACTION_TYPE     integer    ,
	QUANTITY             number(20,6)    ,
	PRICE                number(20,6)    ,
	AMOUNT               number(20,6)    ,
	COMMISSION           number(20,6)    ,
	DATETIME_INSERTED    timestamp_ntz(9) NOT NULL   ,
	LATEST_FLAG          boolean NOT NULL   ,
	CONSTRAINT PK_FACT_TRANSACTION PRIMARY KEY ( TRANSACTION_KEY, TRADE_DATE_KEY, SETTLEMENT_DATE_KEY, SECURITY_KEY, BROKER_KEY, DATETIME_INSERTED )
 );

CREATE  or replace TRANSIENT TABLE DW.MY_FIRST_DBT_MODEL ( 
	ID                   number(1,0)    
 );

CREATE  or replace TABLE DW.WIDE_HOLDINGS ( 
	DATE_KEY             integer    ,
	PORTFOLIO_CODE       varchar(50)    ,
	PORTFOLIO_LEGAL_NAME varchar(200)    ,
	SECURITY_NAME        varchar(100)    ,
	SECURITY_TYPE        varchar(50)    ,
	LOOKTHROUGH_PORTFOLIO_CODE varchar(50)    ,
	TICKER               varchar(20)    ,
	ISIN                 varchar(20)    ,
	CURRENCY_CODE        varchar(5)    ,
	COUNTRY_OF_DOMICILE  varchar(5)    ,
	GICS_SECTOR_LEVEL1   varchar(100)    ,
	GICS_SECTOR_LEVEL2   varchar(100)    ,
	GICS_SECTOR_LEVEL3   varchar(100)    ,
	GICS_SECTOR_LEVEL4   varchar(100)    ,
	ASSET_CLASS_LEVEL1   varchar(50)    ,
	ASSET_CLASS_LEVEL2   varchar(50)    ,
	ASSET_CLASS_LEVEL3   varchar(50)    ,
	ISSUER_ID            varchar(20)    ,
	ISSUER_NAME          varchar(100)    ,
	COUNTRY_NAME         varchar(100)    ,
	REGION               varchar(50)    ,
	QUANTITY             number(38,12)    ,
	PRICE                number(20,6)    ,
	MARKET_VALUE         number(38,12)    ,
	PORTFOLIO_VALUE      number(32,6)    ,
	PORTFOLIO_WEIGHT     number(38,12)    ,
	LOOKTHROUGH          varchar(1)    ,
	LOOKTHROUGH_PORTFOLIO varchar(50)    
 );

ALTER TABLE DW.DIM_SECURITY ADD CONSTRAINT FK_DIM_SECURITY_DIM_ISSUER FOREIGN KEY ( ISSUER_KEY ) REFERENCES DW.DIM_ISSUER( ISSUER_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_BENCHMARK_CONSTITUENT ADD CONSTRAINT FK_FACT_BENCHMARK_CONSTITUENTS_DIM_BENCHMARK FOREIGN KEY ( BENCHMARK_KEY ) REFERENCES DW.DIM_BENCHMARK( BENCHMARK_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP ADD CONSTRAINT FK_FACT_ACCOUNT_CLIENT_RELATIONSHIP_DIM_ACCOUNT FOREIGN KEY ( ACCOUNT_KEY ) REFERENCES DW.DIM_ACCOUNT( ACCOUNT_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP ADD CONSTRAINT FK_FACT_ACCOUNT_CLIENT_RELATIONSHIP_DIM_CLIENT FOREIGN KEY ( CLIENT_KEY ) REFERENCES DW.DIM_CLIENT( CLIENT_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP ADD CONSTRAINT FK_FACT_ACCOUNT_CLIENT_RELATIONSHIP_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP ADD CONSTRAINT FK_FACT_ACCOUNT_CLIENT_RELATIONSHIP_DIM_PRODUCT FOREIGN KEY ( PRODUCT_KEY ) REFERENCES DW.DIM_PRODUCT( PRODUCT_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_HOLDING ADD CONSTRAINT FK_FACT_HOLDING_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_HOLDING ADD CONSTRAINT FK_FACT_HOLDING_DIM_SECURITY FOREIGN KEY ( SECURITY_KEY ) REFERENCES DW.DIM_SECURITY( SECURITY_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_HOLDING ADD CONSTRAINT FK_FACT_HOLDING_DIM_DATE FOREIGN KEY ( DATE_KEY ) REFERENCES DW.DIM_DATE( DATE_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_COUNTRY FOREIGN KEY ( ATTRIBUTION_FACTOR_KEY ) REFERENCES DW.DIM_COUNTRY( COUNTRY_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_DATE FOREIGN KEY ( DATE_KEY ) REFERENCES DW.DIM_DATE( DATE_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_CURRENCY FOREIGN KEY ( ATTRIBUTION_FACTOR_KEY ) REFERENCES DW.DIM_CURRENCY( CURRENCY_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_SECTOR FOREIGN KEY ( ATTRIBUTION_FACTOR_KEY ) REFERENCES DW.DIM_SECTOR( SECTOR_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_ATTRIBUTION_METHOD FOREIGN KEY ( ATTRIBUTION_METHOD_KEY ) REFERENCES DW.DIM_ATTRIBUTION_METHOD( ATTRIBUTION_METHOD_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_PERFORMANCE_RETURN_PERIOD FOREIGN KEY ( PERFORMANCE_RETURN_PERIOD_KEY ) REFERENCES DW.DIM_PERFORMANCE_RETURN_PERIOD( PERFORMANCE_RETURN_PERIOD_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_ATTRIBUTION ADD CONSTRAINT FK_FACT_PERFORMANCE_ATTRIBUTION_DIM_ATTRIBUTION_FACTOR FOREIGN KEY ( ATTRIBUTION_FACTOR_KEY ) REFERENCES DW.DIM_CUSTOM_ATTRIBUTION_FACTOR( ATTRIBUTION_FACTOR_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_RETURN ADD CONSTRAINT FK_FACT_PERFORMANCE_RETURN_DIM_DATE FOREIGN KEY ( DATE_KEY ) REFERENCES DW.DIM_DATE( DATE_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_RETURN ADD CONSTRAINT FK_FACT_PERFORMANCE_RETURN_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PERFORMANCE_RETURN ADD CONSTRAINT FK_FACT_PERFORMANCE_RETURN_DIM_PERFORMANCE_RETURN_TYPE FOREIGN KEY ( PERFORMANCE_RETURN_TYPE_KEY ) REFERENCES DW.DIM_PERFORMANCE_RETURN_TYPE( PERFORMANCE_RETURN_TYPE_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PORTFOLIO_ANALYTIC ADD CONSTRAINT FK_FACT_PORTFOLIO_ANALYTIC_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PORTFOLIO_VALUATION ADD CONSTRAINT FK_FACT_PORTFOLIO_VALUATION_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP ADD CONSTRAINT FK_FACT_PRODUCT_PORTFOLIO_RELATIONSHIP_DIM_PRODUCT FOREIGN KEY ( PRODUCT_KEY ) REFERENCES DW.DIM_PRODUCT( PRODUCT_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP ADD CONSTRAINT FK_FACT_PRODUCT_PORTFOLIO_RELATIONSHIP_DIM_PORTFOLIO FOREIGN KEY ( PORTFOLIO_KEY ) REFERENCES DW.DIM_PORTFOLIO( PORTFOLIO_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE DW.FACT_TRANSACTION ADD CONSTRAINT FK_FACT_TRANSACTION_DIM_BROKER FOREIGN KEY ( BROKER_KEY ) REFERENCES DW.DIM_BROKER( BROKER_KEY ) ON DELETE NO ACTION ON UPDATE NO ACTION;

create or replace view DW.BENCHMARK_CONSTITUENTS(  DATE_KEY,  BENCHMARK_CODE,  BENCHMARK_NAME,  SECURITY_NAME,  TICKER,  ISIN,  CURRENCY_CODE,  COUNTRY_OF_DOMICILE,  GICS_SECTOR_LEVEL1,  GICS_SECTOR_LEVEL2,  GICS_SECTOR_LEVEL3,  GICS_SECTOR_LEVEL4,  WEIGHT,  ISSUER_KEY,  ISSUER_NAME,  ISSUER_ID) as select    F.DATE_KEY,   DB.benchmark_code, DB.benchmark_name,    DS.security_name, DS.Ticker, DS.ISIN, DS.currency_code, DS. country_of_domicile,    DS.gics_sector_level1, DS.gics_sector_level2, DS.gics_sector_level3, DS.gics_sector_level4,    F.Weight, DI.ISSUER_KEY, DI.ISSUER_NAME, DI.ISSUER_ID from Fact_Benchmark_Constituent F left join Dim_Benchmark DB on F.benchmark_key = DB.benchmark_key left join Dim_Portfolio DP on DB.benchmark_code = DP.benchmark_code left join Dim_Security DS on F.security_key = DS.security_key left join DIM_ISSUER DI on DS.ISSUER_KEY = DI.ISSUER_KEYorder by benchmark_code, security_name;

create or replace view DW.EXPOSURE_BY_COUNTRY(  COUNTRY_CODE,  COUNTRY_NAME,  PORTFOLIO_WEIGHT,  BENCHMARK_WEIGHT) aswith AUM as ( select sum(FH.market_value_base_ccy) as AUM   from Fact_Holding FH   join Dim_Portfolio DP on FH.portfolio_key = DP.portfolio_key), Portfolio_Weight as ( select DC.country_code, DC.country_name, sum(FH.market_value_base_ccy AUM.AUM*100) as Portfolio_Weight   from Fact_Holding FH   join Dim_Portfolio DP on FH.portfolio_key = DP.portfolio_key   join Dim_Security DS on FH.security_key = DS.security_key   left join Dim_Country DC on DS.country_of_domicile = DC.country_code   cross join AUM   group by DC.country_code, DC.country_name), Benchmark_Weight as ( select DC.country_code, DC.country_name, sum(F.Weight) as Benchmark_Weight   from Fact_Benchmark_Constituent F   join Dim_Benchmark DB on F.benchmark_key = DB.benchmark_key   join Dim_Portfolio DP on DB.benchmark_code = DP.benchmark_code   join Dim_Security DS on F.security_key = DS.security_key   left join Dim_Country DC on DS.country_of_domicile = DC.country_code   group by DC.country_code, DC.country_name) select BW.country_code, BW.country_name, PW.portfolio_weight, BW.benchmark_weight from Benchmark_Weight BW left join Portfolio_Weight PW on BW.country_code = PW.country_code order by country_code;

create or replace view DW.EXPOSURE_BY_SECTOR(  SECTOR,  PORTFOLIO_WEIGHT,  BENCHMARK_WEIGHT) as with AUM as ( select sum(FH.market_value_base_ccy) as AUM   from Fact_Holding FH   join Dim_Portfolio DP on FH.portfolio_key = DP.portfolio_key), Portfolio_Weight as ( select DS.GICS_Sector_Level1 as Sector, sum(FH.market_value_base_ccy AUM.AUM*100) as Portfolio_Weight   from Fact_Holding FH   join Dim_Portfolio DP on FH.portfolio_key = DP.portfolio_key   join Dim_Security DS on FH.security_key = DS.security_key   cross join AUM   group by DS.GICS_Sector_Level1), Benchmark_Weight as ( select DS.GICS_Sector_Level1 as Sector, sum(F.Weight) as Benchmark_Weight   from Fact_Benchmark_Constituent F   join Dim_Benchmark DB on F.benchmark_key = DB.benchmark_key   join Dim_Portfolio DP on DB.benchmark_code = DP.benchmark_code   join Dim_Security DS on F.security_key = DS.security_key   group by DS.GICS_Sector_Level1) select BW.Sector, PW.Portfolio_Weight, BW.Benchmark_Weight from Benchmark_Weight BW left join Portfolio_Weight PW on BW.Sector = PW.Sector order by BW.Sector;

create or replace view DW.FUND_LOOKTHROUGH(  DATE_KEY,  PORTFOLIO_CODE,  PORTFOLIO_LEGAL_NAME,  SECURITY_NAME,  TICKER,  ISIN,  CURRENCY_CODE,  COUNTRY_OF_DOMICILE,  GICS_SECTOR_LEVEL1,  GICS_SECTOR_LEVEL2,  GICS_SECTOR_LEVEL3,  GICS_SECTOR_LEVEL4,  ASSET_CLASS_LEVEL1,  ASSET_CLASS_LEVEL2,  ASSET_CLASS_LEVEL3,  ISSUER_ID,  ISSUER_NAME,  QUANTITY,  PRICE,  MARKET_VALUE,  PORTFOLIO_VALUE,  LOOKTHROUGH,  LOOKTHROUGH_PORTFOLIO) as with Held_Securities as  ( select FH.date_key, DP.portfolio_code, DP.portfolio_legal_name,      DS.security_name, DS.security_type, DS.portfolio_code as lookthrough_portfolio_code,     DS.ticker, DS.ISIN, DS.currency_code, DS.country_of_domicile,     DS.gics_sector_level1, DS.gics_sector_level2, DS.gics_sector_level3, DS.gics_sector_level4,     DS.ASSET_CLASS_LEVEL1, DS.ASSET_CLASS_LEVEL2, DS.ASSET_CLASS_LEVEL3,         DI.ISSUER_ID, DI.ISSUER_NAME,     FH.Quantity, FH.price_base_ccy as Price,      FH.market_value_base_ccy as Market_Value,     CALC.total_mk_value as portfolio_value,     'N' as lookthrough,      '' as LOOKTHROUGH_PORTFOLIO   from FACT_HOLDING FH   join DIM_PORTFOLIO DP on FH.portfolio_key = DP.portfolio_key   join DIM_SECURITY DS on FH.security_key = DS.security_key   join DIM_ISSUER DI on DS.issuer_key = DI.issuer_key   join (select date_key, portfolio_code, sum(MARKET_VALUE) as total_mk_value           from holdings_view         group by date_key, portfolio_code) AS CALC     ON  FH.DATE_KEY = CALC.date_key     AND  DP.portfolio_code = CALC.portfolio_code), Held_ETF as ( select lookthrough_portfolio_code, Quantity, Price, Market_Value   from Held_Securities    where security_type = 'Portfolio'), ETF_AUM as ( select sum(FH.market_value_base_ccy) as AUM   from FACT_HOLDING FH   join DIM_PORTFOLIO DP on FH.portfolio_key = DP.portfolio_key   join Held_ETF HE on DP.portfolio_code = HE.lookthrough_portfolio_code), ETF_Constituents as ( select FH.date_key, DP.portfolio_code, DP.portfolio_legal_name, DS.security_name,      DS.ticker, DS.ISIN, DS.currency_code, DS.country_of_domicile,     DS.gics_sector_level1, DS.gics_sector_level2, DS.gics_sector_level3, DS.gics_sector_level4,     DS.ASSET_CLASS_LEVEL1, DS.ASSET_CLASS_LEVEL2, DS.ASSET_CLASS_LEVEL3,     DI.ISSUER_ID, DI.ISSUER_NAME,     (FH.market_value_base_ccy ETF_AUM.AUM * HE.Market_Value)   FH.price_base_ccy as Quantity,     FH.price_base_ccy as Price,        FH.market_value_base_ccy ETF_AUM.AUM * HE.Market_Value as Market_Value,      CALC.total_mk_value as portfolio_value,     'Y' as lookthrough,     DP.portfolio_code as LOOKTHROUGH_PORTFOLIO   from FACT_HOLDING FH   join DIM_PORTFOLIO DP on FH.portfolio_key = DP.portfolio_key   join DIM_SECURITY DS on FH.security_key = DS.security_key   join DIM_ISSUER DI on DS.issuer_key = DI.issuer_key     join Held_ETF HE on DP.portfolio_code = HE.lookthrough_portfolio_code   join (select date_key, portfolio_code, sum(MARKET_VALUE) as total_mk_value           from holdings_view         group by date_key, portfolio_code) AS CALC     ON  FH.DATE_KEY = CALC.date_key     AND  DP.portfolio_code = CALC.portfolio_code    cross join ETF_AUM) select date_key,portfolio_code, portfolio_legal_name, security_name,    ticker, ISIN, currency_code, country_of_domicile,   gics_sector_level1, gics_sector_level2, gics_sector_level3, gics_sector_level4,   ASSET_CLASS_LEVEL1, ASSET_CLASS_LEVEL2, ASSET_CLASS_LEVEL3,   ISSUER_ID, ISSUER_NAME,   Quantity, Price, Market_Value,    portfolio_value,   lookthrough, lookthrough_portfolio from Held_Securities where security_type = 'Security' union select * from ETF_Constituents order by portfolio_code desc;

create or replace view DW.HOLDINGS_VIEW(  DATE_KEY,  PORTFOLIO_CODE,  PORTFOLIO_LEGAL_NAME,  SECURITY_NAME,  SECURITY_TYPE,  TICKER,  ISIN,  CURRENCY_CODE,  COUNTRY_OF_DOMICILE,  GICS_SECTOR_LEVEL1,  GICS_SECTOR_LEVEL2,  GICS_SECTOR_LEVEL3,  GICS_SECTOR_LEVEL4,  ASSET_CLASS_LEVEL1,  ASSET_CLASS_LEVEL2,  ASSET_CLASS_LEVEL3,  QUANTITY,  PRICE,  MARKET_VALUE) as select      FH.date_key,     DP.Portfolio_Code, DP.Portfolio_Legal_Name,      DS.security_name, DS.SECURITY_TYPE, DS.Ticker, DS.ISIN, DS.currency_code, DS. country_of_domicile,      DS.gics_sector_level1, DS.gics_sector_level2, DS.gics_sector_level3, DS.gics_sector_level4,     DS.ASSET_CLASS_LEVEL1, DS.ASSET_CLASS_LEVEL2, DS.ASSET_CLASS_LEVEL3,     FH.Quantity, FH.price_base_ccy as Price, FH.market_value_base_ccy as Market_Value from Fact_Holding FH join Dim_Portfolio DP on FH.portfolio_key = DP.portfolio_key join Dim_Security DS on FH.security_key = DS.security_key order by DP.portfolio_code desc, DS.security_name;

create or replace view DW.PERFORMANCE_ATTRIBUTION_BY_COUNTRY(  PORTFOLIO_CODE,  PORTFOLIO_LEGAL_NAME,  PERFORMANCE_RETURN_PERIOD_NAME,  ATTRIBUTION_METHOD_DESCRIPTION,  COUNTRY_NAME,  PORTFOLIO_WEIGHT,  PORTFOLIO_CONTRIBUTION,  BENCHMARK_WEIGHT,  BENCHMARK_CONTRIBUTION,  RELATIVE_WEIGHT,  DURATION_EFFECT,  YIELD_CURVE_EFFECT,  ALLOCATION_EFFECT,  SELECTION_EFFECT,  FX_EFFECT,  TOTAL_EFFECT) as select DP.portfolio_code, DP.portfolio_legal_name, RP.performance_return_period_name,    AM.attribution_method_description, DC.country_name,    F.portfolio_weight, F.portfolio_contribution, F.benchmark_weight, F.benchmark_contribution,   (F.portfolio_weight-F.benchmark_weight) as relative_weight,   F.duration_effect, F.yield_curve_effect, F.allocation_effect, F.selection_effect, F.fx_effect, F.total_effect from FACT_PERFORMANCE_ATTRIBUTION F join DIM_PORTFOLIO DP on F.portfolio_key = DP.portfolio_key join DIM_PERFORMANCE_RETURN_PERIOD RP on F.performance_return_period_key = RP.performance_return_period_key join DIM_ATTRIBUTION_METHOD AM on F.attribution_method_key = AM.attribution_method_key join DIM_COUNTRY DC on F.attribution_factor_key = DC.country_key order by portfolio_weight;

create or replace view DW.PERFORMANCE_RETURN(  DATE_KEY,  PORTFOLIO_CODE,  PORTFOLIO_LEGAL_NAME,  PERFORMANCE_RETURN_TYPE_NAME,  PERFORMANCE_RETURN_TYPE_DESCRIPTION,  PERFORMANCE_ENTITY_TYPE,  RETURN_1M,  RETURN_3M,  RETURN_6M,  RETURN_YTD,  RETURN_1Y,  RETURN_3Y,  RETURN_5Y,  RETURN_10Y,  RETURN_SI) as select F.date_key, DP.portfolio_code, DP.portfolio_legal_name,    RT.performance_return_type_name, RT.performance_return_type_description,   F.performance_entity_type, F.return_1m, F.return_3m, F.return_6m, F.return_ytd,    F.return_1y, F.return_3y, F.return_5y, F.return_10y, F.return_si from FACT_PERFORMANCE_RETURN F join DIM_PORTFOLIO DP on F.portfolio_key = DP.portfolio_key join DIM_PERFORMANCE_RETURN_TYPE RT on F.performance_return_type_key = RT.performance_return_type_key;

create or replace view DW.PORTFOLIO_ANALYTICS(  PORTFOLIO_CODE,  PORTFOLIO_LEGAL_NAME,  PORTFOLIO_GROUP,  INCEPTION_DATE,  BASE_CURRENCY,  BENCHMARK_CODE,  BENCHMARK_NAME,  PORTFOLIO_STATUS,  PORTFOLIO_TYPE,  NUMBER_OF_HOLDINGS,  NUMBER_OF_ISSUERS,  MARKET_CAP,  PRICE_TO_EARNING_RATIO_TTM,  WEIGHTED_AVERAGE_COUPON,  WEIGHTED_AVERAGE_CREDIT_QUALITY,  CURRENT_YIELD,  SPREAD_DURATION,  EFFECTIVE_MATURITY,  MODIFIED_DURATION,  DURATION_TIMES_SPREAD,  STANDARD_DEVIATION_1Y,  SHARPE_RATIO_1Y,  LATEST_FLAG) as select DP.portfolio_code, DP.portfolio_legal_name, DP.portfolio_group, DP.inception_date,    DP.base_currency, DP.benchmark_code, DB.BENCHMARK_NAME,   DP.portfolio_status, DP.portfolio_type,    F.number_of_holdings, F.number_of_issuers, F.market_cap,    F.price_to_earning_ratio_ttm,   F.weighted_average_coupon, F.weighted_average_credit_quality,   F.current_yield, F.spread_duration, F.effective_maturity, F.modified_duration,   F.duration_times_spread, F.standard_deviation_1y, F.sharpe_ratio_1y,   DP.LATEST_FLAG from DIM_PORTFOLIO DP  left join FACT_PORTFOLIO_ANALYTIC F on DP.portfolio_key = F.portfolio_key left join DIM_BENCHMARK DB on DP.benchmark_code = DB.benchmark_code where DP.LATEST_FLAG = 'TRUE';

create or replace view DW.SECURITY_ANALYTIC(  SECURITY_NAME,  COUNTRY_OF_DOMICILE,  CURRENCY_CODE,  GICS_SECTOR_LEVEL1,  GICS_SECTOR_LEVEL2,  GICS_SECTOR_LEVEL3,  GICS_SECTOR_LEVEL4,  MATURITY_DATE,  YIELD_TO_MATURITY,  YIELD_TO_WORST,  MODIFIED_DURATION,  SPREAD_DURATION,  OPTION_ADJUSTED_DURATION,  SPREAD,  DURATION_TIMES_SPREAD,  COUPON,  WEIGHTED_AVERAGE_LIFE,  MATURITY_BUCKET) as select DS.security_name, DS.country_of_domicile, DS.currency_code,    DS.gics_sector_level1, DS.gics_sector_level2, DS.gics_sector_level3, DS.gics_sector_level4, DS.maturity_date,   F.yield_to_maturity, F.yield_to_worst, F.modified_duration, F.spread_duration,   F.option_adjusted_duration, F.spread, F.duration_times_spread, F.coupon, F.weighted_average_life, F.maturity_bucket from FACT_SECURITY_ANALYTIC F join DIM_SECURITY DS on F.security_key = DS.security_key where F.date_key = 20230930 order by security_name;

COMMENT ON TABLE DW.DIM_ACCOUNT IS 'Contains the client accounts. A client can have multiple accounts. An account can belong to multiple clients (Ref: CAPE Data POV Deck 4x3 slide 19).';

COMMENT ON COLUMN DW.DIM_ACCOUNT.ACCOUNT_KEY IS 'Unique identifier for an account in Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_ACCOUNT.ACCOUNT_NUMBER IS 'The account number in the CRM system e.g. Salesforce';

COMMENT ON COLUMN DW.DIM_ACCOUNT.ACCOUNT_NAME IS 'The name of the client account from the CRM system e.g. Salesforce';

COMMENT ON COLUMN DW.DIM_ACCOUNT.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_ACCOUNT.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_ACCOUNT.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this broker, 0 otherwise';

COMMENT ON TABLE DW.DIM_ATTRIBUTION_METHOD IS 'This dimension contains the methodology/approach used in calculating performance attribution, i.e. how much contribution each country/currency/sector. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_ATTRIBUTION_METHOD.ATTRIBUTION_METHOD_KEY IS 'The unique identifier for attribution method in the Showflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_ATTRIBUTION_METHOD.ATTRIBUTION_METHOD_NAME IS 'By what factor the performance return is allocated e.g. by country, by currency, or by sector e.g. by country (excluding Japan), by currency, by fixed income sector, by GICS sector';

COMMENT ON COLUMN DW.DIM_ATTRIBUTION_METHOD.ATTRIBUTION_METHOD_DESCRIPTION IS 'Full description of the Attribution Method Name field, explaining any exceptions in the calculation, which yield curve is used, what duration is used (spread/modified/effective), carry/FX rate impact, etc.';

COMMENT ON COLUMN DW.DIM_ATTRIBUTION_METHOD.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_ATTRIBUTION_METHOD.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_ATTRIBUTION_METHOD.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this attribution method, 0 otherwise';

COMMENT ON TABLE DW.DIM_BENCHMARK IS 'Contains benchmark code and name.\nSCD type: type 2.';

COMMENT ON COLUMN DW.DIM_BENCHMARK.BENCHMARK_KEY IS 'Unique identifier for a benchmark in Snowflake data warehouse (integer, primary key)';

COMMENT ON COLUMN DW.DIM_BENCHMARK.BENCHMARK_CODE IS 'The benchmark code from Rimes or MSCI';

COMMENT ON COLUMN DW.DIM_BENCHMARK.BENCHMARK_NAME IS 'The benchmark name from Rimes or MSCI';

COMMENT ON COLUMN DW.DIM_BENCHMARK.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_BENCHMARK.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_BENCHMARK.IS_CURRENT IS 'For slowly changing dimension type 2: 1 if the row the the current/latest row for this portfolio, 0 otherwise';

COMMENT ON TABLE DW.DIM_BROKER IS 'Contains the brokers involved in the purchase or sale of securities/holdings. This dimension is used in the transaction fact table. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_BROKER.BROKER_KEY IS 'Unique identifier for a broker in the Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_BROKER.BROKER_CODE IS 'Unique identifier for a broker from the source system';

COMMENT ON COLUMN DW.DIM_BROKER.BROKER_NAME IS 'Name of the brokerage firm';

COMMENT ON COLUMN DW.DIM_BROKER.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_BROKER.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_BROKER.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this broker, 0 otherwise';

COMMENT ON TABLE DW.DIM_CLIENT IS 'Contains clients and prospects, which can be a firm, an office, or a financial advisor (or advisory team). A client can have no account, no product, no portfolio (i.e. still a prospect). A client can have multiple accounts. An account can belong to multiple clients (Ref: CAPE Data POV Deck 4x3 slide 19).';

COMMENT ON COLUMN DW.DIM_CLIENT.CLIENT_KEY IS 'Unique identifier for a client in Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_CLIENT.CLIENT_NAME IS 'The company name of the client office/firm/advisor';

COMMENT ON COLUMN DW.DIM_CLIENT.CLIENT_DESCRIPTION IS 'Describe the client e.g. a group of financial advisors who collectively service an investor, or a company that offers investment services through financial advisors';

COMMENT ON COLUMN DW.DIM_CLIENT.STREET_ADDRESS IS 'Location of the client''s office';

COMMENT ON COLUMN DW.DIM_CLIENT.CITY IS 'Location of the client''s office';

COMMENT ON COLUMN DW.DIM_CLIENT.STATE IS 'Location of the client''s office';

COMMENT ON COLUMN DW.DIM_CLIENT.ZIP_CODE IS 'Location of the client''s office';

COMMENT ON COLUMN DW.DIM_CLIENT.TELEPHONE_NUMBER IS 'The company telephone number';

COMMENT ON COLUMN DW.DIM_CLIENT.CONTACT_NAME IS 'Name of the contact person';

COMMENT ON COLUMN DW.DIM_CLIENT.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_CLIENT.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_CLIENT.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this broker, 0 otherwise';

COMMENT ON TABLE DW.DIM_COUNTRY IS 'Contains 249 countries from ISO 3166. Also contains region i.e. Asia Pacific, EMEA, North/South America. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_COUNTRY.COUNTRY_KEY IS 'Unique identifier for a country in the Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_COUNTRY.COUNTRY_CODE IS '2 character country code from ISO 3166 e.g. FR for France';

COMMENT ON COLUMN DW.DIM_COUNTRY.COUNTRY_NAME IS 'ISO 3166 country name (not the formal/UN country name) e.g. China, not The People''s Republic of China';

COMMENT ON COLUMN DW.DIM_COUNTRY.REGION IS 'APAC (Asia-Pacific), EMEA (Europe, the Middle East and Africa), NA (North America), LATAM (Latin America)';

COMMENT ON COLUMN DW.DIM_COUNTRY.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_COUNTRY.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_COUNTRY.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this country, 0 otherwise';

COMMENT ON TABLE DW.DIM_CURRENCY IS 'Contains 300 currencies from ISO 4217. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_CURRENCY.CURRENCY_KEY IS 'Unique identifier for a currency in the Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_CURRENCY.CURRENCY_CODE IS '3 character currency codes from ISO 4217 e.g. CHF, AUD';

COMMENT ON COLUMN DW.DIM_CURRENCY.CURRENCY_NAME IS 'Name of the currency from ISO 4217, e.g. Swiss Frank, Australian Dollar';

COMMENT ON COLUMN DW.DIM_CURRENCY.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_CURRENCY.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_CURRENCY.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this currency, 0 otherwise';

COMMENT ON TABLE DW.DIM_CUSTOM_ATTRIBUTION_FACTOR IS 'Contains custom attribution factors (instead of the standard country/currency/sector), up to 4 levels. For example: GICS sector as level 1 and country as level 2.';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.ATTRIBUTION_FACTOR_KEY IS 'The unique identifier for the attribution factor dimension (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.ATTRIBUTION_FACTOR_LEVEL1 IS 'The highest level of attribution factor hierarchy';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.ATTRIBUTION_FACTOR_LEVEL2 IS 'The second highest level of attribution factor hierarchy';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.ATTRIBUTION_FACTOR_LEVEL3 IS 'The third highest level of attribution factor hierarchy';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.ATTRIBUTION_FACTOR_LEVEL4 IS 'The lowest level of attribution factor hierarchy';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_CUSTOM_ATTRIBUTION_FACTOR.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this sector, 0 otherwise';

COMMENT ON TABLE DW.DIM_DATE IS 'Contains all the dates from the last 50 years to the next 50 years, with their attributes. This dimension is a Slowly Changing Dimension type 0 (static)';

COMMENT ON COLUMN DW.DIM_DATE.DATE_KEY IS 'e.g. 20230710 (YYYYMMDD)';

COMMENT ON COLUMN DW.DIM_DATE.DATE IS 'e.g. 2023-07-10 (YYYY-MM-DD)';

COMMENT ON COLUMN DW.DIM_DATE.DAY IS 'e.g. 1, 3, 29, 31';

COMMENT ON COLUMN DW.DIM_DATE.WEEKDAY_NAME IS 'e.g. Monday, Tuesday, etc.';

COMMENT ON COLUMN DW.DIM_DATE.WEEK_NUMBER IS 'How many weeks since January 1st, from 1 to 53';

COMMENT ON COLUMN DW.DIM_DATE.MONTH_NUMBER IS 'e.g. 1, 3, 9, 12';

COMMENT ON COLUMN DW.DIM_DATE.MONTH_NAME IS 'e.g. January, March';

COMMENT ON COLUMN DW.DIM_DATE.QUARTER IS 'e.g. Q1, Q2, Q3, Q4';

COMMENT ON COLUMN DW.DIM_DATE.YEAR IS 'e.g. 2023';

COMMENT ON COLUMN DW.DIM_DATE.WEEKDAY_FLAG IS '1 for Monday to Friday, 0 otherwise';

COMMENT ON COLUMN DW.DIM_DATE.MONTH_END_FLAG IS '1 for month end, 0 otherwise';

COMMENT ON COLUMN DW.DIM_DATE.QUARTER_END_FLAG IS '1 for quarter end, 0 otherwise';

COMMENT ON TABLE DW.DIM_ISSUER IS 'Contains the issuers of security. An issuer can be a company, a sovereign (country level government), a local authority (district/city/state level government), or a government agency (e.g. Fannie Mae). This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_ISSUER.ISSUER_KEY IS 'Unique identifier for an issuer in Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_ISSUER.ISSUER_ID IS '12 characters Bloomberg issuer ID (Mnemonic: ID_BB_COMPANY). Or sourced from Factset (Symbology field name: SYM.ENTITY_ID)';

COMMENT ON COLUMN DW.DIM_ISSUER.ISSUER_NAME IS 'The formal issuer name from Bloomberg e.g. Pepsi Co Inc (no comma or period), Hershey Co/The (the at the end). Or from Factset (Symbology field name: SYM.ENTITY_NAME). Dun and Bradstreet does not cover all issuers (it only covers companies).';

COMMENT ON COLUMN DW.DIM_ISSUER.ISSUER_LEI IS 'Legal Entity Identifer covering 1.4 million legal entities in more than 200 countries, including public sector and government bodies.';

COMMENT ON COLUMN DW.DIM_ISSUER.FACTSET_ENTITY_ID IS 'Unique issuer identifier in Factset. Symbology field name: SYM.ENTITY_ID.';

COMMENT ON COLUMN DW.DIM_ISSUER.HEADQUARTERS_STREET_ADDRESS IS 'Location of the corporate headquaters for this company/agency/government body';

COMMENT ON COLUMN DW.DIM_ISSUER.HEADQUARTERS_CITY IS 'Location of the corporate headquaters for this company/agency/government body';

COMMENT ON COLUMN DW.DIM_ISSUER.HEADQUARTERS_STATE IS 'Location of the corporate headquaters for this company/agency/government body';

COMMENT ON COLUMN DW.DIM_ISSUER.HEADQUARTERS_ZIP_CODE IS 'Location of the corporate headquaters for this company/agency/government body';

COMMENT ON COLUMN DW.DIM_ISSUER.HEADQUARTERS_COUNTRY_CODE IS 'Location of the corporate headquaters for this company/agency/government body';

COMMENT ON COLUMN DW.DIM_ISSUER.PARENT_ISSUER_ID IS 'The parent of this issuer in Bloomberg issuer hierarchy (or from Factset)';

COMMENT ON COLUMN DW.DIM_ISSUER.PARENT_ISSUER_NAME IS 'The parent of this issuer in Bloomberg issuer hierarchy (or from Factset)';

COMMENT ON COLUMN DW.DIM_ISSUER.ULTIMATE_PARENT_ISSUER_ID IS 'The top level parent of this issuer in Bloomberg issuer hierarchy (or from Factset)';

COMMENT ON COLUMN DW.DIM_ISSUER.ULTIMATE_PARENT_ISSUER_NAME IS 'The top level parent of this issuer in Bloomberg issuer hierarchy (or from Factset)';

COMMENT ON COLUMN DW.DIM_ISSUER.COUNTRY_OF_RISK IS '2 characters country code (ISO 3166) where the business is operating and the revenues are generated';

COMMENT ON COLUMN DW.DIM_ISSUER.COUNTRY_OF_DOMICILE IS '2 characters country code (ISO 3166) where the business is registered for paying taxes, it''s usually where the headquarter is located.';

COMMENT ON COLUMN DW.DIM_ISSUER.COUNTRY_OF_INCORPORATION IS '2 characters country code (ISO 3166) where the business is registered legally, i.e. which state/country law governs this company/entity';

COMMENT ON COLUMN DW.DIM_ISSUER.GICS_SECTOR_LEVEL1 IS 'The sector name (level 1) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care, Financials, Information Technology, Communication, Industrial';

COMMENT ON COLUMN DW.DIM_ISSUER.GICS_SECTOR_LEVEL2 IS 'The sector name (level 2) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care Equipment & Services, Banks, Software & Services, Capital Goods';

COMMENT ON COLUMN DW.DIM_ISSUER.GICS_SECTOR_LEVEL3 IS 'The sector name (level 3) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care Providers & Services, Capital Markets, IT Services, Machinery';

COMMENT ON COLUMN DW.DIM_ISSUER.GICS_SECTOR_LEVEL4 IS 'The sector name (level 4) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care Facilities, Asset Management & Custody Banks, Internet Services & Infrastructure, Research & Consulting Services';

COMMENT ON COLUMN DW.DIM_ISSUER.ICE_SECTOR_LEVEL1 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 1 (asset class) e.g. Sovereign, Corporate, Securitized/Collateralized, Preferred Securities, Municipal';

COMMENT ON COLUMN DW.DIM_ISSUER.ICE_SECTOR_LEVEL2 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 2 (group) e.g. Sovereign, Financial, Industrials, Securitized, Revenue';

COMMENT ON COLUMN DW.DIM_ISSUER.ICE_SECTOR_LEVEL3 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 3 (category) e.g. Sovereign, Financial Services, Automotive, Agency, Local-Authority, Supranational, Asset Backed, Revenue - Airport, Pfd-Basic Industry';

COMMENT ON COLUMN DW.DIM_ISSUER.ICE_SECTOR_LEVEL4 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 4 (sub category) e.g. Sovereign, Investments & Misc Financial Services, Beverage, ABS Home Equity Loans, Revenue - Health';

COMMENT ON COLUMN DW.DIM_ISSUER.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_ISSUER.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_ISSUER.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this security, 0 otherwise';

COMMENT ON TABLE DW.DIM_PERFORMANCE_RETURN_PERIOD IS 'Contains the performance return periods such as 1M, 3M, 6M, 1Y, 3Y, etc.';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_PERIOD.PERFORMANCE_RETURN_PERIOD_KEY IS 'The unique identifier for performance return period in the Showflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_PERIOD.PERFORMANCE_RETURN_PERIOD_CODE IS 'The period codes such as 1M, 3M, 1Y, 3Y, YTD and SI.';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_PERIOD.PERFORMANCE_RETURN_PERIOD_NAME IS 'The period names e.g. 1 month, 3 months, 1 year, 3 year, Year To Date and Since Inception';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_PERIOD.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_PERIOD.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_PERIOD.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this attribution method, 0 otherwise';

COMMENT ON TABLE DW.DIM_PERFORMANCE_RETURN_TYPE IS 'Contains the performance return type/flavor i.e. whether the performance returns are calculated before the fees are deducted (gross) or after the fees are deducted (net), cumulative or annualized, arithmetic or geometric (compound growth), or custom method such as using mid-day prices (instead of closing prices), or using accrual approach. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_TYPE.PERFORMANCE_RETURN_TYPE_KEY IS 'Unique identifier for a performance return type i.e. combination of gross/net, accumulative/annualised, arithmetic/geometric, etc. (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_TYPE.PERFORMANCE_RETURN_TYPE_NAME IS 'Indicates whether the performance returns are calculated before the fees are deducted (gross) or after the fees are deducted (net), cumulative or annualized, arithmetic or geometric (compound growth), or custom method such as using mid-day prices (instead of closing prices), or using accrual approach.';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_TYPE.PERFORMANCE_RETURN_TYPE_DESCRIPTION IS 'The long description of the Performance Return Type Name field explaining the methodology of calculating performance return';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_TYPE.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_TYPE.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PERFORMANCE_RETURN_TYPE.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this performance type, 0 otherwise';

COMMENT ON TABLE DW.DIM_PORTFOLIO IS 'Contains portfolio attributes. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_KEY IS 'Unique identifier for a portfolio in Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_CODE IS 'Formal portfolio code as defined by the product team';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_LEGAL_NAME IS 'The portfolio legal name as registered in SEC and FCA';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_SHORT_NAME IS 'Formal portfolio short name as defined by the product team for sales literature and internal website';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_STATUS IS 'e.g. active, closed (or not yet launched)';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_TYPE IS 'e.g. fund, SMA, ETF, CIT';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.BASE_CURRENCY IS 'The base currency of the portfolio. All holdings are stored in this currency, as well as in the local/native currency.';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.INCEPTION_DATE IS 'when money first flows into this portfolio and being managed there';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.BENCHMARK_CODE IS 'the benchmark for this portfolio';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.PORTFOLIO_GROUP IS 'Category based on geography and asset class, e.g. European Equities, Sustainable Fixed Income';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.LEGAL_STRUCTURE IS 'e.g. unit trust, mutual fund, UCITS';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.TAX_EXEMPT_INDICATOR IS '1 if this portfolio is tax exempt, 0 otherwise';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PORTFOLIO.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this portfolio, 0 otherwise';

COMMENT ON TABLE DW.DIM_PRODUCT IS 'A product is a combination of an investment team, an investment strategy, and an investment vehicle. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_PRODUCT.PRODUCT_KEY IS 'Unique identifier for a product in Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_PRODUCT.PRODUCT_NAME IS 'Name of the product, e.g. Columbia Disciplined Growth Fund';

COMMENT ON COLUMN DW.DIM_PRODUCT.PRODUCT_DESCRIPTION IS 'Full description of the investment product';

COMMENT ON COLUMN DW.DIM_PRODUCT.PRODUCT_LEGAL_STRUCTURE IS 'e.g. Fund, UCITS, unit trust';

COMMENT ON COLUMN DW.DIM_PRODUCT.PRODUCT_FEE_STRUCTURE IS 'e.g. Sales charge 5%, management fees 0.75%, distribution fees 0.25%';

COMMENT ON COLUMN DW.DIM_PRODUCT.PRODUCT_REGULATOR IS 'Government body who regulates this product, e.g. SEC, FCA.';

COMMENT ON COLUMN DW.DIM_PRODUCT.INVESTMENT_TEAM IS 'The group of individuals who manage assets on behalf of investors';

COMMENT ON COLUMN DW.DIM_PRODUCT.INVESTMENT_STRATEGY IS 'A set of rules, behaviors, or procedures to guide investment decisions';

COMMENT ON COLUMN DW.DIM_PRODUCT.INVESTMENT_VEHICLE IS 'Legal structure used to invest money on behalf of investors';

COMMENT ON COLUMN DW.DIM_PRODUCT.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PRODUCT.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_PRODUCT.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this product, 0 otherwise';

COMMENT ON TABLE DW.DIM_SECTOR IS 'Contains GICS and ICE (was Merrill Lynch) sectors e.g. Industrial, Financial, Government.\nICE contains fixed income sector e.g. Sovereign, Local Authority, ABS (also contains corporate sectors like Industrial, Financial). Equity portfolios commonly use GICS, whilst fixed income prefer ICE. This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_KEY IS 'Unique identifier for a sector in the Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_SECTOR.CLASSIFICATION_SCHEME IS 'e.g. GICS or ICE (was Merrill Lynch). Equity portfolios commonly use GICS, whilst fixed income prefer ICE.';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_CODE_LEVEL1 IS 'GICS or ICE sector code for level 1 (highest level) e.g. 20';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_CODE_LEVEL2 IS 'GICS or ICE sector code for level 2 e.g. 2010';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_CODE_LEVEL3 IS 'GICS or ICE sector code for level 3 e.g. 201040';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_CODE_LEVEL4 IS 'GICS or ICE sector code for level 4 (lowest level) e.g. 20104010';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_NAME_LEVEL1 IS 'GICS or ICE Level 1 sector name e.g. Industrial';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_NAME_LEVEL2 IS 'GICS or ICE Level 2 sector name e.g. Capital Goods';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_NAME_LEVEL3 IS 'GICS or ICE Level 3 sector name e.g. Electrical Equipment';

COMMENT ON COLUMN DW.DIM_SECTOR.SECTOR_NAME_LEVEL4 IS 'GICS or ICE Level 4 sector name e.g. Electrical Components & Equipment';

COMMENT ON COLUMN DW.DIM_SECTOR.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_SECTOR.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_SECTOR.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this sector, 0 otherwise';

COMMENT ON TABLE DW.DIM_SECURITY IS 'Contains securities in the security master (mastering/MDM/RDM is done outside the warehouse). This dimension is a Slowly Changing Dimension type 2.';

COMMENT ON COLUMN DW.DIM_SECURITY.SECURITY_KEY IS 'Unique identifier for a security/instrument in Snowflake data warehouse (integer, primary key, surrogate key)';

COMMENT ON COLUMN DW.DIM_SECURITY.SECURITY_NAME IS 'Bloomberg name, not Factset, i.e. Tesla Inc (without period)';

COMMENT ON COLUMN DW.DIM_SECURITY.SECURITY_TYPE IS 'Whether the row contains a security or a portfolio. This is used for fund lookthrough, where the Security_Type is set to Portfolio.';

COMMENT ON COLUMN DW.DIM_SECURITY.PORTFOLIO_CODE IS 'For rows with security_type = Portfolio, this column contains the portfolio code. For rows with security_type = Security, this column is blank.';

COMMENT ON COLUMN DW.DIM_SECURITY.ISIN IS 'International Securities Identification Number (12 characters, ISO 6166) e.g. US88160R1014 for Tesla Inc. equity';

COMMENT ON COLUMN DW.DIM_SECURITY.SEDOL IS 'Stock Exchange Daily Official List (7 characters) e.g. A1CX3T for Tesla';

COMMENT ON COLUMN DW.DIM_SECURITY.CUSIP IS 'Committee on Uniform Securities Identification Procedures (9 characters) e.g. 88160R101 for Tesla Inc shares';

COMMENT ON COLUMN DW.DIM_SECURITY.TICKER IS 'Bloomberg Ticker, e.g. TSLA for Tesla Inc. equity';

COMMENT ON COLUMN DW.DIM_SECURITY.BLOOMBERG_ID IS 'Financial Instrument Global Identifier (FIGI) in Bloomberg (ID_BB_GLOBAL)';

COMMENT ON COLUMN DW.DIM_SECURITY.FACTSET_ID IS 'The unique security identifier in Factset Symbology';

COMMENT ON COLUMN DW.DIM_SECURITY.ISSUER_KEY IS 'The issuer of this security/instrument. It can be a company, sovereign government, government agency or local authority. Foreign key to the issuer dimension. Reason for snowflaking: issuer is an attribute of security so issuer should not be directly attached to fact_holding or fact_benchmark_constituent. This is the only snowflaking in Cutter Snowflake data warehouse (everything else is star schema).';

COMMENT ON COLUMN DW.DIM_SECURITY.ASSET_CLASS_LEVEL1 IS 'e.g. equity, fixed income, cash equivalent';

COMMENT ON COLUMN DW.DIM_SECURITY.ASSET_CLASS_LEVEL2 IS 'e.g. Ordinary Share, CDS, Option';

COMMENT ON COLUMN DW.DIM_SECURITY.ASSET_CLASS_LEVEL3 IS 'e.g. CDS Single Name, CDS Index, Call Option, Put Option, Bond Future';

COMMENT ON COLUMN DW.DIM_SECURITY.CURRENCY_CODE IS '3 character currency code (ISO 4217) e.g. USD, GBP, EUR, AUD, JPY';

COMMENT ON COLUMN DW.DIM_SECURITY.COUNTRY_OF_RISK IS '2 characters country code (ISO 3166) where the business is operating and the revenues are generated';

COMMENT ON COLUMN DW.DIM_SECURITY.COUNTRY_OF_DOMICILE IS '2 characters country code (ISO 3166) where the business is registered for paying taxes, it''s usually where the headquarter is located.';

COMMENT ON COLUMN DW.DIM_SECURITY.GICS_SECTOR_LEVEL1 IS 'The sector name (level 1) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care, Financials, Information Technology, Communication, Industrial';

COMMENT ON COLUMN DW.DIM_SECURITY.GICS_SECTOR_LEVEL2 IS 'The sector name (level 2) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care Equipment & Services, Banks, Software & Services, Capital Goods';

COMMENT ON COLUMN DW.DIM_SECURITY.GICS_SECTOR_LEVEL3 IS 'The sector name (level 3) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care Providers & Services, Capital Markets, IT Services, Machinery';

COMMENT ON COLUMN DW.DIM_SECURITY.GICS_SECTOR_LEVEL4 IS 'The sector name (level 4) from MSCI''s Global Industrial Classification Scheme, e.g. Health Care Facilities, Asset Management & Custody Banks, Internet Services & Infrastructure, Research & Consulting Services';

COMMENT ON COLUMN DW.DIM_SECURITY.ICE_SECTOR_LEVEL1 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 1 (asset class) e.g. Sovereign, Corporate, Securitized/Collateralized, Preferred Securities, Municipal';

COMMENT ON COLUMN DW.DIM_SECURITY.ICE_SECTOR_LEVEL2 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 2 (group) e.g. Sovereign, Financial, Industrials, Securitized, Revenue';

COMMENT ON COLUMN DW.DIM_SECURITY.ICE_SECTOR_LEVEL3 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 3 (category) e.g. Sovereign, Financial Services, Automotive, Agency, Local-Authority, Supranational, Asset Backed, Revenue - Airport, Pfd-Basic Industry';

COMMENT ON COLUMN DW.DIM_SECURITY.ICE_SECTOR_LEVEL4 IS 'ICE''s (was Merrill Lynch''s) fixed income sector classification Level 4 (sub category) e.g. Sovereign, Investments & Misc Financial Services, Beverage, ABS Home Equity Loans, Revenue - Health';

COMMENT ON COLUMN DW.DIM_SECURITY.SANDP_RATING_LONG_TERM IS 'S&P credit rating for long term debt (>1 year), e.g. AAA, AA, A, BBB, BB, B';

COMMENT ON COLUMN DW.DIM_SECURITY.SANDP_RATING_SHORT_TERM IS 'S&P credit rating for short term debt (< 1 year) e.g. A-1, A-2, A-3, B, C';

COMMENT ON COLUMN DW.DIM_SECURITY.MOODYS_RATING_LONG_TERM IS 'Moody''s credit rating for long term debt (> 1 year), e.g. Aaa, Aa1, Aa2, Aa3, A1, A2, A3, Baa1';

COMMENT ON COLUMN DW.DIM_SECURITY.MOODYS_RATING_SHORT_TERM IS 'Moody''s credit rating for long term debt (< 1 year), e.g. P-1, P-2, P-3, NP';

COMMENT ON COLUMN DW.DIM_SECURITY.FITCH_RATING_LONG_TERM IS 'Fitch credit rating for long term debt (> 1 year) e.g. AAA, AA, A, BBB, BB, B, CCC';

COMMENT ON COLUMN DW.DIM_SECURITY.FITCH_RATING_SHORT_TERM IS 'Fitch credit rating for short term debt (< 1 year) e.g. F1, F2, F3, B, C, D, RD, D';

COMMENT ON COLUMN DW.DIM_SECURITY.MATURITY_DATE IS 'When the principal of a security is become payable';

COMMENT ON COLUMN DW.DIM_SECURITY.VALID_FROM IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_SECURITY.VALID_TO IS 'For slowly changing dimension type 2 (date range when the row is valid)';

COMMENT ON COLUMN DW.DIM_SECURITY.LATEST_FLAG IS 'For slowly changing dimension type 2: 1 if the row the the latest row for this security, 0 otherwise';

COMMENT ON TABLE DW.FACT_BENCHMARK_CONSTITUENT IS 'Contains the securities within a benchmark/index, every day.\nGrain: date, benchmark, security (for each datetime_inserted).\nFact table type: periodic snapshot';

COMMENT ON COLUMN DW.FACT_BENCHMARK_CONSTITUENT.DATE_KEY IS 'When this benchmark weight was defined. Integer representation in YYYYMMDD e.g. 20230929 (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_BENCHMARK_CONSTITUENT.BENCHMARK_KEY IS 'The benchmark containing the constituents (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_BENCHMARK_CONSTITUENT.SECURITY_KEY IS 'The instrument/security held for this benchmark constituent (foreign key to the security dimension)';

COMMENT ON COLUMN DW.FACT_BENCHMARK_CONSTITUENT.WEIGHT IS 'The weight of this constituent in this benchmark for this date';

COMMENT ON COLUMN DW.FACT_BENCHMARK_CONSTITUENT.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_BENCHMARK_CONSTITUENT.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP IS 'Contains the relationship between accounts, clients, a products and portfolios. A client can have multiple accounts. An account can belong to multiple clients (Ref: CAPE Data POV Deck 4x3 slide 19). A client can have no account, no product, no portfolio (i.e. still a prospect).\nGrain: client, account, portfolio, product (for each datetime_inserted).\nFact table type: transaction fact table.';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.CLIENT_KEY IS 'Foreign key to the client dimension';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.ACCOUNT_KEY IS 'Foreign key to the account dimension (optional, 0 if this client does not have an account)';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.PORTFOLIO_KEY IS 'Foreign key to the portfolio dimension (optional, 0 if this account does not have a portfolio)';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.PRODUCT_KEY IS 'Foreign key to the product dimension (optional, 0 if this account does not have a product)';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.DESCRIPTION IS 'Description or note/comment about the relationship between the client, account and portfolio/product';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_CLIENT_ACCOUNT_RELATIONSHIP.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_HOLDING IS 'Contains all the positions held in each portfolio, every day.\nGrain: date, portfolio, security (for each datetime_inserted)\nFact table type: periodic snapshot';

COMMENT ON COLUMN DW.FACT_HOLDING.DATE_KEY IS 'When this holding was valued (the date of the market price). Integer representation in YYYYMMDD e.g. 20230929 (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_HOLDING.PORTFOLIO_KEY IS 'The portfolio containing this holding (foreign key to the portfolio dimension)';

COMMENT ON COLUMN DW.FACT_HOLDING.SECURITY_KEY IS 'The instrument/security held for this holding(foreign key to the security dimension)';

COMMENT ON COLUMN DW.FACT_HOLDING.QUANTITY IS 'Not the quantity on individual purchase, but the total quantity we are currently holding i.e. over many purchases and sales.';

COMMENT ON COLUMN DW.FACT_HOLDING.PRICE_BASE_CCY IS 'Not the price on individual purchase/sale, but total market value divided by the total quantity so it''s like the average price paid over all transactions that makes up the current holding.';

COMMENT ON COLUMN DW.FACT_HOLDING.PRICE_LOCAL_CCY IS 'Not the price on individual purchase/sale, but total market value divided by the total quantity so it''s like the average price paid over all transactions that makes up the current holding.';

COMMENT ON COLUMN DW.FACT_HOLDING.MARKET_VALUE_BASE_CCY IS 'The market value of this holding in the portfolio base currency.';

COMMENT ON COLUMN DW.FACT_HOLDING.MARKET_VALUE_LOCAL_CCY IS 'The market value of this holding in the local currency of the security exchange.';

COMMENT ON COLUMN DW.FACT_HOLDING.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_HOLDING.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_PERFORMANCE_ATTRIBUTION IS 'Contains allocation of the portfolio performance return to each country, currency or sector, from a performance attribution system such as StatPro/Point/Barra output or files from the back office providers such as NT or State Street.\nGrain: 1 row for each date, portfolio, attribution method and entity (for each datetime_inserted).\nFact table type: periodic snapshot.';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.DATE_KEY IS 'When this performance attribution data is for (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.PORTFOLIO_KEY IS 'The portfolio which this performance attribution data is for (foreign key to the portfolio dimension)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.PERFORMANCE_RETURN_PERIOD_KEY IS 'Foreign key to the performance return period dimension, which contains the performance return periods such as 1M, 3M, 6M, 1Y, 3Y, etc.';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.ATTRIBUTION_METHOD_KEY IS 'Describes the methodology used in calculating the performance attribution, i.e. by what factor the performance return is allocated e.g. by country, currency, or sector including any exception such as exclude Japan (foreign key to the attribution method dimension)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.ATTRIBUTION_FACTOR_KEY IS 'Contains the country_key, or sector_key, or currency_key (or custom factor)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.PORTFOLIO_WEIGHT IS 'The weight of this country/currency/sector in the portfolio';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.PORTFOLIO_CONTRIBUTION IS 'How much this country/currency/sector contributes to the portfolio performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.BENCHMARK_WEIGHT IS 'The weight of this country/currency/sector in the benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.BENCHMARK_CONTRIBUTION IS 'How much this country/currency/sector contributes to benchmark performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.DURATION_EFFECT IS 'How much the duration contributes to the portfolio performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.YIELD_CURVE_EFFECT IS 'How much the yield curve contributes to the portfolio performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.ALLOCATION_EFFECT IS 'How much the country/currency/sector allocation contributes to the portfolio performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.SELECTION_EFFECT IS 'How much the security selection contributes to the portfolio performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.FX_EFFECT IS 'How much the FX rates fluctuation (aka \"carry\") contributes to the portfolio performance return';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.TOTAL_EFFECT IS 'Total contribution from all factors including the \"interaction factor\" (interactions between different factors)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_ATTRIBUTION.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_PERFORMANCE_RETURN IS 'Contains the portfolio level performance return data, for all periods and flavours.\nGrain: 1 row per portfolio, reporting date, performance type, performance entity type.\nFact table type: periodic snapshot.';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.DATE_KEY IS 'The as of date key when these performance return data is valid for';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.PORTFOLIO_KEY IS 'The portfolio for which these performance data is for (the foreign key to the portfolio dimension)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.PERFORMANCE_RETURN_TYPE_KEY IS 'The type or \"flavour\" of the top level performance return i.e. gross or net, cumulative or annualized, arithmetic or geometric, etc. (foreign key to the performance type dimension)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.PERFORMANCE_ENTITY_TYPE IS 'Indicates whether this row contains the portfolio return or the benchmark return (value: P or B). Or R for relative return (difference between portfolio and benchmark)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_1M IS '1 month performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_3M IS '3 months performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_6M IS '6 months performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_YTD IS 'Year to date performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_1Y IS '1 year performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_3Y IS '3 years performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_5Y IS '5 years performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_10Y IS '10 years performance return of the portfolio or benchmark';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.RETURN_SI IS 'Performance return of the portfolio since inception (not applicable for benchmark)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_PERFORMANCE_RETURN.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_PORTFOLIO_ANALYTIC IS 'Contains fixed income, equity and risk analytics at portfolio level (daily), e.g. P/E, P/B, Yield, Market Cap, Weighted Average Maturity/Duration/Yield/DTS/Rating, Sharpe Ratio, TE, SD, Alpha, Beta, #holdings, #issuers.\nGrain: 1 row for each date and portfolio (for each datetime_inserted)\nFact table type: periodic snapshot.';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.DATE_KEY IS 'The date when these portfolio-level analytics are calculated (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.PORTFOLIO_KEY IS 'The portfolio for which these analytics are calculated for (foreign key to the portfolio dimension)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.NUMBER_OF_HOLDINGS IS 'Number of holdings in the portfolio for that date, including cash equivalent positions and derivatives';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.NUMBER_OF_ISSUERS IS 'Number of distinct issuers in the portfolio for that date';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.MARKET_CAP IS 'Weighted avarage of the holding''s market capitalization';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.PRICE_TO_EARNING_RATIO_TTM IS 'The weighted average of the Price-to-Earning Ratio of all the holdings in the portfolio (Trailing 12 months)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.PRICE_TO_BOOK_RATIO_TTM IS 'Weighted average of the Price-to-book ratio of all the holdings in this portfolio (trailing 12 months)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.WEIGHTED_AVERAGE_COUPON IS 'Weighted average of the coupon value (for fixed income portfolio) of all the fixed income holdings in the portfolio';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.WEIGHTED_AVERAGE_CREDIT_QUALITY IS 'The weighted average of credit rating, e.g. AA (convert to numeric, take the weighted average based on MV, then convert back to letters). Which rating (S&P, Moody''s, Fitch) is to be defined.';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.CURRENT_YIELD IS 'Weighted average of the current yield of all the fixed income holdings in the portfolio';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.SPREAD_DURATION IS 'Weighted average of the spread duration for all the fixed income holdings in the portfolio';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.EFFECTIVE_MATURITY IS 'Weighted average (by market value) of the effective maturity for all the fixed income holdings in the portfolio (in years)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.MODIFIED_DURATION IS 'Weighted average (by market value) of the spread duration for all the fixed income holdings in the portfolio (in years)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.DURATION_TIMES_SPREAD IS 'Weighted average of the Duration Times Spread (DTS) for all the fixed income holdings in the portfolio';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.STANDARD_DEVIATION_1Y IS 'variability of returns for the last 1 year';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.SHARPE_RATIO_1Y IS '1 year portfolio return minus risk free rate, divided by the standard deviation';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_ANALYTIC.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_PORTFOLIO_VALUATION IS 'Contains the portfolio''s Net Asset Value (daily)\nGrain: 1 row for each date and portfolio (for each datetime_inserted).\nFact table type: periodic snapshot.';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_VALUATION.DATE_TIME IS 'When the NAV is calculated for this portfolio (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_VALUATION.PORTFOLIO_KEY IS 'The portfolio for which this NAV is for (foreign key to the portfolio dimension)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_VALUATION.NAV IS 'Net Asset Value of the portfolio, for that date';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_VALUATION.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_PORTFOLIO_VALUATION.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP IS 'A factless fact table linking the portfolio dimension and the product dimension.\nA product can be linked to one or more portfolios. A portfolio can only be linked to one product.\nGrain: 1 row for each product-portfolio combination (for each datetime_inserted).\nFact table type: transaction fact table';

COMMENT ON COLUMN DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP.PRODUCT_KEY IS 'Foreign key to the product dimension';

COMMENT ON COLUMN DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP.PORTFOLIO_KEY IS 'Foreign key to the portfolio dimension';

COMMENT ON COLUMN DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_PRODUCT_PORTFOLIO_RELATIONSHIP.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_SECURITY_ANALYTIC IS 'Contains fixed income analytics like yield, duration, spread, credit ratings, coupon, WAL, maturity bucket, IE01, PV01, CR01, etc. at security level. In the future \"equity analytics\" such as market cap and number of outstanding shares can be added. Hence the name is fact_security_analytics, not fact_fixed_income_analytics.\nGrain: 1 row for each date and security (for each datetime_inserted)\nFact table type: periodic snapshot.';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.DATE_KEY IS 'When this security analytic was calculated. Integer representation in YYYYMMDD e.g. 20230929 (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.SECURITY_KEY IS 'the security/instrument for which these fixed income analytics are for (on that date)';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.YIELD_TO_MATURITY IS 'The return earned by a bond when it makes all interest payments and repays the original principal';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.YIELD_TO_WORST IS 'The lowest possible yield that can be received on a bond that fully operates within the terms of its contract without defaulting. It''s to reflect the risk that the issuer can close the bond before maturity.';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.MODIFIED_DURATION IS 'Price sensitivity to changes in interest rates';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.SPREAD_DURATION IS 'Price sensitivity to credit spread changes (credit spread is the difference between the yield of a security and the yield of a government bond)';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.OPTION_ADJUSTED_DURATION IS 'Price sensitivity to changes in interest rates, for bonds that have embedded options. Also known as Effective Duration.';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.SPREAD IS 'Difference between the yield of a bond and the yield of the treasury (the risk-free rate)';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.DURATION_TIMES_SPREAD IS 'The spread duration x the credit spread. It measures the credit volatility of a corporate bond.';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.COUPON IS 'Interest payment on a bond or fixed income securities';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.WEIGHTED_AVERAGE_LIFE IS 'Average length of time that each dollar of unpaid principal on an amortizing bond remains outstanding';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.MATURITY_BUCKET IS 'Time range (in years) when the bond will mature, i.e. 1-3 years, 3-5 years, etc.';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_SECURITY_ANALYTIC.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';

COMMENT ON TABLE DW.FACT_TRANSACTION IS 'Contains the purchase and sale activity within the portfolio, as well as cash transaction such as dividend distribution.\nGrain: 1 row for each transaction (purchase, sale or cash) and datetime_inserted.\nFact table type: transaction fact table';

COMMENT ON COLUMN DW.FACT_TRANSACTION.TRANSACTION_KEY IS 'Unique identifier of a trade/transaction from ThinkFolio/CRD/BBG AIM.';

COMMENT ON COLUMN DW.FACT_TRANSACTION.TRADE_DATE_KEY IS 'When the purchase, sale or dividend happens (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_TRANSACTION.SETTLEMENT_DATE_KEY IS 'When the the payment is made and the asset/security is delivered (foreign key to the date dimension)';

COMMENT ON COLUMN DW.FACT_TRANSACTION.SECURITY_KEY IS 'The security being purchased or sold (foreign key to the security dimension)';

COMMENT ON COLUMN DW.FACT_TRANSACTION.BROKER_KEY IS 'The executing broker who filled the trade (and the one who settled the payment). Foreign key to the broker dimension.';

COMMENT ON COLUMN DW.FACT_TRANSACTION.TRANSACTION_TYPE IS 'Purchase or sale (value: P or S). Or cash (C) if it''s a cash transaction such as dividend distribution.';

COMMENT ON COLUMN DW.FACT_TRANSACTION.QUANTITY IS 'Number of shares purchased/sold (or unit of funds, bonds, etc.)';

COMMENT ON COLUMN DW.FACT_TRANSACTION.PRICE IS 'Price of the security purchased or sold (not applicable for dividend or cash transactions)';

COMMENT ON COLUMN DW.FACT_TRANSACTION.AMOUNT IS 'The transaction amount (qty x price for a purchase or sale). For cash transaction such as dividend it''s the dividend amount.';

COMMENT ON COLUMN DW.FACT_TRANSACTION.COMMISSION IS 'The commision amount that we paid to the broker for this transaction';

COMMENT ON COLUMN DW.FACT_TRANSACTION.DATETIME_INSERTED IS 'When this fact row was created (system column)';

COMMENT ON COLUMN DW.FACT_TRANSACTION.LATEST_FLAG IS 'The latest fact rows have LATEST_FLAG = 1. If a correction is made to a fact row, it will be done as an insert. The old row will have LATEST_FLAG = 0, and the new row will have LATEST_FLAG = 1. The DATETIME_INSERTED column indicates when each fact row was created.';
