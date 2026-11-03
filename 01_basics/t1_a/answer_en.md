The difference concerns the numbers -2.5, -0.5, 0.5, 2.5, i.e. numbers that lie exactly halfway between two integers.
The numeric type rounds the way we learn at school, i.e. halves away from zero (e.g. -2.5 → -3), while double precision
rounds to the nearest even number (e.g. -2.5 → -2).
This is because double precision is computed by the processor according to the IEEE 754 standard. That standard rounds
halves to even because, over many calculations, the rounding errors then cancel out instead of accumulating in one direction.
Numeric, on the other hand, is computed by PostgreSQL itself in the decimal system, digit by digit, the way a person
would on paper, so it applies the school rule.
