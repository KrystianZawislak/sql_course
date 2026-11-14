TRUNCATE belongs to the Data Definition Language and not to the Data Manipulation Language, because it really works on the whole table as an object, not on its rows. It removes the existing, filled data file of the table and creates in its place exactly the same schema, but empty.

By comparison, DELETE (a DML command) removes rows one by one, because it has to go through the whole table, while TRUNCATE removes everything at once.

TRUNCATE does not accept a WHERE clause, because it does not operate on individual rows, so there is nothing to check a condition against – it replaces the whole content of the table at once. If we want to remove only some records, we have to use DELETE.
