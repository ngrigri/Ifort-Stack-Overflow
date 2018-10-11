module mod_struct

  USE mod_cst

  implicit none

  type struct_type
     real(kind=rp),dimension(:,:,:),allocatable :: p
     real(kind=rp),dimension(:,:,:),allocatable :: b
     real(kind=rp),dimension(:,:,:),allocatable :: r
  end type struct_type

  type(struct_type), dimension(:), allocatable :: struct

contains

  subroutine sub_allocate_struct(nlevs, nx, ny, nz)
    integer(kind=ip), intent(in) :: nlevs
    integer(kind=ip), intent(in) :: nx
    integer(kind=ip), intent(in) :: ny
    integer(kind=ip), intent(in) :: nz

    integer(kind=ip) :: lev

    allocate(struct(nlevs))

    do lev=1,nlevs ! 
       allocate(struct(lev)%p(nz,0:ny+1,0:nx+1))
       allocate(struct(lev)%b(nz,0:ny+1,0:nx+1))
       allocate(struct(lev)%r(nz,0:ny+1,0:nx+1))
    enddo

  end subroutine sub_allocate_struct

  subroutine sub_set_struct(nlevs)
    integer(kind=ip), intent(in) :: nlevs

    integer(kind=ip) :: lev

    do lev=1,nlevs ! 
       call random_number(struct(lev)%p(:,:,:))
       call random_number(struct(lev)%b(:,:,:))
       call random_number(struct(lev)%r(:,:,:))
    enddo

  end subroutine sub_set_struct


end module mod_struct
