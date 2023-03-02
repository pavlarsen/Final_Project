-- Create table Migrant_Population
CREATE TABLE Migrant_Population (
	Country_ID INT NOT NULL,
	Country_ID_Alpha VARCHAR(10) NOT NULL,
	Country_Name VARCHAR(50) NOT NULL,
	Year INT NOT NULL,
	Total_Migrant_Population INT NOT NULL,
	Migrant_Male_Population INT NOT NULL,
	Migrant_Female_Population INT NOT NULL,
	PRIMARY KEY (Country_ID_Alpha)
);

DROP TABLE Migrant_Population;
DROP TABLE Country_Data;

-- Create table Country_Data
CREATE TABLE Country_Data (
	Country_ID_Alpha VARCHAR(10) NOT NULL,
	Country_Name VARCHAR(50) NOT NULL,
	Year INT NOT NULL,
	Total_Country_Population INT NOT NULL,
	Annual_Growth_Rate FLOAT NOT NULL,
	Country_Area INT NOT NULL,
	Population_Density FLOAT NOT NULL,
	Total_Fertility_Rate FLOAT NOT NULL,
	Crude_Birth_Rate FLOAT NOT NULL,
	Life_Expectancy_at_Birth FLOAT NOT NULL,
	Infant_Mortality_Rate FLOAT NOT NULL,
	Crude_Death_Rate FLOAT NOT NULL,
	Net_Migration_Rate FLOAT NOT NULL,
	Migration_Flag BOOLEAN NOT NULL,
	FOREIGN KEY (Country_ID_Alpha) REFERENCES Migrant_Population (Country_ID_Alpha),
	PRIMARY KEY (Country_ID_Alpha)
);