#!/usr/bin/env python3
"""
Generate k lines of random instruction for testing

To use:

python genRandomInstr.py

or

python genRandomInstr.py -o testCode.bin -k 100

"""

import random
import argparse


def genRandom(f='randomInstr.bin', k = '30'):
    with open(f, 'w') as f:
        for i in range(k):
            # Generate a string of 32 random binary digits
            bin_str = ''.join(random.choice('01') for _ in range(32))
            # Print the string of binary digits
            f.write(bin_str+'\n')
    return

def parse_arguments():
    # Create an argument parser object
    parser = argparse.ArgumentParser(description='Convert binary numbers to hexadecimal')

    # Define the input and output file paths as required arguments
    parser.add_argument('-o', type=str, help='Path to the output file', default='randomInstr.bin')
    parser.add_argument('-k', type=int, help='Path to the output file', default=30)
    
    # Define an optional argument for verbosity
    parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose mode')

    # Parse the command-line arguments
    args = parser.parse_args()

    return args

# Example usage
if __name__ == '__main__':
    args = parse_arguments()
    genRandom(f=args.o, k=args.k)