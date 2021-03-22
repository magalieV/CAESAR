#!/usr/bin/python3

import base64
import requests
import sys

sessionn_cookies = ""

def isBase64(data):
    try:
        _bytes = bytes(data, 'ascii')
        return base64.b64encode(base64.b64decode(_bytes)) == _bytes
    except Exception:
        return False

def make_request(data):
    global sessionn_cookies
    d = base64.b64encode(data)
    e = d.decode('utf8')
    r = requests.post('http://127.0.0.1:5000/challenge10', e, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if not r.text or not isBase64(r.text):
        sys.exit(84)
    return r.text


def count_repet_block(data, line_nb, block_size):
    blocks = []
    for index in range(0, len(data), block_size):
        blocks.append(data[index:index + block_size])
    number_of_repetitions = len(blocks) - len(set(blocks))
    return {'data' : data, 'rep' : number_of_repetitions, 'line_nb' : line_nb}


def is_using_ecb(block_size):
    _byte = []
    repetitions = []
    data = make_request(b'A' * (block_size * 1) + b'B' * (block_size * 3) + b'A' * (block_size * 1))
    _byte.append(base64.b64decode(data))
    data = make_request(b'B' * (block_size * 1) + b'C' * (block_size * 3) + b'E' * (block_size * 1))
    _byte.append(base64.b64decode(data))
    data = make_request(b'A' * (block_size * 1) + b'B' * (block_size * 3) + b'A' * (block_size * 1))
    _byte.append(base64.b64decode(data))
    nb_line = 1
    for d in _byte:
        repetitions.append(count_repet_block(d, 1, block_size))
        nb_line += 1
    most_rep = sorted(repetitions, key=lambda x: x['rep'], reverse=True)[0]
    if most_rep['rep'] > 1:
        return True
    return False


def find_block_size():
    block_size = 1
    data = make_request(b'A')
    test_sentence = b'A'
    last_len = len(base64.b64decode(data))
    while True:
        test_sentence += b'A'
        data = make_request(test_sentence)
        len_r = len(base64.b64decode(data))
        if len_r != last_len:
            block_size = len_r - last_len
            break
        last_len = len_r
    message_size = last_len - len(test_sentence)
    return block_size, message_size


def find_last_byte(block_size, input_block, know_byte):
    byte_found = b''
    tmp = input_block
    data = make_request(input_block)
    value = base64.b64decode(data)
    save = value[:block_size]
    b = b''
    for index in range(0, 256):
        tmp = input_block + know_byte + bytes([index])
        data = make_request(tmp)
        value = base64.b64decode(data)
        if save == value[:block_size]:
            b = index
            break
    return b


# STEP 2 : Write a function that unpad any padded block
def unpad_that(data):
    lenght = data[-data[-1]:]
    if not all(lenght[byte] == len(lenght) for byte in range(0, len(lenght))):
        return data
    return data[:-data[-1]]

def main():
    block_size, message_size = find_block_size()
    if not is_using_ecb(block_size):
        return False
    unknow = b''
    coeff = 1
    while message_size > (block_size * coeff):
        coeff += 1
    block_message = block_size * coeff
    for index in range(1, block_message + 1):
        input_block = b'A' * (block_message - index)
        byte_found = find_last_byte(block_message, input_block, unknow)
        if not byte_found:
            break
        unknow += bytes([byte_found])
    b = base64.b64encode(unpad_that(unknow))
    print(b.decode('utf8'))

if __name__ == "__main__":
    try:
        if len(sys.argv) != 1:
            sys.exit(84)
        main()
    except:
        sys.exit(84)