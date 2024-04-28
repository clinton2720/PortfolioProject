SELECT*
FROM portfolio..coviddeaths
ORDER BY 3,4

--SELECT*
--FROM portfolio..covidvaccinations
--ORDER BY 3,4
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM portfolio..coviddeaths
ORDER BY  1,2

SELECT Location, date, total_cases, total_deaths,
FROM portfolio..coviddeaths
ORDER BY  1,2
Select location, date, total_cases,total_deaths, 
(CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 AS Deathpercentage
from Portfolio..covidDeaths
order by 1,2
Select location, date, total_cases,total_deaths, 
(CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases))






Select location, date,population, total_cases,
(total_cases/population) * 100 AS casepercentage
from Portfolio..covidDeaths
--where location like '%india%'
order by 1,2





Select Location, Population, MAX(total_cases) as HighestInfectionCount, max((total_cases/population)) * 100 AS PercentPopulationInfected
from Portfolio..covidDeaths
--where location like '%india%'
Group By location, population
order by 1,2


Select continent, MAX(CAST(TOTAL_DEATHS as int)) as TotalDeathCount
from Portfolio..covidDeaths
--where location like '%india%'
where continent is not null
Group By continent
order by TotalDeathCount desc


--global numbers

Select sum(new_cases) as TotalCases, sum(CAST(new_DEATHS as int)) as	TotalDeaths, sum(CAST(new_DEATHS as int))/sum(new_cases)*100 as DeathPercentage
 From Portfolio..covidDeaths
--where location like '%india%'
where continent is not null
--Group By date
order by 1,2

SELECT 
    date,
    SUM(new_cases) AS TotalCases,
    SUM(CAST(new_DEATHS AS int)) AS TotalDeaths,
    SUM(CAST(new_DEATHS AS int)) / SUM(new_cases) * 100 AS DeathPercentage
FROM 
    Portfolio..covidDeaths
WHERE 
    continent IS NOT NULL
GROUP BY 
    continent, date
ORDER BY 
    TotalDeaths DESC;



	SELECT 
    date,
    SUM(new_cases) AS TotalCases,
    SUM(CAST(new_DEATHS AS int)) AS TotalDeaths,
    CASE 
        WHEN SUM(new_cases) > 0 THEN 
            (SUM(CAST(new_DEATHS AS int)) / SUM(new_cases)) * 100 
        ELSE 
            0 
    END AS DeathPercentage
FROM 
    Portfolio..covidDeaths
WHERE 
    continent IS NULL
GROUP BY 
    date
ORDER BY 
    date;


	select*
	from portfolio..coviddeaths dea
	join portfolio..covidvaccinations vac
	   on dea.location = vac.location
	   and dea.date = vac.date


	   -- CREATING VIEW TO STORE DATA FOR LATER VISUALS
	   CREATE VIEW TotalDeaths
as Select sum(new_cases) as TotalCases, sum(CAST(new_DEATHS as int)) as	TotalDeaths, sum(CAST(new_DEATHS as int))/sum(new_cases)*100 as DeathPercentage
 From Portfolio..covidDeaths
--where location like '%india%'
where continent is not null
Group By date
--order by 1,2
