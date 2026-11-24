-- WHERE Clause & Set Operators · T1/G — Students born in a leap year

SELECT nr_albumu, imie, EXTRACT(YEAR from data_urodzenia)
FROM dziekanat.studenci
WHERE (EXTRACT(YEAR from data_urodzenia) % 4 = 0 AND EXTRACT(YEAR from data_urodzenia) % 100 != 0)
       OR EXTRACT(YEAR from data_urodzenia) % 400 = 0;
