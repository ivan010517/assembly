# Assembly

* ### Programming Problem I

Write an ARM assembly code to implement a reverse program which can print out the input string in reverse order to the screen. In addition, the English letters in the string have to be converted to lowercase. For example, when you execute reverse program as follows:  
```
arm-none-eabi-run reverse "It is Tom's apple."  
```
Then the screen should show the following results:  
```
reversed result: .elppa s'mot si ti  
```

* ### Programming Problem II

Write an ARM assembly code to implement a deasm program which can partially deassembly the instruction contents of your program. Your program should identify every **data processing, LDR, SDR and branch instructions** written in a given program test.s, and show its condition filed, and instruction name.  

For example, if you execute the program as follows:  
```
deasm
```
Then the screen should display the following results：  
```
PC  condition  instruction
0   AL         ADD
4   EQ         SUB
8   AL         BL
12  EQ         LDR
16  AL         UND
20  LT         CMP
…………………………………………………………………………
```
Here the instruction for PC=16 does not belong to those instructions you have to
identify so you just need to show UND as its instruction name.
The program test.s will be given by using .include gcc assembly directive. In
your assembly program, you should write something like:
```
  ..............
  BL start_dreasm
  .include 'test.s'
start_deasm:
  ..............
  ..............
```
The program test.s will be embedded, and complied along with your other part of the
program. This test file has to be put along in the same directory with you deasm
program.

* ### Programming Problem III
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
