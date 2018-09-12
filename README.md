# Ifort-Stack-Overflow
fortran Source code which generate a stack overflow with intel fortran compiler on linux platform with default stack memory set to 8192 kbytes.


- test on XNCD1 machine

```
 module load intel/12.1
```

# compilation
```
 ifort -g -c  mod_cst.f90; ifort -g -c mod_struct.f90; ifort -g -c mod_calc.f90; ifort -g -c stack_overflow.f90
 edition de liens
 ifort -g  mod_cst.o mod_struct.o mod_calc.o stack_overflow.o -o stack_overflow
```

``` 
./stack_overflow 
  - enter in sub_calc
Erreur de segmentation (core dumped)
```

```
 ulimit -s unlimited
```

```
./stack_overflow 
   - enter in sub_calc
   - exit  sub_calc      <<< No stack overflow !!!
```

# Memory profilng using Valgrind
```
 valgrind --tool=massif --stacks=yes --max-stackframe=8652800 ./stack_overflow
 ms_print massif.out.xxxxx > output_xxxxx (xxxx is the process ID)
```
