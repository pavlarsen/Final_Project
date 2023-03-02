# Final Project

## Project Overview
When we think about Data Analysis and Machine Learning, we tipically find it useful for business solutions. However, both have an enormous potential to help solve a wide range of issues, such as those that fall into the category of 'social phenomena'. 

Through this project, we aimed at coming up with a machine learning solution for an issue that is included in that very category: **migration**. 

The main purpose of the project was to analyze two databases, creating a Machine Learning Model that would help us predict if a country's *Net Migration Rate* (the number of migrants they receive vs. the number of migrants they produce) fell into one of two categories: **Positive or Negative**. 

---
## Relevance of the Project
As stated above, Data Analysis and Machine Learning both have an enormous potential when it comes to solving questions related to social issues. Nevertheless, this project is also relevant due to the fact that these types of solutions are not something that is readily available for institutions and/or organizations dedicated to the topic of migration. The main reasons for this are:
1. Organizations dedicated to migrant issues usually lack the economic resources needed to implement Machine Learning solutions. 
2. Professionals in the migration field usually have not had any type of education related to coding, data analysis or Machine Learning.

---

## Questions to be answered by the analysis
The analysis aims to answer the following questions:
1. Which countries are the ones that receive the largest amount of migrants per year?
2. Which countries are the ones that produce the largest amount of migrants per year?
3. Are there more male or female migrants internationally? Has this changed with time?
4. Are other sociodemographic variables relevant when it comes to explaining migration? If so, which ones? 
5. Can we use sociodemographic data to predict whether a country's Net Migration Rate will be positive or negative?

---


## Team Members
* Arantxa Meza
* David Castillo
* Juan Pablo Larsen
* Santiago Hernández
---


## Technology Used
In order to organize and structure the data, we decided to use Google Colab so that everyone could work on the code remotely. With the help of Python and the Pandas library, we cleaned and transformed the different databases. Finally, we exported the tables as csv files and uploaded everything into Github. 

---


## Project Steps
1. Theme and database selection
2. Data preprocessing
3. Loading the data into SQL

---


## Data Sources
We had two main data sources:
1. The [*ISO-3166-Countries-with-Regional-Codes*](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes) Github repository by @lukes, which includes ISO 3166-1 country lists merged with their UN Geoscheme regional codes.
2. The United Nations' [*International Migrant Stock 2020*](https://www.un.org/development/desa/pd/content/international-migrant-stock) database. This database gathers data every 5 years from 234 countries' population censuses in order to determine the number of migrants in each country. 
3. The United States Government's [*International Database*](https://www.census.gov/programs-surveys/international-programs/about/idb.html), which gathers data on 32 sociodemographic variables, per country and year. 

Regarding the third data source, we only selected 10 of the 32 available variables: 
* Population(#)
* Annual Growth Rate (%)
* Area in Square Kilometers
* Density (People per Sq)
* Total Fertility Rate
* Crude Birth Rate (per 1,000 people)
* Life Expectancy at Birth
* Infant Mortality Rate
* Crude Death Rate (per 1,000 people)
* Net Migration Rate. 


---


## Data Preprocessing
All the databases we used needed to be cleaned and transformed before being loaded into SQL. Thus, we loaded each of them into Google Colab Notebooks (look for the "data_preprocessing" notebooks in this repository) in order to perform this preprocessing. For each of the tables, we dropped the rows and columns we wouldn't use, checked for NaN and null values, as well as the data types for each column. After this, we transformed our tables into three separate CSV files: "Country_Codes.csv", "Migrant_Population_Final.csv" and "Country_Data_Final.csv".

---


## SQL
...


---


## Machine Learning Model
...


---


## Dashboard
...


---


## Results
...


---


## Summary / Recommendations
...
