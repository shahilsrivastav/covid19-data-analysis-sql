-- File: 01_data_cleaning.sql
-- Description: Data cleaning and preprocessing for COVID dataset

use covid_project;

-- NOTE:
-- The dataset was initially difficult to import due to datatype mismatchesand and missing values.
-- To handle this, all columns were first created as VARCHAR.
-- After importing the data successfully, cleaning and datatype conversions were performed.

-- Creating table covidDeaths

CREATE TABLE covidDeaths (
	iso_code VARCHAR(50),
	continent VARCHAR(50),
	location VARCHAR(100),
	date VARCHAR(50),
	population VARCHAR(50),
	total_cases VARCHAR(50),
	new_cases VARCHAR(50),
	new_cases_smoothed VARCHAR(50),
	total_deaths VARCHAR(50),
	new_deaths VARCHAR(50),
	new_deaths_smoothed VARCHAR(50),
	total_cases_per_million VARCHAR(50),
	new_cases_per_million VARCHAR(50),
	new_cases_smoothed_per_million VARCHAR(50),
	total_deaths_per_million VARCHAR(50),
	new_deaths_per_million VARCHAR(50),
	new_deaths_smoothed_per_million VARCHAR(50),
	reproduction_rate VARCHAR(50),
	icu_patients VARCHAR(50),
	icu_patients_per_million VARCHAR(50),
	hosp_patients VARCHAR(50),
	hosp_patients_per_million VARCHAR(50),
	weekly_icu_admissions VARCHAR(50),
	weekly_icu_admissions_per_million VARCHAR(50),
	weekly_hosp_admissions VARCHAR(50),
	weekly_hosp_admissions_per_million VARCHAR(50)
);

-- desc coviddeaths;

-- Disable safe update mode to allow bulk updates

SET SQL_SAFE_UPDATES = 0;  

-- Converting Date 

UPDATE covidDeaths
SET date = STR_TO_DATE(date, '%Y-%m-%d');

ALTER TABLE covidDeaths
MODIFY date DATE; 

-- CLEANING ALL COLUMNS

UPDATE covidDeaths
SET 
population = NULLIF(TRIM(population), ''),
total_cases = NULLIF(TRIM(total_cases), ''),
total_deaths = NULLIF(TRIM(total_deaths), ''),
new_cases = NULLIF(TRIM(new_cases), ''),
new_deaths = NULLIF(TRIM(new_deaths), '');

UPDATE covidDeaths
SET 
continent = NULLIF(TRIM(continent), '');

UPDATE covidDeaths
SET 
total_cases_per_million = NULLIF(TRIM(total_cases_per_million), ''),
new_cases_per_million = NULLIF(TRIM(new_cases_per_million), ''),
new_cases_smoothed = NULLIF(TRIM(new_cases_smoothed), ''),
new_cases_smoothed_per_million = NULLIF(TRIM(new_cases_smoothed_per_million), ''),
total_deaths_per_million = NULLIF(TRIM(total_deaths_per_million), ''),
new_deaths_smoothed = NULLIF(TRIM(new_deaths_smoothed), ''),
new_deaths_per_million = NULLIF(TRIM(new_deaths_per_million), ''),
new_deaths_smoothed_per_million = NULLIF(TRIM(new_deaths_smoothed_per_million), ''),
reproduction_rate = NULLIF(TRIM(reproduction_rate), ''),
icu_patients = NULLIF(TRIM(icu_patients), ''),
icu_patients_per_million = NULLIF(TRIM(icu_patients_per_million), ''),
hosp_patients = NULLIF(TRIM(hosp_patients), ''),
hosp_patients_per_million = NULLIF(TRIM(hosp_patients_per_million), ''),
weekly_icu_admissions = NULLIF(TRIM(weekly_icu_admissions), ''),
weekly_icu_admissions_per_million = NULLIF(TRIM(weekly_icu_admissions_per_million), ''),
weekly_hosp_admissions = NULLIF(TRIM(weekly_hosp_admissions), ''),
weekly_hosp_admissions_per_million = NULLIF(TRIM(weekly_hosp_admissions_per_million), '');

-- CONVERTING DATATYPES

ALTER TABLE covidDeaths
MODIFY total_cases DOUBLE,
MODIFY new_cases DOUBLE,
MODIFY total_deaths DOUBLE,
MODIFY new_deaths DOUBLE,
MODIFY population BIGINT;

ALTER TABLE covidDeaths
MODIFY total_cases_per_million DOUBLE,
MODIFY new_cases_per_million DOUBLE,
MODIFY new_cases_smoothed DOUBLE,
MODIFY new_cases_smoothed_per_million DOUBLE,
MODIFY total_deaths_per_million DOUBLE,
MODIFY new_deaths_smoothed DOUBLE,
MODIFY new_deaths_per_million DOUBLE,
MODIFY new_deaths_smoothed_per_million DOUBLE,
MODIFY reproduction_rate DOUBLE,
MODIFY icu_patients DOUBLE,
MODIFY icu_patients_per_million DOUBLE,
MODIFY hosp_patients DOUBLE,
MODIFY hosp_patients_per_million DOUBLE,
MODIFY weekly_icu_admissions DOUBLE,
MODIFY weekly_icu_admissions_per_million DOUBLE,
MODIFY weekly_hosp_admissions DOUBLE,
MODIFY weekly_hosp_admissions_per_million DOUBLE;

desc coviddeaths;

-- Creating table covidvaccinations

CREATE TABLE covidvaccinations (
    iso_code VARCHAR(50),
    continent VARCHAR(50),
    location VARCHAR(100),
    date VARCHAR(20),
    new_tests VARCHAR(50),
    total_tests VARCHAR(50),
    total_tests_per_thousand VARCHAR(50),
    new_tests_per_thousand VARCHAR(50),
    new_tests_smoothed VARCHAR(50),
    new_tests_smoothed_per_thousand VARCHAR(50),
    positive_rate VARCHAR(50),
    tests_per_case VARCHAR(50),
    tests_units VARCHAR(50),
    total_vaccinations VARCHAR(50),
    people_vaccinated VARCHAR(50),
    people_fully_vaccinated VARCHAR(50),
    new_vaccinations VARCHAR(50),
    new_vaccinations_smoothed VARCHAR(50),
    total_vaccinations_per_hundred VARCHAR(50),
    people_vaccinated_per_hundred VARCHAR(50),
    people_fully_vaccinated_per_hundred VARCHAR(50),
    new_vaccinations_smoothed_per_million VARCHAR(50),
    stringency_index VARCHAR(50),
    population_density VARCHAR(50),
    median_age VARCHAR(50),
    aged_65_older VARCHAR(50),
    aged_70_older VARCHAR(50),
    gdp_per_capita VARCHAR(50),
    extreme_poverty VARCHAR(50),
    cardiovasc_death_rate VARCHAR(50),
    diabetes_prevalence VARCHAR(50),
    female_smokers VARCHAR(50),
    male_smokers VARCHAR(50),
    handwashing_facilities VARCHAR(50),
    hospital_beds_per_thousand VARCHAR(50),
    life_expectancy VARCHAR(50),
    human_development_index VARCHAR(50)
);

desc covidvaccinations;

-- Converting Date 

UPDATE covidVaccinations
SET date = STR_TO_DATE(date, '%Y-%m-%d');

ALTER TABLE covidVaccinations
MODIFY date DATE;

-- CLEANING ALL COLUMNS

UPDATE covidVaccinations
SET 
new_tests = NULLIF(TRIM(new_tests), ''),
total_tests = NULLIF(TRIM(total_tests), ''),
total_tests_per_thousand = NULLIF(TRIM(total_tests_per_thousand), ''),
new_tests_per_thousand = NULLIF(TRIM(new_tests_per_thousand), ''),
new_tests_smoothed = NULLIF(TRIM(new_tests_smoothed), ''),
new_tests_smoothed_per_thousand = NULLIF(TRIM(new_tests_smoothed_per_thousand), ''),
positive_rate = NULLIF(TRIM(positive_rate), ''),
tests_per_case = NULLIF(TRIM(tests_per_case), ''),
total_vaccinations = NULLIF(TRIM(total_vaccinations), ''),
people_vaccinated = NULLIF(TRIM(people_vaccinated), ''),
people_fully_vaccinated = NULLIF(TRIM(people_fully_vaccinated), ''),
new_vaccinations = NULLIF(TRIM(new_vaccinations), ''),
new_vaccinations_smoothed = NULLIF(TRIM(new_vaccinations_smoothed), ''),
total_vaccinations_per_hundred = NULLIF(TRIM(total_vaccinations_per_hundred), ''),
people_vaccinated_per_hundred = NULLIF(TRIM(people_vaccinated_per_hundred), ''),
people_fully_vaccinated_per_hundred = NULLIF(TRIM(people_fully_vaccinated_per_hundred), ''),
new_vaccinations_smoothed_per_million = NULLIF(TRIM(new_vaccinations_smoothed_per_million), ''),
stringency_index = NULLIF(TRIM(stringency_index), ''),
population_density = NULLIF(TRIM(population_density), ''),
median_age = NULLIF(TRIM(median_age), ''),
aged_65_older = NULLIF(TRIM(aged_65_older), ''),
aged_70_older = NULLIF(TRIM(aged_70_older), ''),
gdp_per_capita = NULLIF(TRIM(gdp_per_capita), ''),
extreme_poverty = NULLIF(TRIM(extreme_poverty), ''),
cardiovasc_death_rate = NULLIF(TRIM(cardiovasc_death_rate), ''),
diabetes_prevalence = NULLIF(TRIM(diabetes_prevalence), ''),
female_smokers = NULLIF(TRIM(female_smokers), ''),
male_smokers = NULLIF(TRIM(male_smokers), ''),
handwashing_facilities = NULLIF(TRIM(handwashing_facilities), ''),
hospital_beds_per_thousand = NULLIF(TRIM(hospital_beds_per_thousand), ''),
life_expectancy = NULLIF(TRIM(life_expectancy), ''),
human_development_index = NULLIF(TRIM(human_development_index), '');

-- CONVERTING DATATYPES

ALTER TABLE covidVaccinations
MODIFY total_vaccinations DOUBLE,
MODIFY people_vaccinated DOUBLE,
MODIFY people_fully_vaccinated DOUBLE,
MODIFY new_vaccinations DOUBLE,
MODIFY new_vaccinations_smoothed DOUBLE;

ALTER TABLE covidVaccinations
MODIFY new_tests DOUBLE,
MODIFY total_tests DOUBLE,
MODIFY new_tests_per_thousand DOUBLE,
MODIFY total_tests_per_thousand DOUBLE,
MODIFY new_tests_smoothed DOUBLE,
MODIFY new_tests_smoothed_per_thousand DOUBLE;

ALTER TABLE covidVaccinations
MODIFY positive_rate DOUBLE,
MODIFY tests_per_case DOUBLE,
MODIFY total_vaccinations_per_hundred DOUBLE,
MODIFY people_vaccinated_per_hundred DOUBLE,
MODIFY people_fully_vaccinated_per_hundred DOUBLE,
MODIFY new_vaccinations_smoothed_per_million DOUBLE;

ALTER TABLE covidVaccinations
MODIFY stringency_index DOUBLE,
MODIFY population_density DOUBLE,
MODIFY median_age DOUBLE,
MODIFY aged_65_older DOUBLE,
MODIFY aged_70_older DOUBLE,
MODIFY gdp_per_capita DOUBLE,
MODIFY extreme_poverty DOUBLE;

ALTER TABLE covidVaccinations
MODIFY cardiovasc_death_rate DOUBLE,
MODIFY diabetes_prevalence DOUBLE,
MODIFY female_smokers DOUBLE,
MODIFY male_smokers DOUBLE,
MODIFY handwashing_facilities DOUBLE,
MODIFY hospital_beds_per_thousand DOUBLE,
MODIFY life_expectancy DOUBLE,
MODIFY human_development_index DOUBLE;

desc covidvaccinations;
