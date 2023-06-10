#! /usr/bin/env python3
"""
Problem 17 - Project Euler
http://projecteuler.net/index.php?section=problems&id=17
"""


def count_from_1_to_9():
    nums = "one two three four five six seven eight nine".split()
    return sum(map(len, nums))


def count_from_10_to_19():
    nums = "ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen".split()
    return sum(map(len, nums))


def count_from_20_to_99():
    tys = "twenty thirty forty fifty sixty seventy eighty ninety".split()
    return sum([len(i) * 10 + count_from_1_to_9() for i in tys])


def count_from_1_to_99():
    return count_from_1_to_9() + count_from_10_to_19() + count_from_20_to_99()


def count_from_100_to_999():
    hundred_s = "hundred"
    and_s = "and"
    return (
        count_from_1_to_9() * 100
        + len(hundred_s) * 900
        + len(and_s) * (900 - 9)
        + count_from_1_to_99() * 9
    )


def count_1000():
    num = "one thousand".split()
    return sum(map(len, num))


if __name__ == "__main__":
    print(count_from_1_to_99() + count_from_100_to_999() + count_1000())
