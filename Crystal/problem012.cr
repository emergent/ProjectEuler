# Problem 12 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=12

def countdivs(x)
  a = [] of Int32
  (1..).map { |i|
    if i * i <= x
      if x % i == 0
        a.push(i)
        a.push(x // i)
      end
    else
      break
    end
  }
  a.uniq.size
end

def triangle(i)
  i * (i + 1) // 2
end

(1..).each { |i|
  t = triangle(i)
  if countdivs(t) > 500
    puts t
    break
  end
}
