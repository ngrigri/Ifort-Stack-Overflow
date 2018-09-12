module mod_calc

  USE mod_cst
  USE mod_struct

  implicit none

contains

  subroutine sub_calc(nlevs)
    integer(kind=ip), intent(in) :: nlevs

    integer(kind=ip) :: lev

    write(*,*)'  - enter in sub_calc'

    do lev=1,nlevs ! 
       struct(lev)%p(:,:,:) = struct(lev)%p(:,:,:) + &
            struct(lev)%b(:,:,:) - &
            struct(lev)%r(:,:,:)
    enddo

    write(*,*)'  - exit  sub_calc'

  end subroutine sub_calc

end module mod_calc
