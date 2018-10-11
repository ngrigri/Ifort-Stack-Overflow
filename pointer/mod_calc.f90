module mod_calc

  USE mod_cst
  USE mod_struct

  implicit none

contains

  subroutine sub_calc_stack_overflow(nlevs)
    integer(kind=ip), intent(in) :: nlevs

    integer(kind=ip) :: lev
 
    write(*,*)'  - enter in sub_calc_stack_overflow'

    do lev=1,nlevs ! 

       struct(lev)%p(:,:,:)      = &
            struct(lev)%p(:,:,:) + &
            struct(lev)%b(:,:,:) - &
            struct(lev)%r(:,:,:)

    enddo

    write(*,*)'  - exit  sub_calc_stack_overflow'

  end subroutine sub_calc_stack_overflow

  subroutine sub_calc_no_stack_overflow(nlevs)
    integer(kind=ip), intent(in) :: nlevs

    integer(kind=ip) :: lev
    integer(kind=ip) :: ii, jj, kk

    write(*,*)'  - enter in sub_no_stack_overflow'

    do lev=1,nlevs ! 

       do ii = lbound(struct(lev)%p,dim=3), ubound(struct(lev)%p,dim=3)
          do jj = lbound(struct(lev)%p,dim=2), ubound(struct(lev)%p,dim=2)
             do kk = lbound(struct(lev)%p,dim=1), ubound(struct(lev)%p,dim=1)

                struct(lev)%p(kk,jj,ii)      = &
                     struct(lev)%p(kk,jj,ii) + &
                     struct(lev)%b(kk,jj,ii) - &
                     struct(lev)%r(kk,jj,ii)

             enddo
          enddo
       enddo

    enddo

    write(*,*)'  - exit  sub_calc_no_stack_overflow'

  end subroutine sub_calc_no_stack_overflow

end module mod_calc
