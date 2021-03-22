import http.server
import socketserver
import re
from Crypto.Cipher import AES
import base64

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
        return "Not pad"
    return data[:-data[-1]]

def encrypt(pl):
    
    #TODO: encryption  AES-128-ECB
    unknow = "Richard Hellmand"
    unkno = "Richard"
    unknoww = "Richard Hellman est un homme d'affaire tres important dans man"
    plaintext = base64.b64decode(pl)
    cipher = plaintext + unknow.encode()
    key = "6w9z$C&F)J@NcRfU"
    byte_key = key.encode()
    len_cipher = len(cipher)
    if len_cipher % 16 != 0:
        adde = 0
        while (len_cipher + adde) % 16 != 0:
            adde += 1
        pad = adde + len_cipher
        cipher = padding_that(cipher, pad)
    else:
        pad = len_cipher + 16
        cipher = padding_that(cipher, pad)
    tmp = AES.new(byte_key, AES.MODE_ECB)
    cipher_result = tmp.encrypt(cipher)
    return base64.b64encode(cipher_result)


def encrypt_11(pl):
    # TODO: encryption  AES-128-ECB
    unknow = "&uid=10&role=user"
    mail_part = "email="
    plaintext = base64.b64decode(pl)
    cipher = mail_part.encode() + plaintext + unknow.encode()
    key = "6w9z$C&F)J@NcRfU"
    byte_key = key.encode()
    len_cipher = len(cipher)
    if len_cipher % 16 != 0:
        adde = 0
        while (len_cipher + adde) % 16 != 0:
            adde += 1
        pad = adde + len_cipher
        cipher = padding_that(cipher, pad)
    else:
        pad = len_cipher + 16
        cipher = padding_that(cipher, pad)
    print("ENCRYPTE")
    print(cipher)
    print(len(cipher))
    tmp = AES.new(byte_key, AES.MODE_ECB)
    cipher_result = tmp.encrypt(cipher)
    print(cipher_result)
    return base64.b64encode(cipher_result)

#b'email=hackingcry | pt@e.admin\x06\x06\x06\x06\x06\x06 | &uid=10&role=user\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f'


def encrypt_12(pl):
    # TODO: encryption  AES-128-ECB
    unknow = "Richard Hellmand"
    unkno = "Richard"
    unknoww = "Richard Hellman est un homme d'affaire tres important dans man"
    prefix = "Un prefix assez long hahamp"
    plaintext = base64.b64decode(pl)
    cipher = prefix.encode() + plaintext + unknow.encode()
    key = "6w9z$C&F)J@NcRfU"
    byte_key = key.encode()
    len_cipher = len(cipher)
    if len_cipher % 16 != 0:
        adde = 0
        while (len_cipher + adde) % 16 != 0:
            adde += 1
        pad = adde + len_cipher
        cipher = padding_that(cipher, pad)
    else:
        pad = len_cipher + 16
        cipher = padding_that(cipher, pad)
    tmp = AES.new(byte_key, AES.MODE_ECB)
    cipher_result = tmp.encrypt(cipher)
    return base64.b64encode(cipher_result)


#b'email=hackingcry | pt@e.admin\x06\x06\x06\x06\x06\x06 | &uid=10&role=user\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f'

def decrypt_11(pl):
    key = "6w9z$C&F)J@NcRfU"
    byte_key = key.encode()
    print("DECRYPT")
    token = b'C est un token YOUHOU'
    tmp = AES.new(byte_key, AES.MODE_ECB)
    plaintext = tmp.decrypt(base64.b64decode(pl))
    print (plaintext)
    if b'&role=admin' in plaintext:
        print("Logged in as admin")
        return token
    else:
        print("You need to be admin to get the access!")
        return ""

iv="0000000000000000"
key_13 = "6w9z$C&F)J@NcRfU"

def encrypt_13(pl):
    test = base64.b64decode(pl)
    plainText = test.decode()
    byte_key = key_13.encode()
    obj = AES.new(byte_key, AES.MODE_CBC, iv.encode())
    for i in range(len(plainText)):
        if plainText[i] == ";" or plainText[i] == "=":
            payload = plainText.replace(plainText[i], "")
    str1 = "medium prefix lo" + plainText + ";type=jibberjabber;"
    cipher = str1.encode()
    len_cipher = len(cipher)
    if len_cipher % 16 != 0:
        adde = 0
        while (len_cipher + adde) % 16 != 0:
            adde += 1
        pad = adde + len_cipher
        cipher = padding_that(cipher, pad)
    else:
        pad = len_cipher + 16
        cipher = padding_that(cipher, pad)
    cipher_result = obj.encrypt(cipher)

    return base64.b64encode(cipher_result)

def decrypt_13(pl):
    byte_key = key_13.encode()
    token = b'C est un token YOUHOU'
    obj1 = AES.new(byte_key, AES.MODE_CBC, iv)
    plaintext = obj1.decrypt(base64.b64decode(pl))
    print (plaintext)
    if b';admin=true;' in plaintext:
        print("Logged in as admin")
        return token
    else:
        print("You need to be admin to get the access!")
        return ""

iv_14 = "1234567812345678"

def encrypt_14():
    my_text = "This is a long test"
    plaintext = base64.b64decode(my_text)
    cipher = plaintext
    key = "6w9z$C&F)J@NcRfU"
    byte_key = key.encode()
    len_cipher = len(cipher)
    obj = AES.new(byte_key, AES.MODE_CBC, iv_14.encode())
    if len_cipher % 16 != 0:
        adde = 0
        while (len_cipher + adde) % 16 != 0:
            adde += 1
        pad = adde + len_cipher
        cipher = padding_that(cipher, pad)
    else:
        pad = len_cipher + 16
        cipher = padding_that(cipher, pad)
    cipher_result = obj.encrypt(cipher)
    return base64.b64encode(iv_14.encode() + b'\n' + cipher_result)

def decrypt_14(pl):
    byte_key = key_13.encode()
    test = pl.split(base64.b64encode(b'\n'))
    obj1 = AES.new(byte_key, AES.MODE_CBC, iv_14)
    print(test[0])
    print(test[1])
    plaintext = obj1.decrypt(base64.b64decode(test[1]))
    p = unpad_that(plaintext)
    if p == "Not pad":
        return 500
    return 200

class ServerHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        if self.path.endswith("/challenge10"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_response(200)
            self.send_header('Content-type','text/html')
            self.end_headers()
            self.wfile.write(encrypt(plaintext_base64))
        elif self.path.endswith("/challenge13/encrypt"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(encrypt_13(plaintext_base64))
        elif self.path.endswith("/challenge13/decrypt"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            test = decrypt_13(plaintext_base64)
            if test:
                self.wfile.write(base64.b64encode(test))
        elif self.path.endswith("/challenge14/encrypt"):
            content_len = int(self.headers.get('content-length', 0))

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(encrypt_14())
        elif self.path.endswith("/challenge14/decrypt"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.send_response(decrypt_14(plaintext_base64))
        elif self.path.endswith("/challenge11/new_profile"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(encrypt_11(plaintext_base64))
        elif self.path.endswith("/challenge11/validate"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            test = decrypt_11(plaintext_base64)
            if test:
                self.wfile.write(base64.b64encode(test))
            print("END DECRYPT")
        elif self.path.endswith("/challenge12"):
            content_len = int(self.headers.get('content-length', 0))
            plaintext_base64 = self.rfile.read(content_len)

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(encrypt_12(plaintext_base64))


PORT = 5000
Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), ServerHandler) as httpd:
    print("serving at port", PORT)
    httpd.serve_forever()