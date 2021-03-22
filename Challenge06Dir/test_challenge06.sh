#!/bin/sh
##
# File name : test_challenge05.sh
# Abstract : Source file of the test of the fifth challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 05/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=5
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=3
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge06 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge06 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge06 testFiles/input01.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge06
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo
  fi

  ./../challenge06 testFiles/BadFormat.txt
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
  if ./../challenge06 testFiles/input01.txt | grep -q '523163683452642035373431316D344E'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic example key -> Success"
  else
    echo "    [Basic] Basic example key -> Failed"
  fi

  if ./../challenge06 testFiles/test10Len.txt | grep -q '4D41434C45'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic ten key -> Success"
  else
    echo "    [Basic] Basic ten key -> Failed"
  fi

  if ./../challenge06 testFiles/test_06.txt | grep -q '48656C6C6F20526F6D75616C64'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic twenty six key -> Success"
  else
    echo "    [Basic] Basic twenty six key -> Failed"
  fi
}

make re_silent

echo ""
echo "[Challenge06 Test Start]"
testSecurity
basic_test
echo "[Challenge06 Test End]"

echo ""
echo "[Challenge 06 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST