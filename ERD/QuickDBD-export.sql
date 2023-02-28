-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Migrant_Population] (
    [Country_ID] int  NOT NULL ,
    [Country_ID_Alpha] varchar  NOT NULL ,
    [Country_Name] varchar  NOT NULL ,
    [Year] int  NOT NULL ,
    [Total_Migrant_Population] int  NOT NULL ,
    [Migrant_Male_Population] int  NOT NULL ,
    [Migrant_Femaile_Population] int  NOT NULL ,
    CONSTRAINT [PK_Migrant_Population] PRIMARY KEY CLUSTERED (
        [Country_ID] ASC,[Country_ID_Alpha] ASC
    )
)

CREATE TABLE [Country_Data] (
    [Country_ID] int  NOT NULL ,
    [Country_ID_Alpha] varchar  NOT NULL ,
    [Country_Name] varchar  NOT NULL ,
    [Year] int  NOT NULL ,
    [Total_Country_Population] int  NOT NULL ,
    [Annual_Growth_Rate] float  NOT NULL ,
    [Country_Area] int  NOT NULL ,
    [Population_Density] float  NOT NULL ,
    [Total_Fertility_Rate] float  NOT NULL ,
    [Crude_Birth_Rate] float  NOT NULL ,
    [Life_Expectancy_at_Birth] float  NOT NULL ,
    [Infant_Mortality_Rate] float  NOT NULL ,
    [Crude_Death_Rate] float  NOT NULL ,
    [Net_Migration_Rate] float  NOT NULL ,
    [Migration_Flag] bool  NOT NULL ,
    CONSTRAINT [PK_Country_Data] PRIMARY KEY CLUSTERED (
        [Country_ID] ASC,[Country_ID_Alpha] ASC
    )
)

ALTER TABLE [Migrant_Population] WITH CHECK ADD CONSTRAINT [FK_Migrant_Population_Country_ID_Country_ID_Alpha_Year] FOREIGN KEY([Country_ID], [Country_ID_Alpha], [Year])
REFERENCES [Country_Data] ([Country_ID], [Country_ID_Alpha], [Year])

ALTER TABLE [Migrant_Population] CHECK CONSTRAINT [FK_Migrant_Population_Country_ID_Country_ID_Alpha_Year]

COMMIT TRANSACTION QUICKDBD