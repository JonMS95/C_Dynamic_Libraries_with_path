#!/bin/sh

DL_PATH=~/Desktop/scripts/C/C_Dynamic_Libraries_with_path/Dynamic_libraries

echo
echo "***********************************"
echo "Set LD_LIBRARY_PATH a proper value."
echo "***********************************"
export LD_LIBRARY_PATH=$DL_PATH
echo "export LD_LIBRARY_PATH=$DL_PATH"

sleep 1

echo
echo "*******************************"
echo "Testing 'mult' executable file."
echo "*******************************"
./Executable_files/mult 10 3

sleep 1

echo
echo "*******************************"
echo "Testing 'div' executable file."
echo "*******************************"
./Executable_files/div 10 3