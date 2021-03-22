#!/usr/bin/python3
##
# File name : source02.py
# Abstract : Source file of the second challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 04/01/2021
# Last modification : 06/01/2021
##

import sys
import os.path


def is_readable(file):
    return os.access(file, os.R_OK)


def is_file(file):
    if not os.path.isfile(file):
        return False
    return True


def recuperate_number():
    file = open(sys.argv[1], "r")
    number_of_line = 0
    first_number_char = ""
    second_number_char = ""
    for line in file.readlines():
        number_of_line += 1
        line = line.strip()
        if number_of_line == 1:
            first_number_char = line
        else:
            second_number_char = line
    if number_of_line != 2:
        return False, "", ""
    return True, first_number_char, second_number_char


def check_format_number(numbers):
    authorized = "0123456789ABCDEFabcdef"
    for digit in numbers:
        found_digit = False
        for authorized_digit in authorized:
            if digit == authorized_digit:
                found_digit = True
                break
        if not found_digit:
            return False
    return True


def add_zero(key):
    while len(key) % 8 != 0:
        tmp = "0" + key
        key = tmp
    return key


def xor_operation(first_binary, second_binary):
    result = ""
    for index in range(0, len(first_binary)):
        if first_binary[index] == second_binary[index]:
            result += '0'
        else:
            result += '1'
    return result


def binary_to_hex(binary):
    nb = int(binary, 2)
    hexa = hex(nb)
    tmp = str(hexa)
    tmp = tmp.replace("0x", '')
    len_hex = len(tmp)
    if len_hex % 2 != 0:
        tmp_two = tmp
        tmp = "0" + tmp_two
    result = tmp.upper()
    return result


def challenge_main():
    return_value, first_number_char, second_number_char = recuperate_number()
    if not return_value:
        return False
    if not check_format_number(first_number_char) or not check_format_number(second_number_char):
        return False
    if len(first_number_char) % 2 != 0 or len(second_number_char) % 2 != 0:
        return False
    first_binary = "{0:08b}".format(int(first_number_char, 16))
    first_binary = add_zero(first_binary)
    second_binary = "{0:08b}".format(int(second_number_char, 16))
    second_binary = add_zero(second_binary)
    if len(first_binary) != len(second_binary):
        return False
    result = xor_operation(first_binary, second_binary)
    hex_result = binary_to_hex(result)
    print(hex_result)
    return True


if __name__ == "__main__":
    try:
        if len(sys.argv) != 2 or not is_file(sys.argv[1]) or not is_readable(sys.argv[1]):
            sys.exit(84)
        if not challenge_main():
            sys.exit(84)
    except:
        sys.exit(84)
