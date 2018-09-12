program stack_overflow

!!
!! XNCD1 machine
!!
!! module load intel/12.1
!!
!! compilation
!! ifort -g -c  mod_cst.f90; ifort -g -c mod_struct.f90; ifort -g -c mod_calc.f90; ifort -g -c stack_overflow.f90
!! edition de liens
!! ifort -g  mod_cst.o mod_struct.o mod_calc.o stack_overflow.o -o stack_overflow
!! 
!!./stack_overflow 
!!  - enter in sub_calc
!!Erreur de segmentation (core dumped)
!!
!! ulimit -s unlimited
!!./stack_overflow 
!!   - enter in sub_calc
!!   - exit  sub_calc      <<< solve the problem !!!
!!
!! valgrind --tool=massif --stacks=yes --max-stackframe=8652800 ./stack_overflow
!! ms_print massif.out.xxxxx > output_xxxxx (xxxx is the process ID)
!!
!!

  USE mod_cst
  USE mod_struct
  USE mod_calc

  implicit none

  integer(kind=ip) :: nlevs = 1
  integer(kind=ip) :: nx = 128
  integer(kind=ip) :: ny = 128
  integer(kind=ip) :: nz = 64

  call sub_allocate_struct(nlevs, nx, ny, nz)

  call sub_set_struct(nlevs)

  call sub_calc(nlevs)

end program stack_overflow
