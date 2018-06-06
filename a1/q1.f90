program q1

    ! Assignment 1/Question 1

    use iso_fortran_env, only: output_unit, real64, int64
    use HDF5

    implicit none
    integer(kind = int64)  :: dim0, dim1 ! hold the dimensions for the x data
    integer*4  :: major, minor, rel, check
    character(len=5), parameter :: filename = "q1.h5"

    call H5get_libversion_f(major, minor, rel, check)
    write(unit=output_unit, fmt=*) filename

    write(unit=output_unit, fmt=*) check
    write(unit=output_unit, fmt=*) major
    write(unit=output_unit, fmt=*) minor
    write(unit=output_unit, fmt=*) rel

end program q1

