-- Aggregates & Grouping · T4/B — Average BMI and athlete counts

SELECT AVG(weight / ((height/100.0)*(height/100.0))) AS "AVG BMI OF ALL CYCLISTS",
       COUNT(*) AS "ALL CYCLISTS",
       COUNT(height*weight) AS "CYCLISTS WITH CALCULATED BMI"
FROM cycling.athlete;
