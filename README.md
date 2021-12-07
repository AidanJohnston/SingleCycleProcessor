# SingleCycleProcessor
Final project for EELE-0651.  Simple single Cccle processor in verlog.

The purpose of this project was to design and implement an 8-bit single cycle processor
modelled with Verilog using Intel Quartus Prime Lite software and simulated using ModelSim software and finally implemented on an Alter DE10-Lite board. Unfortunately, due to COVID-19 and the current world climate, we were unable to have access to the lab and physically implement our processor on the FPGA.

# Overview
The single cycle processor uses a RISC-like instruction set where each instruction in the
processor is 2-bytes. Four 1-byte general purpose registers are implemented: R<sub>0</sub>,  R<sub>1</sub>, R<sub>2</sub>, and R<sub>3</sub>.  In addition, a link register is also implemented to support subroutines. Three different instruction formats are used: A-Format, B-Format, and L-Format which are described further in the next section.
# Instruction Set
The instruction set provided was used when designing our single cycle processor, based
on the format given we were able to then code the instruction set in verilog. Sixteen instructions are supported and implemented in three formats described below.
## A-Format
A-format is used for arithmetic and logical instructions. Instructions are two bytes,
however the second byte is unused. The first byte holds the opcode to define the operation to be performed and holds the source and destination operand. There are 9 A-format instructions.


Mnemonic  | Op-Code  | Function
:-------:|:-------:|:-------:
NOP | 0 | Nothing
ADD | 1 | R[ra] ← R[ra] + R[rb]; <br> $((R[ra] + R[rb]) = 0) ⇒ Z ← 1; else ⇒ Z  ← 0;$ <br> $((R[ra] + R[rb]) < 0) ⇒ N ← 1; else ⇒ N ← 0;$
SUB | 2 | $R[ra] ← R[ra] − R[rb];$ <br> $((R[ra] − R[rb]) = 0) ⇒ Z ← 1; else ⇒ Z ← 0;$ <br> $((R[ra] − R[rb]) < 0) ⇒ N ← 1; else ⇒ N ← 0;$ 
NAND | 3| 

*Table 1: A-Format Instructions*

## B-Format
## L-Format
# Implementation
To build our processor, we used the provided instruction set to guide our design and select the
main components needed for our design. Before coding our modules for each component, we
needed to determine the data paths for each instruction format which are shown below.
## A-Format Data Path
<img src='img/image30.png'></img>
*Figure 4: ADD, SUB, NAND Data Path*


<img src='img/image40.png'></img>
*Figure 5: SHL and SHR Data Path*

<img src='img/image43.png'></img>
*Figure 5: OUT Data Path*

<img src='img/image35.png'></img>
*Figure 5: IN Data Path*

## B-Format Data Path
## L-Format Data Path
# Components
## Single Cycle Processor
## Instruction Memory
## Control
The control module is responsible for setting certain flags on or off.  These flags are used by various other modules.  Depending on the OPcode given to the module, different flags will be raised. A truth table for the different OPcodes and which flags get raised can be seen in table 4.

| | **instruction[7:4]** | **branchControl** | **memtoReg** | **RegWrite** | **useEa** | **ALUOP** | **memRead** | **linkSrc** | **memWrite** | 
| ---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | 
| **NOP** | 0000 | 00 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 
| **ADD** | 0001 | 00 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **SUB** | 0010 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **NAND** | 0011 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **SHL** | 0100 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **SHR** | 0101 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **OUT** | 0110 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 
| **IN** | 0111 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **MOV** | 1000 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 
| **BR** | 1001 | 00 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 
| **BR.C** | 1010 | 01 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 
| **BR.SUB** | 1011 | 10 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 
| **RETURN** | 1100 | 11 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 
| **LOAD** | 1101 | 0 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 
| **STORE** | 1110 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 
| **LOADIMM** | 1111 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
## Registers
## Link Registers
## ALU
## Data Memory
# Results
# Future works