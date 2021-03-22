#!/bin/sh
##
# File name : test_challenge05.sh
# Abstract : Source file of the test of the fifth challenge
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 05/01/2021
##

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=8
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=3
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge05 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

    ./../challenge05 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge05 testFiles/input01.txt AnotherOne
  RETURN_TOO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_TOO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Too many arguments -> Success"
  else
    echo "    [Security] Too many arguments -> Failed"
  fi

  ./../challenge05
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo
  fi

  ./../challenge05 testFiles/BadFormat.txt
  RETURN_BAD_LINE=$?
  if [ "$BAD_EXIT" -eq "$RETURN_BAD_LINE" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad format -> Success"
  else
    echo "    [Security] Bad format -> Failed"
  fi

  ./../challenge05 testFiles/BadLen.txt
  RETURN_LEN=$?
  if [ "$BAD_EXIT" -eq "$RETURN_LEN" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad len -> Success"
  else
    echo "    [Security] Bad len -> Failed"
  fi

  ./../challenge05 testFiles/BadLen2.txt
  RETURN_LEN=$?
  if [ "$BAD_EXIT" -eq "$RETURN_LEN" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad len two empty line -> Success"
  else
    echo "    [Security] Bad len two empty line -> Failed"
  fi

  ./../challenge05 testFiles/BadLen3.txt
  RETURN_LEN=$?
  if [ "$BAD_EXIT" -eq "$RETURN_LEN" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad len middle empty line -> Success"
  else
    echo "    [Security] Bad len middle empty line -> Failed"
  fi
}

basic_test()
{
  if ./../challenge05 testFiles/input01.txt | grep -q '132630673C3A2B2B75282875266E20292723223C262E3A2C672726672F75372234242B75332175212126332B27672A30252F21226E34292A753321752F2F23226E3C293A30352B2633273B206E312E3D36323D262E213B346075062031673A3D226E27282230672133672F752A2F3F283C7532203C312B273427213E6E3C346E21286E3D263830673E34353A3C243B39263C393E6E3C293A30352B2633273B206E312E3D36323D262E213B3460'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic 0 first key -> Success"
  else
    echo "    [Basic] Basic 0 first key -> Failed"
  fi

  if ./../challenge05 testFiles/input01_little.txt | grep -q '38E7'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic little 0 first key -> Success"
  else
    echo "    [Basic] Basic little 0 first key -> Failed"
  fi

  if ./../challenge05 testFiles/input01_normal.txt | grep -q '46E7'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "    [Basic] Basic little normal -> Success"
  else
    echo "    [Basic] Basic little normal -> Failed"
  fi
}

make re_silent

echo ""
echo "[Challenge05 Test Start]"
testSecurity
basic_test
echo "[Challenge05 Test End]"

echo ""
echo "[Challenge 05 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST