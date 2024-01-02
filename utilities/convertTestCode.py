#!/usr/bin/env python3
"""
Convert 32-bit binary numbers (separated by \n) 
into little-endian, byte-addressable memory hex

To use:

python convertTestCode.py

or

python convertTestCode.py -i testCode.bin -o program.hex -ou testCode.hex 

"""

import argparse

def bin_to_hex(bin_num: str) -> str:
    # Convert the binary number to decimal
    dec_num = int(bin_num, 2)
    # Convert the decimal number to hexadecimal
    hex_num = f"{dec_num:08x}"
    return hex_num

def convert(fin = 'testCode.bin', fout = 'program.hex', fouser = 'testCode.hex'):
    with open(fin, 'r') as f:
        lines = f.readlines()
    with open(fout, 'w') as f:
        print("Hex numbers are:")
        f1 = open(fouser,'w')
        for line in lines:
            s = bin_to_hex(line)
            f1.write(s + '\n')
            print(s)
            pairs = [s[i:i+2] for i in range(0, len(s), 2)]
            pairs_new = pairs.copy()
            for i in range(4):
                pairs_new[i] = pairs[3-i]
            for i in range(0, len(pairs_new)):
                f.write(pairs_new[i] + '\n')
    return


def parse_arguments():
    # Create an argument parser object
    parser = argparse.ArgumentParser(description='Convert binary numbers to hexadecimal')

    # Define the input and output file paths as required arguments
    parser.add_argument('-i', type=str, help='Path to the input file', default='testCode.bin')
    parser.add_argument('-o', type=str, help='Path to the output file', default='program.hex')
    parser.add_argument('-ou', type=str, help='Path to the output file', default='testCode.hex')
    
    # Define an optional argument for verbosity
    parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose mode')

    # Parse the command-line arguments
    args = parser.parse_args()

    return args

# Example usage
if __name__ == '__main__':
    args = parse_arguments()
    convert(fin = args.i, fout = args.o)

