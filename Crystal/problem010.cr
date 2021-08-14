# Problem 10 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=10

def primeBelow(x) : Array(Int64)
  xs = Array.new(x, true)
  xs[0] = false
  xs[1] = false

  a = 2
  while a * a <= x
    if !xs[a]
      a += 1
      next
    end

    i = 2
    while a*i < xs.size
      xs[a*i] = false
      i += 1
    end

    a += 1
  end

  xs.map_with_index { |x, i| (x ? i : 0).to_i64 }.select { |x| x > 0 }
end

puts primeBelow(2_000_000).sum
