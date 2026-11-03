The value -0 appears only for the double precision type, when a negative number is rounded or truncated to zero,
e.g. round(-0.5) → -0 and trunc(-0.5) → -0.
This comes from the IEEE 754 standard, which the processor uses to store floating-point numbers. The sign of a number
is stored there in a separate bit, independently of its value, so there are two zeros: +0 and -0. Rounding or
truncating changes only the value, while the sign bit stays as it was for the negative number, so the result is -0.
This way the information that the zero came from a negative number is not lost.
The numeric type has no separate negative zero, so there the result is a plain 0 (e.g. trunc(-0.5) → 0).
Despite looking different, -0 is equal to 0: the comparison -0 = 0 returns true.
