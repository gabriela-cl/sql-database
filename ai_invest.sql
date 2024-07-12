USE ai_index;
SELECT * FROM ai_data;

#Hypotheses: there are more investiment 
#(comercial = startups & government) in countries with higher GDP

DROP VIEW IF EXISTS gdp_invest;
CREATE VIEW gdp_invest AS 
SELECT country, gdp_per_capta, government_strategy, commercial
FROM ai_data
ORDER BY gdp_per_capta DESC;

SELECT * FROM gdp_invest;

DROP TEMPORARY TABLE IF EXISTS gdp_country;
CREATE TEMPORARY TABLE gdp_country AS (
SELECT country, gdp_per_capta
FROM gdp_invest
ORDER BY gdp_per_capta DESC
LIMIT 10);

SELECT * FROM gdp_country;

DROP TEMPORARY TABLE IF EXISTS gdp_gov;
CREATE TEMPORARY TABLE gdp_gov AS (
SELECT country, gdp_per_capta, government_strategy
FROM gdp_invest
ORDER BY government_strategy DESC
LIMIT 10);

SELECT * FROM gdp_gov;

DROP TEMPORARY TABLE IF EXISTS gdp_commercial;
CREATE TEMPORARY TABLE gdp_commercial AS (
SELECT country, gdp_per_capta, commercial
FROM gdp_invest
ORDER BY commercial DESC
LIMIT 10);

SELECT * FROM gdp_commercial;