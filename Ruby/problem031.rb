#! /usr/bin/env ruby
=begin
Problem 31 - Project Euler
http://projecteuler.net/index.php?section=problems&id=31
=end
lim = 200
puts (0..lim).step(100).flat_map {|a|
        (0..(lim-a)).step(50).flat_map {|b|
            (0..(lim-(a+b))).step(20).flat_map {|c|
                (0..(lim-(a+b+c))).step(10).flat_map {|d|
                    (0..(lim-(a+b+c+d))).step(5).flat_map {|e|
                        (0..(lim-(a+b+c+d+e))).step(2).count
                    }
                }
            }
        }
    }.sum + 1
