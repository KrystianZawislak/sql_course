-- Data Manipulation (DML) · T3/A — Deleting early graduates
-- run ../t2_c/solution.sql first (creates dziekanat.absolwenci)

DELETE FROM dziekanat.absolwenci WHERE data_ukonczenia <= '2012-12-31';
