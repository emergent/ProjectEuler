# Problem 3 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=3

def max_prime_factor(x)
    d, t = 2, x
    while t != 1
        if (t % d == 0)
            t /= d
        else
            d += 1
        end
    end
    d
end

puts max_prime_factor(600851475143)
