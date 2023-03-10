# Final Project: The Migration Phenomenon and Machine Learning

## Project Overview

When we think about Data Analysis and Machine Learning, we tipically find it useful for business solutions. However, both have an enormous potential to help solve a wide range of issues, such as those that fall into the category of 'social phenomena'. Through this project, we aimed at coming up with a machine learning solution for an issue that is included in that very category: **migration**. 

The main purpose of the project was to analyze two datasets, build a database and create a Machine Learning Model that would help us predict if a country's *Net Migration Rate* (the number of migrants they receive vs. the number of migrants they produce) fell into one of two categories: **Positive or Negative**. 

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

In order to organize and structure the data, we decided to use Google Colab so that everyone could work on the code remotely. With the help of Python and the Pandas library, we cleaned and transformed the different databases. Finally, we exported the tables as csv files and uploaded everything into Github. The raw data was then uploaded and manipulated in PgAdmin in order to join our different tables and being able to create a new table to be used for the Machine Learning process. As for the Machine Learning algorithm two different libraries were used to achieve the goal: Imbalanced Learn and Tensorflow. From each of these libraries a model was used and trained as to have a comparisson and a optimized model.


---


## Project Steps

1. Theme and database selection.
2. Data preprocessing.
3. Loading the data into SQL and joining our tables.
4. Constructing our Machine Learning Model. 
5. Data analysis and visualization. 


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
After completing the Data Preprocessing step, we loaded our tables into PosgreSQL (you can find the schema in the 'SQL' folder). A PostgreSQL database was created as to save all the preprocessed data intact for future reference if needed and to verify that our queries ran successfully. First we had to write a query to create the schema of the Database with help of the ERD. So for this part the table "Country Codes" was the key piece in order to have a table with a primary key ("Country_ID_Alpha") that can be referenced by other tables, in our case the preprocessed data, so for this table it was necessary to create also a csv file which can be found next to the other preprocessed documents. Next, creating the tables that mimic the structure of the preprocessed csv files was easy enough. 

![Captura de pantalla (1059)](https://user-images.githubusercontent.com/110573146/224176755-649df649-5297-4962-8e59-31919d551a2c.png)

Once the the schema was done all that was left was to import the data, but before doing this, however, we had some minor data issues that we had to fix, such as different ID names for a few countries and a primary key missing in "Country Codes". Fortunately, we were able to solve these issues quickly and continue with the import.

Once the tables were uploaded successfully to PgAdmin, we created a new table that would join the two main tables (country data and migrant population). For this step we used the following schema:

![Captura de pantalla 2023-03-08 a la(s) 20 12 38](https://user-images.githubusercontent.com/113866707/223898074-93964fe9-f0ab-4afa-ac2c-755cde0a5d96.png)

The final output was the new "Migration_Data" table which we used for the Machine Learning algorithm.


---


## Machine Learning Model

In order to build our machine learning model, we used the 'Migration_Data.csv' table that was created through PosgreSQL. This table has all the data contained in our two main tables: 'Migrant_Population' and 'Country_Data'. The file named 'machine_learning_model.ipynb' contains the code we implemented for this model, where you'll be able to see the following process:

1. After importing the DataFrame and reordering its columns, we decided to change the values of our 'migration_flag' column. This column contains the data that states if a country has a positive or negative Net Migration Rate for a given year. So, instead of having 't' (positive) and 'f' (negative) as our boolean values, we replaced them with 1 (true) and 0 (false). 

2. After this, we first made sure that all of our columns had the required data type. Then, we started the process of splitting our data into training and testing. For this, we created our features (creating dummies for our string values) and dropping our target column (the 'migration_flag' column). We made sure to have balanced values for each category in the 'migration_flag' column, and split our data after that. We also decided to scale the data because the values for our columns had very different dimensions. 

4. For the actual model, we decided to implement and compare the **Random Forest Classifier** and a **Deep Learning Model** since they seem to be the most efficient types of machine learning models. First, we tried using the Random Forest Classifier. The first results of this model indicated that it was **overfitting**, since we had an accuracy score of 100%. Thus, we decided to look at the feature importances, and tried dropping some columns with the purpose of improving our model. For this, we dropped the 'Year' and 'Country_Area' columns (which had the lowest ranking of importance), as well as the 'Net_Migration_Rate' column (which was the most important column). After doing this, our model improved significantly, and we obtained the following results: 

**Confusion Matrix:**

![image](https://user-images.githubusercontent.com/113153777/223563190-560ef787-2bb9-4671-b512-6356bd793957.png)

**Accuracy Score: 0.87**

![image](https://user-images.githubusercontent.com/113153777/223563267-43178ab7-f171-4f6d-ab54-a61642cdf73e.png)

**Classification Report:**

![image](https://user-images.githubusercontent.com/113153777/223563348-7868c1a7-daa5-4b76-9f2f-4c151122b4c5.png)

We also calculated the feature importances for our modified model. According to our code, the three most important features for the model are 'Annual Growth Rate', 'Infant Mortality Rate', and 'Total Fertility Rate'.

![image](https://user-images.githubusercontent.com/113153777/223564037-eb686f65-e239-44da-921c-51b6ebed4cab.png)

5. When it came to our Deep Learning Model, we decided to use two layers with 16 and 8 nodes, respectively, as well as the Tanh activation function and a total of 100 epochs. After running the model, we had the following Loss and Accuracy results: 

![image](https://user-images.githubusercontent.com/113153777/223900996-12478f52-be83-46e2-b0d5-a8e86f7e5d67.png)

6. After finishing these steps, we were curious to see if these two models would still work well if we removed all the migration data, taking into account that this is typically the information that is more difficult to find. So, we tested both models only using the country data. Again, we created our features and our target:

![Screenshot 2023-03-07 at 20 24 21](https://user-images.githubusercontent.com/114035736/223603398-7d12ca0f-b25d-42f6-929d-286eb501d039.png)

7. For the **Random Forest Classifier** we came to these results:

**Confusion Matrix:**

![Screenshot 2023-03-07 at 20 31 32](https://user-images.githubusercontent.com/114035736/223604566-f0d6ba93-45a9-4c7f-9b86-1e8248682ca9.png)

**Accuracy Score : 0.88**

![Screenshot 2023-03-07 at 20 33 07](https://user-images.githubusercontent.com/114035736/223604779-3375fb14-7b13-418a-b42c-129678fa4ae1.png)

**Classification Report**

![Screenshot 2023-03-07 at 20 33 51](https://user-images.githubusercontent.com/114035736/223604884-ec173308-6425-4197-8a02-2063e992f671.png)

Comparing both results, we think we achieved a more accurate model (0.02%) just by clearing migration data. And, calculating the features' importance, we found that our bottom features changed to 'population_density', 'total_country_population' & 'crude_death_rate'.

8. For our ""Deep Learning Model"", we also saw an improvement in score, as we achieved the following results:
![image](https://user-images.githubusercontent.com/113153777/223901112-b1b20d3b-b83e-4adf-bcf6-781b945e92c1.png)

It was decided upon these two models because while investigating among the models it was often mentioned that both Random Forest and Deep Learning had the best overall accuracy score. So we decided to put this trait into action, we wanted to see the comparison. Another reason was the easy process of implementing the Random Forest and how fast it was to play around with as mentioned before by eliminating columns and running it again, while Deep learning took longer to implement and to run, also the computer power needed to run Deep learning models is far higher so it takes more time to train. In other words we wanted to see the performance difference between a easy to compute and program and low computer power model to a harder to program and high computer power as two alternatives that could fit most people around the world.    

---


## Dashboard

In order to start working on the dashboard, we had to have our code already done to decide if it is better to compare date or just present our outcomes. As we are going to manage extended and comparative data, we have decided to go for Tableau because we found its visibility and features more suitable for the project.

Seeking for more answers, we found that it is possible to compare migration data in order to predict how countries will behave. For example, comparing 'crude_birth_rate' with 'total_migrant_population' to answer which country is more likely to have a higher birth control rate or promote more benefits to make their people stay, therefore where will be a better place to invest. 

...


---


## Results
...


---


## Summary / Recommendations
...
