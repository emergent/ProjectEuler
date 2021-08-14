# Problem 9 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=9

(1..997).each { |a|
  (2..998).each { |b|
    c = 1000 - a - b
    if a*a + b*b == c*c
      puts a*b*c
      exit
    end
  }
}
