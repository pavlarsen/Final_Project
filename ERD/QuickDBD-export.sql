-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Country_Codes" (
    "Country_ID" int   NOT NULL,
    "Country_ID_Alpha" varchar   NOT NULL,
    "Country_Name" varchar   NOT NULL,
    CONSTRAINT "pk_Country_Codes" PRIMARY KEY (
        "Country_ID_Alpha"
     )
);

CREATE TABLE "Migrant_Population" (
    "Country_ID" int   NOT NULL,
    "Country_ID_Alpha" varchar   NOT NULL,
    "Country_Name" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Total_Migrant_Population" int   NOT NULL,
    "Migrant_Male_Population" int   NOT NULL,
    "Migrant_Female_Population" int   NOT NULL
);

CREATE TABLE "Country_Data" (
    "Country_ID_Alpha" varchar   NOT NULL,
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
    "Migration_Flag" bool   NOT NULL
);

ALTER TABLE "Country_Codes" ADD CONSTRAINT "fk_Country_Codes_Country_ID" FOREIGN KEY("Country_ID")
REFERENCES "Migrant_Population" ("Country_ID");

ALTER TABLE "Country_Codes" ADD CONSTRAINT "fk_Country_Codes_Country_ID_Alpha" FOREIGN KEY("Country_ID_Alpha")
REFERENCES "Country_Data" ("Country_ID_Alpha");

ALTER TABLE "Migrant_Population" ADD CONSTRAINT "fk_Migrant_Population_Country_ID_Alpha" FOREIGN KEY("Country_ID_Alpha")
REFERENCES "Country_Codes" ("Country_ID_Alpha");

