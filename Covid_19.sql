--Check Data type
/*SELECT TABLE_CATALOG,
    TABLE_SCHEMA,
    TABLE_NAME, 
    COLUMN_NAME, 
    DATA_TYPE 
    FROM INFORMATION_SCHEMA.COLUMNS*/


--Change Data type
--CovidDeaths Changes
ALTER TABLE Covid_19..CovidDeaths
ALTER COLUMN new_cases float  

ALTER TABLE Covid_19..CovidDeaths
ALTER COLUMN total_cases float

ALTER TABLE Covid_19..CovidDeaths
ALTER COLUMN new_deaths float 

ALTER TABLE Covid_19..CovidDeaths
ALTER COLUMN total_deaths float

ALTER TABLE Covid_19..CovidDeaths
ALTER COLUMN population float

----CovidVaccintaion Changes
ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN new_tests float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN total_tests float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN positive_rate float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN tests_per_case float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN new_vaccinations float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN total_vaccinations float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN people_vaccinated float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN people_fully_vaccinated float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN stringency_index float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN median_age float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN gdp_per_capita float

ALTER TABLE Covid_19..CovidVaccination
ALTER COLUMN human_development_index float

--Test

SELECT *, CONVERT(VARCHAR, date, 104) as "date"
FROM Covid_19..CovidVaccination 
WHERE continent <> ' ' 
ORDER BY 2,3

--Total_Data_Present

SELECT COUNT(*) as Total_Data_Present_Death
FROM Covid_19..CovidDeaths 
SELECT COUNT(*) as Total_Data_Present_Vaccination
FROM Covid_19..CovidVaccination 


--Data Cleaning

SELECT continent, location, CONVERT(VARCHAR, date, 104) as "date", new_cases, total_cases,
new_deaths, total_deaths, population
FROM Covid_19..CovidDeaths 
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0
ORDER BY 1,2 

--Data Exploration

-- World's Total Cases vs Total Death 
SELECT continent, location, CONVERT(VARCHAR, date, 104) as "date",  total_deaths, total_cases,
(total_deaths/total_cases)*100 as DeathPercentage
FROM Covid_19..CovidDeaths 
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0
ORDER BY 1,2 

-- World's Total Cases vs Population

SELECT continent, location, CONVERT(VARCHAR, date, 104) as "date",total_cases ,population,
(total_cases/population)*100 as InfectionRate
FROM Covid_19..CovidDeaths 
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0
ORDER BY 1,2 

-- World's Total Death vs Population
   
SELECT continent, location, CONVERT(VARCHAR, date, 104) as "date",total_deaths ,population,
(total_deaths/population)*100 as MortalityRate
FROM Covid_19..CovidDeaths 
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0
ORDER BY 1,2

--Total Infection Rate per Country
SELECT location,MAX(total_cases) as CurrentCaseCount, MAX(population) as TotalPopulation
FROM Covid_19..CovidDeaths 
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0
GROUP BY location
ORDER BY CurrentCaseCount DESC

--Total Mortality Rate per Country
SELECT location,MAX(total_deaths) as CurrentDeathCount, MAX(population) as TotalPopulation
FROM Covid_19..CovidDeaths 
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0
GROUP BY location
ORDER BY CurrentDeathCount DESC

--Final Cleaned Covid Death Dataset
WITH CovDeaths (continent, location,date , population,new_cases, total_cases,
new_deaths, total_deaths)
AS
(
SELECT continent, location, CONVERT(VARCHAR, date, 104) as "date" ,population,new_cases , total_cases,
new_deaths, total_deaths 
FROM Covid_19..CovidDeaths 
)
SELECT *,(total_deaths/total_cases)*100 as DeathPercentage, (total_cases/population)*100 as InfectionRate,
(total_deaths/population)*100 as MortalityRate
FROM CovDeaths
WHERE continent <> ' ' AND population <> 0 AND total_cases <> 0 
--AND location ='India'
ORDER BY 1,2

--Final Vaccinations Dataset

SELECT de.continent, de.location, CONVERT(VARCHAR, de.date, 104) as "date" ,vac.new_tests,vac.total_tests, vac.total_vaccinations,vac.people_vaccinated,vac.people_fully_vaccinated,vac.positive_rate,vac.tests_per_case
FROM Covid_19..CovidDeaths de
JOIN Covid_19..CovidVaccination vac
	on de.location = vac.location
	AND de.date = vac.date 
WHERE de.continent <> ' ' AND de.population <> 0 AND de.total_cases <> 0
ORDER BY  1,2



