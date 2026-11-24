`EXPLAIN ANALYZE` runs the query and shows its plan. Every step of the plan has two brackets: the planner's **estimate** and the **actual** values from the run, e.g.:

```
Seq Scan on fakultety  (cost=0.00..1.12 rows=1 width=72) (actual time=0.010..0.012 rows=4 loops=1)
```

- **rows**: the number of rows this step returns. In the first bracket it is the estimate, in the second the actual number (on average per one execution of the step). A big difference between them means the planner misjudged the data.
- **width**: the estimated average size of one returned row in bytes.
- **loops**: how many times this step was executed. Usually 1, but e.g. in a join a step can run once for every row of the other table. Then the total number of rows is `rows × loops`.
