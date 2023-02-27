-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Migrant_Population" (
    "Country_ID" int   NOT NULL,
    "Country_Name" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Total_Migrant_Population" float   NOT NULL,
    "Migrant_Male_Population" float   NOT NULL,
    "Migrant_Female_Population" float   NOT NULL,
    CONSTRAINT "pk_Migrant_Population" PRIMARY KEY (
        "Country_ID"
     )
);

CREATE TABLE "Country_Data" (
    "Country_ID" int   NOT NULL,
    "Country_Name" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Total_Country_Population" int   NOT NULL,
    "Annual_Growth_Rate" float   NOT NULL,
    "Country_Area" int   NOT NULL,
    "Population_Density" float   NOT NULL,
    "Total_Fertility_Rate" float   NOT NULL,
    "Crude_Birth_Rate" float   NOT NULL,
    "Life_Expectancy_at_Birth" float   NOT NULL,
    "Infant_Mortality_Rate" float   NOT NULL,
    "Crude_Death_Rate" float   NOT NULL,
    "Net_Migration_Rate" float   NOT NULL,
    "Migration_Flag" bool   NOT NULL,
    CONSTRAINT "pk_Country_Data" PRIMARY KEY (
        "Country_ID"
     )
);

ALTER TABLE "Migrant_Population" ADD CONSTRAINT "fk_Migrant_Population_Country_ID" FOREIGN KEY("Country_ID")
REFERENCES "Country_Data" ("Country_ID");

