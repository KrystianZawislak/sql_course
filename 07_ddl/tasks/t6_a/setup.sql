-- Data for task T6/A: the ddl schema and the studenci_2 table from the lecturer's examples

CREATE SCHEMA IF NOT EXISTS ddl;

DROP TABLE IF EXISTS ddl.studenci_2;
CREATE TABLE ddl.studenci_2 (
	nr_albumu character varying(6),
	imie character varying(20),
	nazwisko character varying(30),
	pesel character(11),
	data_urodzenia date,
	kierunek_studiow character varying(50) DEFAULT 'Informatyka'
);

ALTER TABLE ddl.studenci_2 ADD COLUMN wydzial_uczelni character varying(30) NOT NULL DEFAULT 'Wydział Nauk Technicznych';
