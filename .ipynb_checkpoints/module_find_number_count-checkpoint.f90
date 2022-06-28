module ArrayNumberCounter

    implicit none
    integer, private :: i
    
    contains
    
    subroutine countNumberInArray(array1D, arraySize, numberInterest, counter)
        implicit none
        integer, dimension(:), intent(in) :: array1D
        integer, intent(in) :: arraySize, numberInterest
        integer, intent(out) :: counter
        
        counter = 0
        
        do i=1, arraySize
            if (array1D(i) == numberInterest) then
                counter = counter + 1
            end if
        end do
        
    end subroutine countNumberInArray
end module

program count_number_in_array
    use ArrayNumberCounter, only : countNumberInArray
    
    implicit none
    integer, dimension(11) :: array1D = [1, 2, 3, 3, 4, 4, 5, 5, 5, 6, 7]
    integer :: arraySize, numberInterest, counter
    
    arraySize = size(array1D)
    numberInterest = 5
    
    call countNumberInArray(array1D, arraySize, numberInterest, counter)
    write(*,*) "count for", numberInterest, "is", counter
    
end program count_number_in_array
    
        