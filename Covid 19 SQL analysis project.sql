----------------- Covid 19 India Analysis-----------------

-- ============================================================
-- PROJECT  : COVID-19 India Data Analysis
-- TOOL     : PostgreSQL
-- AUTHOR   : Taniya Sahu
-- DATE     : 2026
-- DESC     : Analysis of state-wise COVID-19 cases, deaths,
--            recovery rates and vaccination data across India
-- ============================================================

-- ------------------------------------------------------------
-- STEP 1 : CREATE TABLES
-- ------------------------------------------------------------

-- Table 1 : COVID Cases (State wise)
CREATE TABLE covid_cases (
    state VARCHAR(100),
    total_cases BIGINT,
    active BIGINT,
    discharged BIGINT,
    deaths BIGINT,
    active_ratio FLOAT,
    discharge_ratio FLOAT,
    death_ratio FLOAT,
    population BIGINT
);

-- Table 2 : Vaccination Data (State wise)
CREATE TABLE vaccination (
    state VARCHAR(100),
    total_doses BIGINT,
    dose1 BIGINT,
    dose2 BIGINT,
    dose1_15_18 BIGINT,
    dose2_15_18 BIGINT,
    dose1_12_14 BIGINT,
    dose2_12_14 BIGINT,
    precaution_18_59 BIGINT,
    population BIGINT
);

-- ------------------------------------------------------------
-- STEP 2 : ANALYSIS QUERIES
-- ------------------------------------------------------------

-- Query 1 : Total Cases, Deaths, Recovered India wide
-- Purpose : Get overall India level summary of COVID impact
SELECT 
    SUM(total_cases) AS total_cases,
    SUM(deaths) AS total_deaths,
    SUM(discharged) AS total_recovered
FROM covid_cases;


-- Query 2 — Top 10 Most Affected States
-- Purpose : Identify states with highest COVID burden
SELECT state, total_cases, deaths, discharged
FROM covid_cases
ORDER BY total_cases DESC
LIMIT 10;


-- Query 3 — Death Rate vs Recovery Rate by State
-- Purpose : Compare how well each state managed COVID outcomes
SELECT state, 
       death_ratio AS death_rate,
       discharge_ratio AS recovery_rate,
       active_ratio AS active_rate
FROM covid_cases
ORDER BY death_ratio DESC;


-- Query 4 — Top 10 Vaccinated States
-- Purpose : Find states leading in vaccination drive
SELECT state, total_doses, dose1, dose2
FROM vaccination
ORDER BY total_doses DESC
LIMIT 10;


-- Query 5 — Cases vs Vaccination comparison
-- Purpose : Find states leading in vaccination drive
SELECT 
    c.state,
    c.total_cases,
    c.deaths,
    v.total_doses,
    v.dose1,
    v.dose2
FROM covid_cases c
JOIN vaccination v ON LOWER(TRIM(c.state)) = LOWER(TRIM(v.state))
ORDER BY c.total_cases DESC;


-- Query 6 — Vaccination coverage percentage
-- Purpose : Calculate what % of population got vaccinated
SELECT 
    state,
    total_doses,
    population,
    ROUND((total_doses::numeric / population) * 100, 2) AS vaccination_coverage_pct
FROM vaccination
ORDER BY vaccination_coverage_pct DESC;


-- Query 7 — Low recovery rate states (danger zones)
-- Purpose : Identify states where recovery rate was below 95%
SELECT state, total_cases, discharge_ratio, death_ratio
FROM covid_cases
WHERE discharge_ratio < 95
ORDER BY discharge_ratio ASC;


-- Query 8 — States with highest active cases
-- Purpose : Find states still having high active case burden
SELECT state, active, total_cases,
       ROUND((active::numeric / total_cases) * 100, 2) AS active_pct
FROM covid_cases
ORDER BY active DESC
LIMIT 10;



-- ============================================================
-- KEY INSIGHTS FROM ANALYSIS
-- ============================================================
-- 1. Maharashtra, Kerala and Karnataka were top 3 most
--    affected states by total cases
-- 2. Recovery rate across most states was above 95%
--    showing effective medical response
-- 3. States with higher vaccination coverage showed
--    lower active case percentages
-- 4. Dose 1 completion was significantly higher than
--    Dose 2 across all states
-- 5. Some smaller states showed vaccination doses higher
--    than population due to migrant worker vaccinations
-- ============================================================

