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

def make_request_profile(data):
    global sessionn_cookies
    d = base64.b64encode(data)
    e = d.decode('utf8')
    r = requests.post('http://127.0.0.1:5000/challenge11/new_profile', e, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if not r.text or not isBase64(r.text):
        sys.exit(84)
    return r.text

def make_request_profile_validate(data):
    global sessionn_cookies
    d = base64.b64encode(data)
    e = d.decode('utf8')
    r = requests.post('http://127.0.0.1:5000/challenge11/validate', e, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if r.text and not isBase64(r.text):
        sys.exit(84)
    return r.text

# STEP 1 : Write a function that pad any block to a specific block lenght
def padding_that(data, size):
    if len(data) == size:
        return data
    lenght = size - (len(data) % size)
    if lenght == 0:
        lenght = size
    return data + (bytes([lenght]) * lenght)

def main():
    message_craft = make_request_profile(b'hackingcryptchallengete@e.com')
    pad_message = padding_that(b'admin', 16)
    start_message = b'hackingcry'
    admin_craft = make_request_profile(start_message + pad_message)
    admin_byte_craft = base64.b64decode(admin_craft)
    message_byte_craft = base64.b64decode(message_craft)
    first_part = message_byte_craft[:48]
    second_part = admin_byte_craft[:32][16:]
    final_message = first_part + second_part
    token = make_request_profile_validate(final_message)
    if not token:
        print("Failed to login as admin")
    else:
        print(token)

if __name__ == "__main__":
    try:
        if len(sys.argv) != 1:
            sys.exit(84)
        main()
    except:
        sys.exit(84)