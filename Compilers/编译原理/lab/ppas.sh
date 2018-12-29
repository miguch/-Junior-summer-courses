#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Assembling pl0
/usr/bin/clang -c -o pl0.o  -arch x86_64 -mmacosx-version-min=10.5 -x assembler pl0.s
if [ $? != 0 ]; then DoExitAsm pl0; fi
rm pl0.s
echo Linking pl0
OFS=$IFS
IFS="
"
/usr/bin/ld /usr/lib/crt1.10.5.o       -x -multiply_defined suppress -L. -o pl0 `cat link.res`
if [ $? != 0 ]; then DoExitLink pl0; fi
IFS=$OFS
