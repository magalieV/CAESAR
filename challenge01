#!/usr/bin/python3
##
# File name : source01.py
# Abstract : Source file of the first challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 04/01/2021
# Last modification : 04/01/2021

import codecs
import string
import sys
import os.path


def is_file(file):
    if not os.path.isfile(file):
        return False
    return True


def is_readable(file):
    return os.access(file, os.R_OK)


def is_empty(file):
    return os.stat(file).st_size == 0


def challenge_main():
    file = open(sys.argv[1], "r")
    content = ''
    for line in file.readlines():
        content += line
    content = content.replace('\n', '')
    if not all(c in string.hexdigits for c in content):
        return False
    toBase64 = codecs.encode(codecs.decode(content, 'hex'), 'base64').decode().replace('\n', '')
    print(toBase64)
    return True


if __name__ == "__main__":
    try:
        if len(sys.argv) != 2 or not is_file(sys.argv[1]) or not is_readable(sys.argv[1]) or is_empty(sys.argv[1]):
            sys.exit(84)
        if not challenge_main():
            sys.exit(84)
    except:
        sys.exit(84)
