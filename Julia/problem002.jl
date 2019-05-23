#=
Problem 2 - Project Euler
http://projecteuler.net/index.php?section=problems&id=2
=#

function fibevensum(a, b, sum, xmax)
    if a >= xmax
        sum
    elseif a % 2 == 0
        fibevensum(b, a+b, sum+a, xmax)
    else
        fibevensum(b, a+b, sum, xmax)
    end
end

println(fibevensum(1,2,0, 4000000))
