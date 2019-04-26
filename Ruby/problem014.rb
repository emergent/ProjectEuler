#! /usr/bin/env ruby
=begin
Problem 14 - Project Euler
http://projecteuler.net/index.php?section=problems&id=14
=end
$cache = {}

def chain n
    if $cache[n]
        return $cache[n]
    elsif n == 1
        return 1
    end

    collaz = if n.even?
        1 + chain(n / 2)
    else
        1 + chain(3 * n + 1)
    end
    $cache[n] = collaz
    collaz
end

maxlen = 0
maxval = 0
for i in 1..1_000_000
    c = chain i
    if c > maxlen
        maxlen = c
        maxval = i
    end
end
puts maxlen, maxval
