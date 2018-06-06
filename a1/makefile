
q1d.h5: q1d.jl
	julia $< $@

q1.png: q1.jl q1d.h5
	julia $< $(wordlist 2, $(words $^), $^)

q1: q1.f90 q1d.h5
	gfortran -I/usr/local/include -L/usr/local/lib -lhdf5_fortran q1.f90 -o $@
