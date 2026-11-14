-- Joins · Problem task — #Cycling — T2/D/0: BMI classification with a category table
-- (run ../setup.sql first)

SELECT first_name, last_name,
       weight / ((height / 100.0) * (height / 100.0)) AS bmi_value,
       b.category
FROM cycling.athlete a, bmi b
WHERE weight / ((height / 100.0) * (height / 100.0)) < b.upper
      AND weight / ((height / 100.0) * (height / 100.0)) >= b.lower;
