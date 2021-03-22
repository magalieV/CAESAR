#!/bin/sh

BAD_EXIT=84
NUMBER_OF_SECURITY_TEST=4
NUMBER_OF_SUCCESS_SECURITY=0
NUMBER_OF_BASIC_TEST=2
NUMBER_OF_SUCCESS_BASIC=0

testSecurity()
{
  ./../challenge01 testFiles/NotAFile
  RETURN_NOT=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NOT" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Not_A_File -> Success"
  else
    echo "    [Security] Not_A_File -> Failed"
  fi

  ./../challenge01 testFiles/Empty.txt
  RETURN_EMPTY=$?
  if [ "$BAD_EXIT" -eq "$RETURN_EMPTY" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Empty -> Success"
  else
    echo "    [Security] Empty -> Failed"
  fi

  ./../challenge01
  RETURN_NO=$?
  if [ "$BAD_EXIT" -eq "$RETURN_NO" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] No argument -> Success"
  else
    echo "    [Security] No argument -> Failed"
  fi

  ./../challenge01 testFiles/NotHexa.txt
  RETURN_BAD_LINE=$?
  if [ "$BAD_EXIT" -eq "$RETURN_BAD_LINE" ]
  then
    NUMBER_OF_SUCCESS_SECURITY=$((NUMBER_OF_SUCCESS_SECURITY+1))
    echo "    [Security] Bad line separation -> Success"
  else
    echo "    [Security] Bad line separation -> Failed"
  fi
}

basic_test()
{
  if ./../challenge01 testFiles/input01.txt  | grep -q 'Sw=='; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "[Basic] Middle len -> Success"
  else
    echo "[Basic] Middle len -> Failed"
  fi

  if ./../challenge01 testFiles/input01_01.txt  | grep -q 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29tSSdtIGtpbGxp
bmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'; then
    NUMBER_OF_SUCCESS_BASIC=$((NUMBER_OF_SUCCESS_BASIC+1))
    echo "[Basic] Little len -> Success"
  else
    echo "[Basic] Little len -> Failed"
  fi
}

make re_silent

echo "[Challenge01 Test Start]"
testSecurity
basic_test
echo "[Challenge01 Test End]"

echo ""
echo "[Challenge 01 Result]"
echo "    - Security" $NUMBER_OF_SUCCESS_SECURITY"/"$NUMBER_OF_SECURITY_TEST
echo "    - Basic" $NUMBER_OF_SUCCESS_BASIC"/"$NUMBER_OF_BASIC_TEST