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
All the databases we used needed to be cleaned and transformed before being loaded into SQL. Thus, we loaded each of them into Google Colab Notebooks (look for the 'data_preprocessing' notebooks in this repository) in order to perform this preprocessing. For each of the tables, we dropped the rows and columns we wouldn't use, checked for NaN and null values, as well as the data types for each column. After this, we transformed our tables into three separate CSV files: 'Country_Codes.csv', 'Migrant_Population_Final.csv' and 'Country_Data_Final.csv'.

---


## SQL
TODO: Explain the data loading process, as well as the steps we went through in order to join the two main tables. 


---


## Machine Learning Model

In order to build our machine learning model, we used the 'Migration_Data.csv' table that was created through PosgreSQL. This table has all the data contained in our two main tables: 'Migrant_Population' and 'Country_Data'. The file named 'machine_learning_model.ipynb' contains the code we implemented for this model, where you'll be able to see the following process:

1. After importing the DataFrame and reordering its columns, we decided to change the values of our 'migration_flag' column. This column contains the data that states if a country has a positive or negative Net Migration Rate for a given year. So, instead of having 't' (positive) and 'f' (negative) as our boolean values, we replaced them with 1 (true) and 0 (false). 

2. After this, we first made sure that all of our columns had the required data type. Then, we started the process of splitting our data into training and testing. For this, we created our features (creating dummies for our string values, and dropping our target column) and our target (the 'migration_flag' column). 

![image](https://user-images.githubusercontent.com/113153777/223560456-9f4bfcda-d94e-414f-805c-112e640fc07c.png)

3. We made sure to have balanced values for each category in the 'migration_flag' column, and split our data after that. We also decided to scale the data because the values for our columns had very different dimensions. 

![image](https://user-images.githubusercontent.com/113153777/223561006-4b47937b-f495-4f6b-84e4-5f9d266e3ef8.png)

4. For the actual model, we decided to use the **Random Forest Classifier**, since this seems to be one of the most efficient types of machine learning models. 

![image](https://user-images.githubusercontent.com/113153777/223561338-7158c349-f7eb-4f92-ac4c-fbcf57dd2558.png)

5. The first results of our model indicated that it was **overfitting**, since we had an accuracy score of 100%. Thus, we decided to look at the feature importances, and tried dropping some columns with the purpose of improving our model. For this, we dropped the 'Year' and 'Country_Area' columns (which had the lowest ranking of importance), as well as the 'Net_Migration_Rate' column (which was the most important column). After doing this, our model improved significantly, and we obtained the following results: 

**Confusion Matrix:**

![image](https://user-images.githubusercontent.com/113153777/223563190-560ef787-2bb9-4671-b512-6356bd793957.png)

**Accuracy Score: 0.87**

![image](https://user-images.githubusercontent.com/113153777/223563267-43178ab7-f171-4f6d-ab54-a61642cdf73e.png)

**Classification Report:**

![image](https://user-images.githubusercontent.com/113153777/223563348-7868c1a7-daa5-4b76-9f2f-4c151122b4c5.png)

These results seemed just right for us, as they indicated that the model could be flexible for predictions based on new data. 

6. Finally, we calculated the feature importances for our modified model. According to our code, the three most important features for the model are 'Annual Growth Rate', 'Infant Mortality Rate', and 'Total Fertility Rate'.

![image](https://user-images.githubusercontent.com/113153777/223564037-eb686f65-e239-44da-921c-51b6ebed4cab.png)

---


## Dashboard
...


---


## Results
...


---


## Summary / Recommendations
...
