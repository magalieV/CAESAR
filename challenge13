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

def make_request_encrypt(data):
    global sessionn_cookies
    d = base64.b64encode(data)
    e = d.decode('utf8')
    r = requests.post('http://127.0.0.1:5000/challenge13/encrypt', e, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if not r.text or not isBase64(r.text):
        sys.exit(84)
    return r.text

def make_request_decrypt(data):
    global sessionn_cookies
    d = base64.b64encode(data)
    e = d.decode('utf8')
    r = requests.post('http://127.0.0.1:5000/challenge13/decrypt', e, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if r.text and not isBase64(r.text):
        sys.exit(84)
    return r.text


def test_admin_hack(data, pos):
    insert_block = list(data)
    insert_block[pos] ^= 4
    insert_block[pos + 6] ^= 2
    insert_block[pos + 11] ^= 4
    recover = bytes(insert_block)
    return make_request_decrypt(recover)


def found_different_index(byte1, byte2):
    for index in range (0, len(byte1)):
        if byte1[index] != byte2[index]:
            return index
    return -1

def found_message_size(index, block_size):
    test_sentence = b'A' * block_size
    data = make_request_encrypt(test_sentence)
    counter = 0
    data_byte = base64.b64decode(data)
    chunks = [data_byte[i:i + block_size] for i in range(0, len(data_byte), block_size)]
    to_find = chunks[index]
    while chunks[index] == to_find:
        counter += 1
        test_sentence = b'A' * (block_size - counter)
        data = make_request_encrypt(test_sentence)
        data_byte = base64.b64decode(data)
        chunks = [data_byte[i:i + block_size] for i in range(0, len(data_byte), block_size)]
    return (block_size * (index + 1)) - (len(test_sentence) + 1)


def find_unknow_message(block_size):
    data = make_request_encrypt(b'')
    data_byte = base64.b64decode(data)
    chunks = [data_byte[i:i + block_size] for i in range(0, len(data_byte), block_size)]
    test_sentence = b'A'
    tmp = make_request_encrypt(test_sentence)
    tmp_byte = base64.b64decode(tmp)
    chunks_tmp = [tmp_byte[i:i + block_size] for i in range(0, len(tmp_byte), block_size)]
    index = found_different_index(chunks, chunks_tmp)
    if index == -1:
        return -1
    return found_message_size(index, block_size)

def main():
    counter = 0
    response_token = ""
    len_prefix = find_unknow_message(16)
    coeff_prefix = 1
    while len_prefix > (16 * coeff_prefix):
        coeff_prefix += 1
    to_add_before_len = (coeff_prefix * 16) - len_prefix
    to_add_before_byte = b'A' * to_add_before_len
    admin_sentence = to_add_before_byte + (b'A' * 16) + b'?admin?true?'
    data_base_64 = make_request_encrypt(admin_sentence)
    data = base64.b64decode(data_base_64)
    pos = (coeff_prefix * 16)
    response_token = test_admin_hack(data, pos)
    if not response_token:
        print("Failed to decrypt")
    else:
        print(response_token)

if __name__ == "__main__":
    try:
        if len(sys.argv) != 1:
            sys.exit(84)
        main()
    except:
        sys.exit(84)