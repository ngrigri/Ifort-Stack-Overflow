# Ifort-Stack-Overflow
Fortran Source code, comparable to CROCO-NH (https://github.com/ducousso/CROCO-NH), 
which generates a "stack-overflow" with intel fortran compiler on linux platform 
where default stack memory is set to 8192 kbytes.

# To compile
```
./compile.sh
```

# To execute
Edit the file stack_overflow.f90 and activate the call 
*call sub_calc_stack_overflow(nlevs)*
or 
*call sub_calc_no_stack_overflow(nlevs)*

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
