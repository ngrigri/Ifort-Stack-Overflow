# Ifort-Stack-Overflow
Fortran Source code, comparable to CROCO-NH (https://github.com/ducousso/CROCO-NH), 
which generates a "stack-overflow" with intel fortran compiler on linux platform 
where default stack memory is set to 8192 kbytes.

In general, ALLOCATABLE arrays are more efficient. 
But in Fortran 90/95 POINTER arrays were more flexible. 
For example, it was not possible to use ALLOCATABLE arrays as components of derived types. 
Fortran 2003 fixed that issue. So use ALLOCATABLE arrays when you can.

# To select stack overflow or not
Edit the file stack_overflow.f90 and activate
*call sub_calc_stack_overflow(nlevs)*
or 
*call sub_calc_no_stack_overflow(nlevs)*

# To compile
```
./compile.sh
```

# To execute

```
./stack_overflow
```

# To clean directory to intermediate files
```
./clean.sh
```


# Memory profiling using Valgrind
```
 valgrind --tool=massif --stacks=yes --max-stackframe=8652800 ./stack_overflow
 ms_print massif.out.xxxxx > output_xxxxx (xxxx is the process ID)
```
