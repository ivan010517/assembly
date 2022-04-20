# Programming Problem III
Write an ARM assembly code **int2float** to print out
the binary IEEE-754 single-precision representation of the given input decimal
integer number. For example, when you execute the **int2float** program as
follows:
```
arm-none-eabi-run int2float 1995
```
Then the screen should show the following results:
```
1995 is coded by 01000100111110010110000000000000.
```
If you execute program as follows:
```
arm-none-eabi-run int2float N1995
```
Then the screen should show the following results:
```
-1995 is coded by 11000100111110010110000000000000.
```
When the string argument following **int2float** starts with the capital **N**, it represents
this remaining string corresponds to a negative integer number.
You don’t need to consider those special floating point representations including **Zero,
Infinity, NaN, and Denormalized** numbers.
