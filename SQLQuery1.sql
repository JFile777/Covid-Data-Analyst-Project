Select *
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
order by 3,4

--Select *
--From [JACKSON-COVID-Portfolio-Project]..CovidVaccinations
--order by 3,4
--Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
order by 1,2



--Looking at Total cases vs Total Deaths
-- Shows likelihood of dying if contracted in your country
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as Deathpercentage --no conversion null
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
Where location like '%states%'
order by 1,2



Select Location, date, total_cases,total_deaths, 
(convert(decimal,total_deaths)/NULLIF(CONVERT(decimal, total_cases),0)) * 100 AS Deathpercentage --change to decimal, wont work with float or numeric value
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
Where location like '%states%'
order by 1,2


Select location, date, total_cases,total_deaths, 
(CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 AS Deathpercentage --YT commenter query
from [JACKSON-COVID-Portfolio-Project]..covidDeaths
order by 1,2


--Looking at total cases vs Population 
--Shows what % of People tested postive for Covid

Select location, date, total_cases, Population, (total_cases/Population)*100 as DeathPercentage
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
where location like '%states%'
order by 1,2


--Looking at countries with highest infection rate compared to population

Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
--where locatin like '%states%'\
Group by Location, Population
order by PercentPopulationInfected desc

--Showing Countries with Highest Death Count Per Population

Select Location, MAX(Total_deaths) as TotalDeathCount
From [JACKSON-COVID-Portfolio-Project]..CovidDeaths
--where locatin like '%states%'\
Group by Location
order by TotalDeathCount desc