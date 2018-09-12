#!/bin/bash
echo "compiling mod_cst.f90"
ifort -g -c mod_cst.f90
echo "compiling mod_struct.f90"
ifort -g -c mod_struct.f90
echo "compiling mod_calc.f90"
ifort -g -c mod_calc.f90
echo "compiling stack_overflow.f90"
ifort -g -c stack_overflow.f90

echo "Linking and creating executable stack_overflow"
ifort -g  mod_cst.o mod_struct.o mod_calc.o stack_overflow.o -o stack_overflow
