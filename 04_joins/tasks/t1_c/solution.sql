-- Joins · T1/C — Cycling: BMI classification (non-equi join)

SELECT first_name, last_name,
       weight / ((height / 100.0) * (height / 100.0)) AS bmi_value,
       b.category
FROM cycling.athlete a, bmi b
WHERE weight / ((height / 100.0) * (height / 100.0)) < b.upper 
      AND weight / ((height / 100.0) * (height / 100.0)) >= b.lower;
