#!/bin/sh
##
# File name : test_challenge04.sh
# Abstract : Source file of the test of the third challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 06/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=5
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=1
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge04 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge04 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge04 testFiles/Input02.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge04
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo
  fi

  ./../challenge04 testFiles/BadFormat.txt
  RETURN_BAD_LINE=$?
  if [ "$BAD_EXIT" -eq "$RETURN_BAD_LINE" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad format -> Success"
  else
    echo "    [Security] Bad format -> Failed"
  fi

}

basic_test()
{
  if ./../challenge04 testFiles/input01.txt  | grep -q '171 35'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "[Basic] Middle len -> Success"
  else
    echo "[Basic] Middle len -> Failed"
  fi
}


make re_silent

echo ""
echo "[Challenge04 Test Start]"
testSecurity
basic_test
echo "[Challenge04 Test End]"

echo ""
echo "[Challenge 04 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST