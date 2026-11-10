-- Aggregates & Grouping · T1/D — Average BMI of all cyclists

SELECT ROUND(AVG(weight / ((height/100.0)*(height/100.0))), 2) AS "AVG_BMI"
FROM cycling.athlete;
