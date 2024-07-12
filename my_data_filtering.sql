USE ai_db;
CREATE VIEW country_talent_gs_mostpopulationordered AS
SELECT country, talent,government_strategy,population FROM ai_data
ORDER BY population DESC ;

# I wanted to check maybe there is a relationship with AI_talet_score ;
#If the country more crowded; than people who are talented with IA appear more in thet country:
# I need a point graph which compare population and the talent


# FIND THE AVARAGE POINT SCORE AND AVARAGE POPULATION 

SELECT AVG(talent) AS averafe_talent_score
FROM ai_data;

#we saw that average talent scor for countries is 16.9

CREATE VIEW talent_under_avg AS 
SELECT country, talent, population
FROM ai_data
WHERE talent < (SELECT AVG(talent) FROM ai_data)
ORDER BY talent DESC ;

#the countries under the avarage 

CREATE VIEW  talent_over_avg AS
SELECT country, talent, population
FROM ai_data
WHERE talent >(SELECT AVG(talent) FROM ai_data)
ORDER BY talent DESC
;

SELECT COUNT(country) FROM talent_under_avg;
# how many country under avarage

SELECT STDDEV_POP(talent) AS std_dev_talent
FROM ai_data;


SELECT country, talent
FROM ai_data
ORDER BY talent DESC;
#The countries and talet scores in order to highest talented country


SELECT  country,government_strategy, talent
FROM ai_data
ORDER BY government_strategy DESC;

#countries and goverment strategies  comparing 


SELECT  AVG(government_strategy) AS average_goverment_strategy
FROM ai_data;

SELECT Country, government_strategy, talent
FROM ai_data
WHERE government_strategy > (SELECT AVG(government_strategy) FROM ai_data)
AND talent < (SELECT AVG(talent) FROM ai_data);

#the good goverment strategy and bad ai 


SELECT Country, government_strategy, talent
FROM ai_data
WHERE government_strategy <(SELECT AVG(government_strategy) FROM ai_data)
AND talent >(SELECT AVG(talent) FROM ai_data);

#the bad goverment strategy and good score





#lets check the investment talent relationship:

