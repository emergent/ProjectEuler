#=
Problem 1 - Project Euler
http://projecteuler.net/index.php?section=problems&id=001
=#
function summul(n, x)
    count = div(n, x)
    div(x * count * (count + 1), 2)
end

N = 1000-1
println(summul(N, 3) + summul(N, 5) - summul(N, 3 * 5))

