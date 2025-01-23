# Manual Multiplication (ARM Assembly)

This repository contains an ARM assembly program that performs multiplication of two integers without using the `*` operator.

## How It Works
- The program takes two integers as input (`x` and `y`).
- It calculates the result using repeated addition in a loop.
- Handles cases where one or both integers are negative.

## Running the Code
1. Assemble the code:
   ```bash
   aarch64-linux-gnu-as -o manualmultiplication.o manualmultiplication.s

2. Link the code:
    ```bash
    aarch64-linux-gnu-ld -o manualmultiplication  manualmultiplication.o

3. Run the program:
    ```bash
    ./manualmultiplication
