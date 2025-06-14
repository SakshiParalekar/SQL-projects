-- COVID-19 Data Analysis System

-- Create Covid data Table
CREATE TABLE covid19_data (
    (id INT PRIMARY KEY,
     observation_date DATE,
     country/region VARCHAR(100),
     confirmed INT(11),
     deaths INT(11),
     recovered INT(11)
);

-- Total confirmed cases by country
 SELECT `Country/Region`, SUM(Confirmed) AS total_confirmed
 FROM covid19_data
 GROUP BY `Country/Region`
 ORDER BY total_confirmed DESC
 LIMIT 10;

-- Death rate per country
 SELECT `Country/Region`, SUM(Deaths) AS total_deaths,
       SUM(Confirmed) AS total_confirmed,
       ROUND(SUM(Deaths)/SUM(Confirmed)*100, 2) AS death_rate
 FROM covid19_data
 GROUP BY `Country/Region`
 HAVING total_confirmed > 1000
 ORDER BY death_rate DESC;

-- Trend for India by date
 SELECT Date, SUM(Confirmed) AS total_cases
 FROM covid19_data
 WHERE `Country/Region` = 'India'
 GROUP BY Date
 ORDER BY Date;

