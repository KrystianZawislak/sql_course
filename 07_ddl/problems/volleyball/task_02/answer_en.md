**Why did deferring the moment of checking the constraints not solve the problem?**

The `ALTER TABLE` statements of both tables were missing `DEFERRABLE`, so the foreign keys have the default mode `NOT DEFERRABLE` and are always checked right away. `SET CONSTRAINTS ALL DEFERRED` defers only `DEFERRABLE` constraints, which is why it changed nothing.

**What changes have to be made to the table constraints so that the constraints can be deferred?**

`DEFERRABLE` has to be added to the `ALTER TABLE` statements of both tables, i.e. both foreign keys have to be created again with `DEFERRABLE INITIALLY DEFERRED` (checked at `COMMIT`), or with `DEFERRABLE INITIALLY IMMEDIATE` and then `SET CONSTRAINTS ALL DEFERRED` in the transaction.
