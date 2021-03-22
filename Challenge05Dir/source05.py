#!/usr/bin/python3
##
# File name : source05.py
# Abstract : Source file of the fifth challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 05/01/2021
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
        if number_of_line == 2 and line[len(line) - 1] != '\n':
            return False, "", ""
        line = line.strip()
        if number_of_line == 1:
            first_number_char = line
        else:
            second_number_char = line
    if number_of_line != 2:
        return False, "", ""
    return True, first_number_char, second_number_char


def check_format_number(numbers):
    authorized = "0123456789ABCDEF"
    for digit in numbers:
        found_digit = False
        for authorized_digit in authorized:
            if digit == authorized_digit:
                found_digit = True
                break
        if not found_digit:
            return False
    return True


def xor_operation(first_binary, key_binary):
    result = ""
    len_key = len(key_binary)
    index_key = 0
    for index in range(0, len(first_binary)):
        if first_binary[index] == key_binary[index_key]:
            result += '0'
        else:
            result += '1'
        index_key += 1
        if index_key >= len_key:
            index_key = 0
    return result


def binary_to_hex(binary):
    nb = int(binary, 2)
    hexa = hex(nb)
    tmp = str(hexa)
    result = tmp.upper()
    return result


def add_zero(key):
    while len(key) % 8 != 0:
        tmp = "0" + key
        key = tmp
    return key


def challenge_main():
    return_value, first_number_char, second_number_char = recuperate_number()
    if not return_value:
        return False
    if not check_format_number(first_number_char) or not check_format_number(second_number_char):
        return False
    first_binary = "{0:08b}".format(int(first_number_char, 16))
    first_binary = add_zero(first_binary)
    second_binary = "{0:08b}".format(int(second_number_char, 16))
    second_binary = add_zero(second_binary)
    result = xor_operation(second_binary, first_binary)
    hex_result = binary_to_hex(result)
    res = hex_result[2:]
    if len(res) % 2 != 0:
        res = "0" + res
    print(res)
    return True


if __name__ == "__main__":
    try:
        if len(sys.argv) != 2 or not is_file(sys.argv[1]) or not is_readable(sys.argv[1]):
            sys.exit(84)
        if not challenge_main():
            sys.exit(84)
    except:
        sys.exit(84)
