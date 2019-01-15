#! /usr/bin/env ruby
=begin
Problem 35 - Project Euler
http://projecteuler.net/index.php?section=problems&id=35
=end
require 'prime'

def rotate x
    xs = x.to_s
    (xs[1..-1] + xs[0]).to_i
end

def rotate_filter arr, res
    return res if arr.empty?

    x = arr.shift
    tmp = [x]
    xr = rotate(x)

    while x != xr
        if arr.include? xr
            arr.delete xr
            tmp << xr
        else
            tmp = []
            break
        end
        xr = rotate(xr)
    end

    rotate_filter arr, res + tmp
end

puts (rotate_filter(
        Prime.each(1_000_000).to_a.select {|i| i.to_s =~ /^[^024568]+$/ && i > 10 }, \
        []) + [2,3,5,7]
     ).count
