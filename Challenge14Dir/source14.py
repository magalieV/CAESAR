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

def make_request_encrypt():
    global sessionn_cookies
    r = requests.post('http://127.0.0.1:5000/challenge14/encrypt', cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    if not r.text or not isBase64(r.text):
        sys.exit(84)
    return r.text

def make_request_decrypt(iv, data):
    global sessionn_cookies
    d = base64.b64encode(data)
    e = d.decode('utf8')
    to_send = iv + e
    r = requests.post('http://127.0.0.1:5000/challenge14/decrypt', to_send, cookies=sessionn_cookies)
    sessionn_cookies = r.cookies
    return r

def main():
    data = make_request_encrypt()
    data_byte = base64.b64decode(data)
    print(data_byte)
    print(len(data_byte[:16]))
    print(data_byte[:16])
    print(len(data_byte[17:]))
    print(data_byte[17:])
    #make_request_decrypt(test[0], test[1])

if __name__ == "__main__":
    #try:
    if len(sys.argv) != 1:
        sys.exit(84)
    main()
    #except:
     #   sys.exit(84)