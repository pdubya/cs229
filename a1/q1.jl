
using HDF5

x, y = h5open(ARGS[1], "r") do file
    x1 = read(file, "X")
    vcat(ones(x1[1:1,:]), x1), read(file, "Y")
end

function nr_update(θ::AbstractArray{T}) where T <: Real
    N = size(θ, 1)
    M = size(x, 2)
    grad = zeros(Float64, (N, 1))
    hess = zeros(Float64, (N, N))
    for i in 1:M
        col = slicedim(x, 2, i:i)
        z = exp.(y[i]*(θ'*col))
        grad += @. y[i]*z/(1 + z)*col
        hess += @. z/(1 + z)^2*(col*col')
    end
    -hess \ grad
end

θ = zeros(slicedim(x, 2, 1:1))
println(θ)
for q in 1:10
    dθ = nr_update(θ)
    θ += dθ
    println(dθ, θ)
end

using Plots
gr()
q = y .> 0
xpos = x[:,q[1,:]]'
xneg = x[:,.~q[1,:]]'
scatter(xpos[:,2], xpos[:,3], c=:blue, label = "Positive Response", markeralpha = 0.2)
scatter!(xneg[:,2], xneg[:,3], c=:red, label = "Negative Response", markeralpha = 0.2)

x1_bnds = [minimum(x[2,:]), maximum(x[2,:])]
u(z) = -(θ[2]*z + θ[1])/θ[3]
plt = plot!(x1_bnds, u.(x1_bnds), c=:green, label = "")
gui(plot!())
readline(STDIN)


