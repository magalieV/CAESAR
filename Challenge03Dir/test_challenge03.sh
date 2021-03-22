#!/bin/sh
##
# File name : test_challenge03.sh
# Abstract : Source file of the test of the third challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 04/01/2021
# Last modification : 04/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=5
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=2
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge03 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge03 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge03 testFiles/Input02.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge03
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo
  fi

  ./../challenge03 testFiles/BadFormat.txt
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
  if ./../challenge03 testFiles/input01.txt  | grep -q '42'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "[Basic] Middle len -> Success"
  else
    echo "[Basic] Middle len -> Failed"
  fi

  if ./../challenge03 testFiles/input02.txt  | grep -q '58'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "[Basic] Little len -> Success"
  else
    echo "[Basic] Little len -> Failed"
  fi
}


make re_silent

echo ""
echo "[Challenge03 Test Start]"
testSecurity
basic_test
echo "[Challenge03 Test End]"

echo ""
echo "[Challenge 03 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST