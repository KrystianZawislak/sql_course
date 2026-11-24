-- Data Manipulation (DML) · T4/A — Promotion and raise for a lecturer

UPDATE kadry.prowadzacy SET tytul = ('prof. dr hab.'), placa_zasadnicza = placa_zasadnicza + 1500
WHERE imie = 'Alina' AND nazwisko = 'Alinecka';
