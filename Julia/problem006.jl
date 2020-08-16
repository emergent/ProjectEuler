# Problem 6 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=6

function p006()
    sqsum = 0
    sum = 0

    for i in 1:100
        sqsum += i * i
        sum += i
    end

    (sum * sum) - sqsum
end

println(p006())
