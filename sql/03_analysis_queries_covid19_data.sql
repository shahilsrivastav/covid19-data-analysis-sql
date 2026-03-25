-- File: 03_views.sql
-- Description: Creating reusable SQL views for COVID-19 analysis
-- Views are used to simplify complex queries and improve reusability

use covid_project;

-- Creating View to store data for later visualizations

CREATE VIEW Global_Stats AS
SELECT
    date,
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    ROUND((SUM(new_deaths) / NULLIF(SUM(new_cases),0)) * 100, 2) AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;

CREATE VIEW Country_Infection_Rate AS
SELECT 
    location, 
    population, 
    MAX(total_cases) AS HighestInfectionCount, 
    MAX((total_cases/NULLIF(population,0)))*100 AS InfectionPercentage
FROM CovidDeaths
GROUP BY location, population;

CREATE VIEW Country_Death_Count AS
SELECT 
    location, 
    MAX(total_deaths) AS totalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location;

CREATE VIEW Continent_Death_Summary AS
SELECT 
    continent,  
    SUM(new_deaths) AS TotalDeaths
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY continent;

CREATE VIEW Vaccination_Progress AS
SELECT 
    de.continent, 
    de.location, 
    de.date, 
    de.population, 
    va.new_vaccinations,
    SUM(va.new_vaccinations) OVER 
    (PARTITION BY de.location ORDER BY de.date) AS RollingPeopleVaccinated
FROM coviddeaths de
JOIN covidvaccinations va
ON de.location = va.location
AND de.date = va.date
WHERE de.continent IS NOT NULL;

CREATE VIEW Vaccination_Analysis AS
SELECT *,
(RollingPeopleVaccinated / NULLIF(population,0)) * 100 AS VaccinatedPercent
FROM Vaccination_Progress;

CREATE VIEW India_Covid_Analysis AS
SELECT 
    date,
    total_cases,
    total_deaths,
    ROUND((total_deaths / NULLIF(total_cases,0)) * 100, 2) AS Death_Percentage
FROM CovidDeaths
WHERE location = 'India'
ORDER BY date;

CREATE VIEW India_Vaccination_Analysis AS
SELECT 
    de.date,
    de.population,
    va.new_vaccinations,
    SUM(va.new_vaccinations) OVER (ORDER BY de.date) AS RollingVaccination,
    ROUND((SUM(va.new_vaccinations) OVER (ORDER BY de.date) / NULLIF(de.population,0)) * 100, 2) 
    AS VaccinatedPercent
FROM coviddeaths de
JOIN covidvaccinations va
ON de.location = va.location
AND de.date = va.date
WHERE de.location = 'India';