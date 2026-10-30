-- SQL Basics · Exercise 8 — T3/A: strong vs weak, static vs dynamic typing
-- Run each query separately (select the line and press F5) – most of them fail on purpose.

-- Strong typing: PostgreSQL does not convert types silently
SELECT 1 + text '1';            -- error: operator does not exist: integer + text
SELECT length(123);             -- error: function length(integer) does not exist
SELECT 'abc'::integer;          -- error: invalid input syntax for type integer
SELECT '2026-02-30'::date;      -- error: date/time field value out of range
SELECT 32768::smallint;         -- error: smallint out of range
SELECT 1 + CAST(text '1' AS integer);  -- works: 2 (explicit cast)

-- Static typing: the column type is fixed up front and does not change
CREATE TEMPORARY TABLE t (x integer);
INSERT INTO t VALUES ('abc');   -- error: column x only ever accepts integer
SELECT x + text '1' FROM t;     -- error, even though the table is empty – types are checked before execution
SELECT pg_typeof(x + 1.5) FROM (VALUES (1)) AS v(x);  -- numeric – the type of the expression is known up front

-- Exception: safe type widening without losing information
SELECT 1 + 1.5;                 -- works: 2.5 (integer -> numeric)
