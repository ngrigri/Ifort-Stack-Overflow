program stack_overflow

!!
!! XNCD1 machine
!!
!! module load intel/12.1
!!

  USE mod_cst
  USE mod_struct
  USE mod_calc

  implicit none

  integer(kind=ip) :: nlevs = 1
  integer(kind=ip) :: nx = 128
  integer(kind=ip) :: ny = 128
  integer(kind=ip) :: nz = 64

  write(*,*)'Start stack_overflow'

  write(*,*)'Calling  sub_allocate_struct'
  call sub_allocate_struct(nlevs, nx, ny, nz)

  write(*,*)'Calling  sub_set_struct'
  call sub_set_struct(nlevs)

  write(*,*)'Calling  sub_calc_stack_overflow'
  call sub_calc_stack_overflow(nlevs)

!!$  write(*,*)'Calling  sub_calc_no_stack_overflow'
!!$  call sub_calc_no_stack_overflow(nlevs)

  write(*,*)'Exit stack_overflow'

end program stack_overflow
