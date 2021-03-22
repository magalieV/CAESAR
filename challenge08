#!/usr/bin/python3
##
# File name : source08.py
# Abstract : Source file of the eight challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 14/01/2021
# Last modification : 14/01/2021
##

import sys
import os.path
import base64

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
    data = []
    for line in file.readlines():
        line = line.strip()
        if not isBase64(line):
            return False, []
        tmp = base64.b64decode(line)
        data.append(tmp)
    if not data:
        return False, []
    return True, data


def count_repet_block(data, line_nb):
    blocks = []
    for index in range(0, len(data), 16):
        blocks.append(data[index:index + 16])
    number_of_repetitions = len(blocks) - len(set(blocks))
    return {'data' : data, 'rep' : number_of_repetitions, 'line_nb' : line_nb}


def challenge_main():
    return_value, data = recuperate_number()
    if not return_value:
        return False
    line_nb = 1
    repetitions = []
    for line in data:
        repetitions.append(count_repet_block(line, line_nb))
        line_nb += 1
    most_rep = sorted(repetitions, key=lambda x: x['rep'], reverse=True)[0]
    print(most_rep['line_nb'])
    return True


if __name__ == "__main__":
    try:
        if len(sys.argv) != 2 or not is_file(sys.argv[1]) or not is_readable(sys.argv[1]):
            sys.exit(84)
        if not challenge_main():
            sys.exit(84)
    except:
        sys.exit(84)
