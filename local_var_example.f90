real function sumArrayElements(inArray)
    implicit none
    real, dimension(:), intent(in) :: inArray
    real :: tmpSum != 0.0 do not assign a value to a variable if its not a parameter
    integer :: i
    
    tmpSum = 0.0 ! NOTE: variable-initialization now in executable section.
                 ! so that it does NOT acquire the 'save'-attribute.
    
    do i=1, size(inArray)
        tmpSum = tmpSum + inArray(i)
    end do
    
    sumArrayElements = tmpSum
end function sumArrayElements

program implicity_saved_var
    implicit none
    interface
        real function sumArrayElements(inArray)
            real, dimension(:), intent(in) :: inArray
            real :: tmpSum = 0.0
            integer :: i
        end function sumArrayElements
    end interface
    real, dimension(5) :: exampleArray = [1, 2, 3, 4, 5]
    
    write(*,*) "sum1 =", sumArrayElements(exampleArray) 
    write(*,*) "sum2 =", sumArrayElements(exampleArray)  
    write(*,*) "sum3 =", sumArrayElements(exampleArray)  
    ! sums will be different each time, because tmpSum wont be zero when the second write command is executed
    
end program implicity_saved_var