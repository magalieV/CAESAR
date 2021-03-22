#!/bin/sh
##
# File name : test_challenge08.sh
# Abstract : Source file of the test of the eight challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 14/01/2021
# Last modification : 14/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=5
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=1
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge08 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge08 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge08 testFiles/input01.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge08
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo "    [Security] No argument -> Failed"
  fi

  ./../challenge08 testFiles/NotBase64.txt
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not a base 64 -> Success"
  else
    echo "    [Security] Not a base 64 -> Failed"
  fi
}

basic_test()
{
  if ./../challenge08 testFiles/input01.txt | grep -q '15'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic subject example -> Success"
  else
    echo "    [Basic] Basic subject example -> Failed"
  fi
}

make re_silent

echo ""
echo "[Challenge08 Test Start]"
testSecurity
basic_test
echo "[Challenge08 Test End]"

echo ""
echo "[Challenge 08 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST