! as for an array name
module ask_for_array_name
character(:), allocatable, public :: name
integer :: str_length

contains

    subroutine ask_array_name
        str_length = 8
        allocate(character(len = str_length) :: name)
        open(unit=2, file='sample_data.txt')
        read(2, *) name
        close(2)

    end subroutine ask_array_name


end module ask_for_array_name

program my_first_program

use ask_for_array_name
implicit none

    real, dimension(5) :: array1,array2
    integer :: i

    call ask_array_name
    
    array1 = [1,2,3,4,5]
    array2 = array1 * 2.
    
    do i=1,3
        if (i>2) then
            exit
        end if
        print *,'Your array name is:', name
        print *,'Your original array is:', array1
        print *,'Your updated array is:', array2
    end do
    
  

end program my_first_program

