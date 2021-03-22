#!/usr/bin/python3

import sys
import os.path


def tab_to_str(line):
    tmp1 = ""
    for tmp in line:
        tmp1 = tmp1 + tmp
    return tmp1


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


def recuperate_number():
    file = open(sys.argv[1], "r")
    number_of_line = 0
    first_number_char = ""
    for line in file.readlines():
        number_of_line += 1
        line = line.strip()
        if number_of_line == 1:
            first_number_char = line
    if number_of_line != 1 or not first_number_char or first_number_char == "\0":
        return False, ""
    return True, first_number_char


def is_readable(file):
    return os.access(file, os.R_OK)


def is_file(file):
    if not os.path.isfile(file):
        return False
    return True


def get_score(input_bytes):
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
        'message': '',
        'score': 0,
        'key': 0
    }
    return data


def search_single_char_xor(input_bytes, key_value):
    output = b''
    for byte in input_bytes:
        output += bytes([byte ^ key_value])
    return output


def search_key(data, content):
    for key_value in range(256):
        message = search_single_char_xor(content, key_value)
        score = get_score(message)
        if score > data['score']:
            data = {
                'message': message,
                'score': score,
                'key': hex(key_value).split('x')[-1]
                }
    my_key = data['key']
    my_key_upper = my_key.upper()
    return my_key_upper

################################ STEP #################################

#STEP 3 : break cipher in blocks of key size
def divide_bytes(cipher):
    byte = []
    binary = "{0:08b}".format(int(cipher, 16))
    binary = add_zero(binary)
    tmp = ''
    for index in range(0, len(binary)):
        if index % 8 == 0 and index != 0:
            byte.append(tmp)
            tmp = ''
        tmp += binary[index]
    if tmp:
        byte.append(tmp)
    return byte


#STEP 1 : Get hamming distance
def get_hamming_distance(first_chunk, second_chunk):
    hamming_distance = 0
    for bits1, bits2 in zip(first_chunk, second_chunk):
        tmp = bits1 ^bits2
        for bits in bin(tmp):
            if bits == '1':
                hamming_distance += 1
    return hamming_distance

#STEP 2 : Guess keySize
def guess_key_size(cipher):
    hamming_distances = []
    if len(cipher) % 2 != 0:
        cipher = "0" + cipher
    _bytes = bytes.fromhex(cipher)
    for key_size in range(1, 41):
        chunks = [_bytes[i:i+key_size] for i in range(0, len(_bytes), key_size)]
        hamming_distances_key = []
        for chunk in chunks:
            if len(chunk) != len(chunks[0]):
                break
            hamming_distances_key.append(get_hamming_distance(chunks[0], chunk))
        normalized = sum(hamming_distances_key) / len(hamming_distances_key) / key_size
        hamming_distances.append({'key_size' : key_size, 'normalized_hamming' : normalized})
    key_len = sorted(hamming_distances, key=lambda x: x['normalized_hamming'])
    return key_len[0]['key_size']


def merge_case(line):
    merge = ''
    for obj in line:
        merge = merge + obj
    return merge


def break_cipher(cipher, key_size):
    counter = 0
    blocks = dict.fromkeys(range(key_size))
    byte = divide_bytes(cipher)
    for bits in byte:
        if counter == key_size:
            counter = 0
        if blocks[counter] is None:
            blocks[counter] = []
        blocks[counter].append(bits)
        counter += 1
    byte_block = []
    for index in blocks:
        byte_block.append(merge_case(blocks[index]))
    return byte_block

def remove_redondant(key_found):
    tmp = ""
    index = 0
    test_is_same = False
    index_tmp = 1
    len_max = 0
    temp2 = ""
    temp3 = ""
    for obj in key_found:
        if tmp != "" and tmp[0] == obj and not test_is_same:
            test_is_same = True
            len_max = len(tmp)
            temp2 = tmp
            temp3 += obj
        elif test_is_same:
            if len_max > 1 and temp2[index_tmp] == obj:
                temp3 += obj
                if index_tmp == len_max - 1:
                    return temp2
                index_tmp += 1
            else:
                test_is_same = False
                len_max = 0
                index_tmp = 1
                if tmp != "" and tmp[0] == obj and not test_is_same:
                    test_is_same = True
                    len_max = len(tmp)
                    temp2 = tmp
                    temp3 += obj
        tmp += obj
        index += 1
    return key_found

def challenge_main():
    return_value, data = recuperate_number()
    if not return_value:
        return False
    if not check_format_number(data):
        return False
    key_len = guess_key_size(data)
    blocks = break_cipher(data, key_len)
    tab_result = []
    for line in blocks:
        nb = int(line, 2)
        hexa = hex(nb)
        re = str(hexa)
        res = re[2:]
        if len(res) % 2 != 0:
            res = "0" + res
        _bytes = bytes.fromhex(res)
        tab_result.append(search_key(init_data(), _bytes))
    key = tab_to_str(tab_result)
    key_upper = key.upper()
    res = remove_redondant(key_upper)
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
