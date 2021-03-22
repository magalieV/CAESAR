#!/bin/sh
##
# File name : test_challenge07.sh
# Abstract : Source file of the test of the seventh challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 15/01/2021
# Last modification : 15/01/2021
##

BAD_EXIT=84
GOOD_EXIT=0
NUMBER_OF_SECURITY_TEST=11
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=2
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge09 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge09 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge09 testFiles/input.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge09
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo "    [Security] No argument -> Failed"
  fi

  ./../challenge09 testFiles/BadFormat.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not a base 64 -> Success"
  else
    echo "    [Security] Not a base 64 -> Failed"
  fi

  ./../challenge09 testFiles/BadKeyFormat.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad key format -> Success"
  else
    echo "    [Security] Bad key format -> Failed"
  fi

  ./../challenge09 testFiles/NoKey.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No key -> Success"
  else
    echo "    [Security] No key -> Failed"
  fi

    ./../challenge09 testFiles/BadIvLen.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad iv len -> Success"
  else
    echo "    [Security] Bad iv len-> Failed"
  fi

  ./../challenge09 testFiles/BadIvFormat.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad iv format -> Success"
  else
    echo "    [Security] Bad iv format -> Failed"
  fi

  ./../challenge09 testFiles/NoIv.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No iv -> Success"
  else
    echo "    [Security] No iv -> Failed"
  fi

  ./../challenge09 testFiles/BadLen.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad len -> Success"
  else
    echo "    [Security] Bad len -> Failed"
  fi
}

basic_test()
{
  if ./../challenge09 testFiles/input.txt | grep -q 'SW4gU2VwdGVtYmVyIDE5ODQsIEkgc3RhcnRlZCB3cml0aW5nIEdOVSBFbWFjcywgd2hpY2ggd2FzIG15IHNlY29uZAppbXBsZW1lbnRhdGlvbiBvZiBFbWFjcywgYW5kIGJ5IGVhcmx5IDE5ODUsIGl0IHdhcyB3b3JraW5nLiBJIGNvdWxkCnVzZSBpdCBmb3IgYWxsIG15IGVkaXRpbmcsIHdoaWNoIHdhcyBhIGJpZyByZWxpZWYsIGJlY2F1c2UgSSBoYWQgbm8KaW50ZW50aW9uIG9mIGxlYXJuaW5nIHRvIHVzZSBWSSwgdGhlIFVOSVggZWRpdG9yLiBbTGF1Z2h0ZXJdIFNvLCB1bnRpbAp0aGF0IHRpbWUsIEkgZGlkIG15IGVkaXRpbmcgb24gc29tZSBvdGhlciBtYWNoaW5lLCBhbmQgc2F2ZWQgdGhlCmZpbGVzIHRocm91Z2ggdGhlIG5ldHdvcmssIHNvIHRoYXQgSSBjb3VsZCB0ZXN0IHRoZW0uIEJ1dCB3aGVuIEdOVQpFbWFjcyB3YXMgcnVubmluZyB3ZWxsIGVub3VnaCBmb3IgbWUgdG8gdXNlIGl0LCBpdCB3YXMgYWxzbyAtLSBvdGhlcgpwZW9wbGUgd2FudGVkIHRvIHVzZSBpdCB0b28uCgpTbyBJIGhhZCB0byB3b3JrIG91dCB0aGUgZGV0YWlscyBvZiBkaXN0cmlidXRpb24uIE9mIGNvdXJzZSwgSSBwdXQgYSBjb3B5CmluIHRoZSBhbm9ueW1vdXMgRlRQIGRpcmVjdG9yeSwgYW5kIHRoYXQgd2FzIGZpbmUgZm9yIHBlb3BsZSB3aG8gd2VyZSBvbgp0aGUgbmV0LiBUaGV5IGNvdWxkIHRoZW4ganVzdCBwdWxsIG92ZXIgYSB0YXIgZmlsZSwgYnV0IGEgbG90IG9mCnByb2dyYW1tZXJzIHRoZW4gZXZlbiB3ZXJlIG5vdCBvbiB0aGUgbmV0IGluIDE5ODUuImY7iCBIywX0L4G19RXfEg=='; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic subject example -> Success"
  else
    echo "    [Basic] Basic subject example -> Failed"
  fi

    ./../challenge09 testFiles/BadKeyLen.txt
  RETURN_NO=$?
  if [ "$GOOD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Bad key len (padding) -> Success"
  else
    echo "    [Basic] Bad key len (padding) -> Failed"
  fi
}

make re_silent

echo ""
echo "[Challenge09 Test Start]"
testSecurity
basic_test
echo "[Challenge09 Test End]"

echo ""
echo "[Challenge 09 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST