For floating-point numbers, 0.1 + 0.2 = 0.3 returns false, because in the double precision type these numbers are only
approximations and their actual value is slightly different. The computer stores numbers using 0s and 1s, and the
number 0.1 cannot be expressed exactly in binary. There are exactly 53 bits for the digits, so when the computer tries
to build 0.1 out of 1/2, 1/4, 1/8 and so on, it eventually reaches the limit and stores the number 0.10000000000000000555…
The approximation errors of 0.1 and 0.2 add up and are not equal to the approximation error of 0.3, which is why the
results differ.
