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
    r = requests.post('http://127.0.0.1:5000/challenge12', e, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if not r.text or not isBase64(r.text):
        sys.exit(84)
    return r.text

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


def find_last_byte(block_size, input_block, know_byte, to_add):
    byte_found = b''
    tmp = input_block
    data = make_request(input_block)
    value = base64.b64decode(data)
    bl = block_size + to_add
    save = value[:bl]
    b = b''
    for index in range(0, 256):
        tmp = input_block + know_byte + bytes([index])
        data = make_request(tmp)
        value = base64.b64decode(data)
        if save == value[:bl]:
            b = index
            break
    return b


# STEP 2 : Write a function that unpad any padded block
def unpad_that(data):
    lenght = data[-data[-1]:]
    if not all(lenght[byte] == len(lenght) for byte in range(0, len(lenght))):
        return data
    return data[:-data[-1]]

def found_different_index(byte1, byte2):
    for index in range (0, len(byte1)):
        if byte1[index] != byte2[index]:
            return index
    return -1

def found_message_size(index, block_size):
    test_sentence = b'A' * block_size
    data = make_request(test_sentence)
    counter = 0
    data_byte = base64.b64decode(data)
    chunks = [data_byte[i:i + block_size] for i in range(0, len(data_byte), block_size)]
    to_find = chunks[index]
    while chunks[index] == to_find:
        counter += 1
        test_sentence = b'A' * (block_size - counter)
        data = make_request(test_sentence)
        data_byte = base64.b64decode(data)
        chunks = [data_byte[i:i + block_size] for i in range(0, len(data_byte), block_size)]
    return (block_size * (index + 1)) - (len(test_sentence) + 1)


def find_unknow_message(block_size):
    data = make_request(b'')
    data_byte = base64.b64decode(data)
    chunks = [data_byte[i:i + block_size] for i in range(0, len(data_byte), block_size)]
    test_sentence = b'A'
    tmp = make_request(test_sentence)
    tmp_byte = base64.b64decode(tmp)
    chunks_tmp = [tmp_byte[i:i + block_size] for i in range(0, len(tmp_byte), block_size)]
    index = found_different_index(chunks, chunks_tmp)
    if index == -1:
        return -1
    return found_message_size(index, block_size)

def find_len_message():
    data = make_request(b'')
    data_byte = base64.b64decode(data)
    return len(data_byte)

def main():
    block_size, message_size = find_block_size()
    unknow = b''
    coeff_prefix = 1
    coeff_unknow = 1
    len_prefix = find_unknow_message(block_size)
    len_unknow = message_size - len_prefix

    while len_prefix > (block_size * coeff_prefix):
        coeff_prefix += 1
    while len_unknow > (block_size * coeff_unknow):
        coeff_unknow += 1
    to_add = (coeff_prefix * block_size) - len_prefix
    block_message = block_size * coeff_unknow
    for index in range(1, block_message + 1):
        input_bl = b'A' * (block_message - index)
        input_block = b'A' * to_add + input_bl
        byte_found = find_last_byte(block_message, input_block, unknow, coeff_prefix * block_size)
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