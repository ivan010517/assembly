# Programming Problem II

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
