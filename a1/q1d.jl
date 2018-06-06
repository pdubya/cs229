
using HDF5

urlx = "http://cs229.stanford.edu/ps/ps1/logistic_x.txt"
urly = "http://cs229.stanford.edu/ps/ps1/logistic_y.txt"

x = open(readdlm, `curl $urlx`)
y = open(readdlm, `curl $urly`)

h5open(ARGS[1], "w") do file
    write(file, "X", x')
    write(file, "Y", y')
end

