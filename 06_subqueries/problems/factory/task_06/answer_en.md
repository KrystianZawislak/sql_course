The `assemblage` table describes what is mounted onto what. The **Seat** and the **Handlebar** are mounted onto the **Frame**, and only the frame goes into the bike. That is why they are descendants of the frame and are connected with the product (**MTB bike**) indirectly, through the frame.

However, the model does not reflect this entirely well:

- **Frame** has the type `part`, so it should be an indivisible part, yet it has descendants. Since something is mounted onto it, its type should be `component`. Task 1 shows this inconsistency as well.
- In a real bike the **Handlebar** is attached (through the stem) to the fork, not to the frame, because it turns together with the fork.
- **Suspension fork** has the type `component`, but it has no descendants. The Handlebar would fit right under it.
