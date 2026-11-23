-- Data Definition (DDL) · T6/A — Dropping a table
-- run setup.sql first

-- When nothing references the table (no foreign keys from other tables, no views):
DROP TABLE ddl.studenci_2;

-- When something references it: without CASCADE there is an error, with CASCADE the dependent views
-- and the foreign keys of other tables are dropped (the data of other tables stays):
DROP TABLE ddl.studenci_2 CASCADE;
