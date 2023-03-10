-- Create table Validation_Data
CREATE TABLE Validation_Data (
	Country_ID_Alpha VARCHAR(10) NOT NULL,
	Country_Name VARCHAR(150) NOT NULL,
	Year INT NOT NULL,
	Total_Country_Population INT NOT NULL,
	Annual_Growth_Rate FLOAT NOT NULL,
	Population_Density FLOAT NOT NULL,
	Total_Fertility_Rate FLOAT NOT NULL,
	Crude_Birth_Rate FLOAT NOT NULL,
	Life_Expectancy_at_Birth FLOAT NOT NULL,
	Infant_Mortality_Rate FLOAT NOT NULL,
	Crude_Death_Rate FLOAT NOT NULL,
	Net_Migration_Rate FLOAT NOT NULL,
	Migration_Flag BOOLEAN NOT NULL
);

SELECT * FROM validation_data;
