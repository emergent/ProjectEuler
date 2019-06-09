# Problem 7 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=7

def prime?(x)
    if x <= 1
        return false
    elsif x == 2
        return true
    elsif x % 2 == 0
        return false
    else
        a = 3
        while a * a <= x
            if x % a == 0
                return false
            end
            a += 2
        end
    end
    true
end

def prime_index(n)
    return 2 if n == 1
    i = 2
    num = 3
    while i < n
        num += 2
        i += 1 if prime?(num)
    end
    num
end

puts prime_index(10001)
