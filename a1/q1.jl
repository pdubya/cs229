
using HTTP

function data()
    urlx = "http://cs229.stanford.edu/ps/ps1/logistic_x.txt"
    urly = "http://cs229.stanford.edu/ps/ps1/logistic_y.txt"

    HTTP.get(urlx).body
end

u = data()
@time begin
    u = data()
end
println(length(u))

function fmin(objective::θ₀::AbstractArray{Real})
end

function nr_update(θ::AbstractArray{Real})
    N = size(θ, 1)
    M = size(x, 2)
    # margin
    m = y.*(θ'*x)
    z = exp.(m)
    grad = zeros(Float64, (N, 1))
    hess = zeros(Float64, (N, N))
    for i in 1:M
        col1 = slice(x, :, i)
        grad += y[i]*z[i]/(1 + z[i])*col
        hess += z[i]/(1 + z[i])^2*(col*col')
    end
    grad = -sum(y.*x.*z./(1 + z), 2)/size(x, 2)
    -hess \ grad
end

function 

    

    

