#!/bin/sh
##
# File name : test_challenge02.sh
# Abstract : Source file of the test of the second challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 04/01/2021
# Last modification : 04/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=9
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=5
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge02 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

  ./../challenge02 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge02 testFiles/Input02.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge02
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo "    [Security] No argument -> Failed"
  fi

  ./../challenge02 testFiles/BadFormat.txt
  RETURN_BAD_LINE=$?
  if [ "$BAD_EXIT" -eq "$RETURN_BAD_LINE" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad line separation -> Success"
  else
    echo "    [Security] Bad line separation -> Failed"
  fi

  ./../challenge02 testFiles/BadFormat02.txt
  RETURN_DIGIT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_DIGIT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad digit value -> Success"
  else
    echo "    [Security] Bad digit value -> Failed"
  fi

  ./../challenge02 testFiles/ToManyLines.txt
  RETURN_LINES=$?
  if [ "$BAD_EXIT" -eq "$RETURN_LINES" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many lines -> Success"
  else
    echo "    [Security] Too many lines -> Failed"
  fi

  ./../challenge02 testFiles/BadLen.txt
  RETURN_LEN=$?
  if [ "$BAD_EXIT" -eq "$RETURN_LEN" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad len -> Success"
  else
    echo "    [Security] Bad len -> Failed"
  fi

  ./../challenge02 testFiles/input01_oneHex.txt
  RETURN_LEN=$?
  if [ "$BAD_EXIT" -eq "$RETURN_LEN" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] One hex with lower letter -> Success"
  else
    echo "    [Security] One hex with lower letter -> Failed"
  fi
}

basic_test()
{
  if ./../challenge02 testFiles/input02.txt  | grep -q '1118000F0725001A'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Middle len -> Success"
  else
    echo "    [Basic] Middle len -> Failed"
  fi
  if ./../challenge02 testFiles/input02_01.txt  | grep -q '4CA0'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Little len -> Success"
  else
    echo "    [Basic] Little len -> Failed"
  fi
  if ./../challenge02 testFiles/input02_big.txt  | grep -q '44444444444444444444444444'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Big len -> Success"
  else
    echo "    [Basic] Big len -> Failed"
  fi
  if ./../challenge02 testFiles/input02_veryBig.txt  | grep -q '4444444444444444444444444444444444444444444444444444'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Very big len -> Success"
  else
    echo "    [Basic] Very big len -> Failed"
  fi

  if ./../challenge02 testFiles/First_zero.txt  | grep -q '0916'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] First element is a 0 -> Success"
  else
    echo "    [Basic] First element is a 0 -> Failed"
  fi
}

make re_silent

echo ""
echo "[Challenge02 Test Start]"
testSecurity
basic_test
echo "[Challenge02 Test End]"

echo ""
echo "[Challenge 02 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST