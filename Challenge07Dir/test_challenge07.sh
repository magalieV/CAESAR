#!/bin/sh
##
# File name : test_challenge07.sh
# Abstract : Source file of the test of the seventh challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 15/01/2021
# Last modification : 15/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=8
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=1
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge07 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge07 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge07 testFiles/input.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge07
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo "    [Security] No argument -> Failed"
  fi

  ./../challenge07 testFiles/BadFormat.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not a base 64 -> Success"
  else
    echo "    [Security] Not a base 64 -> Failed"
  fi

  ./../challenge07 testFiles/BadKey.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad key -> Success"
  else
    echo "    [Security] Bad key -> Failed"
  fi

  ./../challenge07 testFiles/BadLen.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad len -> Success"
  else
    echo "    [Security] Bad len -> Failed"
  fi

  ./../challenge07 testFiles/NoKey.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No key -> Success"
  else
    echo "    [Security] No key -> Failed"
  fi
}

basic_test()
{
  if ./../challenge07 testFiles/input.txt | grep -q 'U28gaW1hZ2luZSB3aGF0IGl0IHdvdWxkIGJlIGxpa2UgaWYgcmVjaXBlcyB3ZXJlIHBhY2thZ2VkIGluc2lkZSBibGFjawpib3hlcy4gWW91IGNvdWxkbid0IHNlZSB3aGF0IGluZ3JlZGllbnRzIHRoZXkncmUgdXNpbmcsIGxldCBhbG9uZSBjaGFuZ2UKdGhlbSwgYW5kIGltYWdpbmUgaWYgeW91IG1hZGUgYSBjb3B5IGZvciBhIGZyaWVuZCwgdGhleSB3b3VsZCBjYWxsIHlvdQphIHBpcmF0ZSBhbmQgdHJ5IHRvIHB1dCB5b3UgaW4gcHJpc29uIGZvciB5ZWFycy4gVGhhdCB3b3JsZCB3b3VsZCBjcmVhdGUKdHJlbWVuZG91cyBvdXRyYWdlIGZyb20gYWxsIHRoZSBwZW9wbGUgd2hvIGFyZSB1c2VkIHRvIHNoYXJpbmcgcmVjaXBlcy4KQnV0IHRoYXQgaXMgZXhhY3RseSB3aGF0IHRoZSB3b3JsZCBvZiBwcm9wcmlldGFyeSBzb2Z0d2FyZSBpcyBsaWtlLiBBCndvcmxkIGluIHdoaWNoIGNvbW1vbiBkZWNlbmN5IHRvd2FyZHMgb3RoZXIgcGVvcGxlIGlzIHByb2hpYml0ZWQgb3IKcHJldmVudGVkLgo='; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic subject example -> Success"
  else
    echo "    [Basic] Basic subject example -> Failed"
  fi
}

make re_silent

echo ""
echo "[Challenge07 Test Start]"
testSecurity
basic_test
echo "[Challenge07 Test End]"

echo ""
echo "[Challenge 07 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST