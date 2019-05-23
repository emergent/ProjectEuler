#=
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=3
=#

function maxprimefactor(x)
    divider = 2
    target = x
    while target != 1
        if target % divider == 0
            target /= divider
        else
            divider += 1
        end
    end
    divider
end

println(maxprimefactor(600851475143))
