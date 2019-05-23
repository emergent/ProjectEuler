#=
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=4
=#

is_palindromic(x) = string(x) == reverse(string(x))

function search()
    pmax = 0
    for i in 100:999
        for j in i:999
            p = i * j
            if is_palindromic(p) && p > pmax
                pmax = p
            end
        end
    end
    pmax
end
println(search())
