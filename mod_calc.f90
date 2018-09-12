module mod_calc

  USE mod_cst
  USE mod_struct

  implicit none

contains

  subroutine sub_calc_stack_overflow(nlevs)
    integer(kind=ip), intent(in) :: nlevs

    integer(kind=ip) :: lev
 
    write(*,*)'  - enter in sub_calc'

    do lev=1,nlevs ! 

       struct(lev)%p(:,:,:)      = &
            struct(lev)%p(:,:,:) + &
            struct(lev)%b(:,:,:) - &
            struct(lev)%r(:,:,:)

    enddo

    write(*,*)'  - exit  sub_calc'

  end subroutine sub_calc_stack_overflow

  subroutine sub_calc_no_stack_overflow(nlevs)
    integer(kind=ip), intent(in) :: nlevs

    integer(kind=ip) :: lev
    integer(kind=ip), dimension(:), allocatable :: lb
    integer(kind=ip), dimension(:), allocatable :: ub
    integer(kind=ip) :: ii, jj, kk

    allocate(lb(3))
    allocate(ub(3))

    write(*,*)'  - enter in sub_calc'

    do lev=1,nlevs ! 

       do ii = lb(3),ub(3)
          do jj = lb(2), ub(2)
             do kk = lb(1), ub(1)

                struct(lev)%p(kk,jj,ii)      = &
                     struct(lev)%p(kk,jj,ii) + &
                     struct(lev)%b(kk,jj,ii) - &
                     struct(lev)%r(kk,jj,ii)

             enddo
          enddo
       enddo

    enddo

    write(*,*)'  - exit  sub_calc'

    deallocate(lb)
    deallocate(ub)

  end subroutine sub_calc_no_stack_overflow

end module mod_calc
