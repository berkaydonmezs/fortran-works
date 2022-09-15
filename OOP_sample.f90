module ColorFind_class
    implicit none
    
    type ColorFind
        private
        character(:), allocatable, public :: color
        contains
            procedure :: getColorLetterCount
    end type ColorFind
    
contains    
    integer function getColorLetterCount(this)
        class(ColorFind), intent(in) :: this
        getColorLetterCount = len(this%color)  
    end function getColorLetterCount
end module ColorFind_class

program color_find_test
    use ColorFind_class
    implicit none
    
    character(:), allocatable :: color_name
    type(ColorFind) :: colorObject
    
    color_name="green"
    
    print *, color_name
    colorObject%color = color_name
    
    write(*,*) "Your color is ", colorObject%color
    write(*,*) "Color length is ", colorObject%getColorLetterCount()
end program color_find_test
    
    