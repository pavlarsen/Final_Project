CREATE TABLE migration_data AS
SELECT country_data.country_id_alpha, country_data.country_name, country_data."year", country_data.total_country_population, country_data.annual_growth_rate, country_data.country_area, country_data.population_density, country_data.total_fertility_rate, country_data.crude_birth_rate, country_data.life_expectancy_at_birth, country_data.infant_mortality_rate, country_data.crude_death_rate, country_data.net_migration_rate, country_data.migration_flag, migrant_population.total_migrant_population, migrant_population.migrant_male_population, migrant_population.migrant_female_population
FROM country_data
LEFT JOIN migrant_population
ON country_data.country_id_alpha = migrant_population.country_id_alpha
AND migrant_population."year" = country_data."year"
;