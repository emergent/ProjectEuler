#! /usr/bin/env ruby
# Problem 17 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=17

def count_from_1_to_9
    'one two three four five six seven eight nine'.split.map(&:size).sum
end

def count_from_10_to_19
    'ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen'.split.map(&:size).sum
end

def count_from_20_to_99
    tys = 'twenty thirty forty fifty sixty seventy eighty ninety'.split
    tys.map {|ty| ty.size * 10 + count_from_1_to_9 }.sum
end

def count_from_1_to_99
    count_from_1_to_9 + count_from_10_to_19 + count_from_20_to_99
end

def count_from_100_to_999
    hundred_s = 'hundred'
    and_s = 'and'
    count_from_1_to_9 * 100 + \
        hundred_s.size * 900 + \
        and_s.size * (900 - 9) + \
        count_from_1_to_99 * 9
end

def count_1000
    'one thousand'.split.map(&:size).sum
end

puts count_from_1_to_99 + count_from_100_to_999 + count_1000
