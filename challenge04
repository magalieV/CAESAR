#!/usr/bin/python3
##
# File name : source04.py
# Abstract : Source file of the second challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 06/01/2021
##

import string
import sys
import os.path


def is_readable(file):
    return os.access(file, os.R_OK)


def is_file(file):
    if not os.path.isfile(file):
        return False
    return True


def is_empty(file):
    return os.stat(file).st_size == 0


def get_probability(input_bytes):
    # Etaoin shrdlu
    frequencies = {
        'a': 0.0651738, 'b': 0.0124248, 'c': 0.0217339, 'd': 0.0349835,
        'e': 0.1041442, 'f': 0.0197881, 'g': 0.0158610, 'h': 0.0492888,
        'i': 0.0558094, 'j': 0.0009033, 'k': 0.0050529, 'l': 0.0331490,
        'm': 0.0202124, 'n': 0.0564513, 'o': 0.0596302, 'p': 0.0137645,
        'q': 0.0008606, 'r': 0.0497563, 's': 0.0515760, 't': 0.0729357,
        'u': 0.0225134, 'v': 0.0082903, 'w': 0.0171272, 'x': 0.0013692,
        'y': 0.0145984, 'z': 0.0007836, ' ': 0.1918182
    }
    return sum([frequencies.get(chr(byte), 0) for byte in input_bytes.lower()])

def init_data():
    data = {
        'line_content': '',
        'probability': 0,
        'key': 0
    }
    return data


def find_char_xor(input_bytes, key_value):
    output = b''
    for byte in input_bytes:
        output += bytes([byte ^ key_value])
    return output


def search_key(data, content, line_number):
    for key_value in range(256):
        line_content = find_char_xor(content, key_value)
        probability = get_probability(line_content)
        if probability > data['probability']:
            data = {
                'line_content': line_content,
                'probability': probability,
                'key': hex(key_value).split('x')[-1],
                'line_number': line_number
                }
    return data


def challenge_main():
    file = open(sys.argv[1], "r")
    data = init_data()
    line_number = 1
    for line in file.readlines():
        #TODO
        # if not all(c in string.hexdigits for c in line):
        #     return False
        _bytes = bytes.fromhex(line)
        data = search_key(data, _bytes, line_number)
        line_number += 1
    my_key = data['key']
    my_key_upper = my_key.upper()
    if my_key_upper == "0":
        my_key_upper = "00"
    if my_key_upper == "1":
        my_key_upper = "01"
    print(data['line_number'], my_key_upper)
    return True


if __name__ == "__main__":
    try:
        if len(sys.argv) != 2 or not is_file(sys.argv[1]) or not is_readable(sys.argv[1]) or is_empty(sys.argv[1]):
            sys.exit(84)
        if not challenge_main():
            sys.exit(84)
    except:
        sys.exit(84)
