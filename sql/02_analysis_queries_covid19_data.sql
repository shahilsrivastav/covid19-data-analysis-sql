-- File: 02_analysis_queries.sql
-- Description: SQL queries for exploratory data analysis of COVID-19 dataset
-- Includes country-level, continent-level, and global analysis

use covid_project;


select * from coviddeaths;

select * from covidvaccinations;

-- Select Data that we are going to be starting with

Select
	Location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	population
From CovidDeaths
order by location, date;

-- Looking at total cases vs total deaths and percentage of death in India

Select
	Location,
    date,
    total_cases,
    total_deaths,
    round((total_deaths/NULLIF(total_cases,0))*100, 2) as Death_percentage
From CovidDeaths
where location = 'India'
order by location, date;

-- Looking at total cases vs population
-- shows what percentage of population got covid

Select
	Location,
    date,
    population,
    total_cases,
    (total_cases/ NULLIF(population,0))*100 as Covidcase_percentage
From CovidDeaths
where location = 'India'
order by location, date;

-- Looking at the country with highest infection rate compared to population

Select
	Location,
    population,
    max(total_cases) as HighestInfectionCount,
    max((total_cases/ NULLIF(population,0)))*100 as HighestCovidcasePercentage
From CovidDeaths
group by Location, population
order by HighestCovidcasePercentage desc;

-- Showing countries with highest death count per population

Select
	Location,
    max(total_deaths) as totalDeathCount
From CovidDeaths
where continent is not null
group by Location
order by totalDeathCount desc;

-- Breaking things down by continent
-- Showing contintents with the highest death count per population

select
	continent, 
    sum(new_deaths) as TotalDeathsCount
from coviddeaths
where continent is not null
group by continent 
order by totaldeathsCount desc;

-- Global numbers

Select
	date,
    sum(new_cases) as total_cases,
    sum(new_deaths) as total_deaths,
    ROUND((SUM(new_deaths) / NULLIF(SUM(new_cases),0)) * 100, 2) AS DeathPercentage
From CovidDeaths
WHERE continent IS NOT NULL
group by date
order by date;

-- Looking at total population vs vaccination
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

select
	de.continent,
    de.location,
    de.date,
    de.population,
    va.new_vaccinations,
	sum(va.new_vaccinations) over
	(partition by de.location order by de.location, de.date) as RollingPeopleVaccinated
from coviddeaths de
join covidvaccinations va
on de.location = va.location
and de.date = va.date
where de.continent is not null
order by location, date;

-- Using CTE to perform Calculation on Partition By in previous query

with popvsvac (continent, location, date, population, new_vaccination, RollingPeopleVaccinated)
as
(
	select
		de.continent,
        de.location,
        de.date,
        de.population,
        va.new_vaccinations,
		sum(va.new_vaccinations) over 
        (partition by de.location order by de.location, de.date) as RollingPeopleVaccinated
	from coviddeaths de
	join covidvaccinations va
		on de.location = va.location
		and de.date = va.date
	where de.continent is not null
	-- order by location, date
)
select *,
(RollingPeopleVaccinated/NULLIF(population,0))*100 as RollingPeopleVaccinatedPercentage
from popvsvac;

-- showing India Vaccination Progress

SELECT 
    de.date,
    de.population,
    va.new_vaccinations,
    SUM(va.new_vaccinations) OVER (ORDER BY de.date) AS RollingVaccination,
    ROUND((SUM(va.new_vaccinations) OVER (ORDER BY de.date) / de.population) * 100, 2) 
    AS VaccinatedPercent
FROM coviddeaths de
JOIN covidvaccinations va
ON de.location = va.location
AND de.date = va.date
WHERE de.location = 'India';




