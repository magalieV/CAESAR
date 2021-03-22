#!/usr/bin/python3
##
# File name : source07.py
# Abstract : Source file of the senventh challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 15/01/2021
# Last modification : 15/01/2021
##

import sys
import os.path
import base64
from Crypto.Cipher import AES
import codecs

def is_readable(file):
    return os.access(file, os.R_OK)


def is_file(file):
    if not os.path.isfile(file):
        return False
    return True

def isBase64(data):
    try:
        _bytes = bytes(data, 'ascii')
        return base64.b64encode(base64.b64decode(_bytes)) == _bytes
    except Exception:
        return False

def recuperate_number():
    file = open(sys.argv[1], "r")
    number_of_line = 0
    key = ""
    data = ""
    for line in file.readlines():
        number_of_line += 1
        line = line.strip()
        if number_of_line == 1:
            key = line
        else:
            if not isBase64(line):
                return False, "", ""
            data = base64.b64decode(line)
    if not data or not key:
        return False, "", ""
    return True, data, key


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


############################# Challenge Steps #############################

# STEP 1 : Write a function that pad any block to a specific block lenght
def padding_that(data, size):
    if len(data) == size:
        return data
    lenght = size - (len(data) % size)
    if lenght == 0:
        lenght = size
    return data + (bytes([lenght]) * lenght)

# STEP 2 : Write a function that unpad any padded block
def unpad_that(data):
    lenght = data[-data[-1]:]
    if not all(lenght[byte] == len(lenght) for byte in range(0, len(lenght))):
        return data
    return data[:-data[-1]]

# STEP 3 : Decrypt using ecb mode
def decrypt_ecb(key, data):
    byte_key = bytes.fromhex(key)
    if len(byte_key) != 16:
        byte_key = padding_that(byte_key, 16)
    tmp = AES.new(byte_key, AES.MODE_ECB)
    return tmp.decrypt(data)

# STEP 4 : display unpading mess
def print_mess(data):
    data_without_pad = unpad_that(data)
    toBase64 = codecs.encode(codecs.decode(data_without_pad.hex(), 'hex'), 'base64').decode().replace('\n', '')
    print(toBase64)


def challenge_main():
    return_value, data, key = recuperate_number()
    if not return_value or not check_format_number(key):
        return False
    print_mess(decrypt_ecb(key, data))
    return True


if __name__ == "__main__":
    try:
        if len(sys.argv) != 2 or not is_file(sys.argv[1]) or not is_readable(sys.argv[1]):
            sys.exit(84)
        if not challenge_main():
            sys.exit(84)
    except:
        sys.exit(84)
