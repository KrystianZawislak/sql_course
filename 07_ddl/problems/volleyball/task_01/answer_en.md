**Why is it not possible to insert the data?**

The tables have a circular dependency of foreign keys: a team's captain has to be in `athlete`, and an athlete has to have a team in `national_team`. The keys are checked right after every `INSERT`, so neither table can be filled first (e.g. Poland cannot be added without Kurek, and Kurek cannot be added without Poland).

**How should data be inserted in the given schema?**

Insert the data into both tables in one transaction (`BEGIN` … `COMMIT`) and check the keys only at `COMMIT`, when all the rows already exist.
