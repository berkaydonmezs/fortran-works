subroutine make2dArray(rowLength, colLength, array2d)
    implicit none
    integer, intent(in) :: rowLength, colLength
    integer, dimension(rowLength, colLength), intent(inout) :: array2d
    
    array2d = 1
end subroutine make2dArray

integer function sum2dArray(rowLength, colLength, array2d)
    implicit none
    integer, intent(in) :: rowLength, colLength
    integer :: i, j, summer
    integer, dimension(rowLength, colLength), intent(in) :: array2d
    
    summer=0
    do i=1, rowLength
        do j=1, colLength
            summer = summer + array2d(i,j)
        end do
    end do
    
    sum2dArray = summer
end function
    

program get_2d_array_sum
    implicit none
    interface
        subroutine make2dArray(rowLength, colLength, array2d)
            integer, intent(in) :: rowLength, colLength
            integer, dimension(rowLength, colLength), intent(inout) :: array2d
        end subroutine make2dArray
        
        integer function sum2dArray(rowLength, colLength, array2d)
            integer, intent(in) :: rowLength, colLength
            integer :: i, j, summer
            integer, dimension(rowLength, colLength), intent(in) :: array2d
        end function sum2dArray
    end interface
    
    integer :: rowLength=10, colLength=10
    integer :: sumArray
    integer, dimension(10,10) :: array2d
    
    call make2dArray(rowLength, colLength, array2d)
    sumArray = sum2dArray(rowLength, colLength, array2d)
    write(*,*) "sum =", sumArray
end program get_2d_array_sum