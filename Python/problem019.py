#! /usr/bin/env python3
"""
Problem 19 - Project Euler
http://projecteuler.net/index.php?section=problems&id=019
"""
daysofmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


def count_sundays():
    days1901to2000 = []
    for year in range(1901, 2000 + 1):
        if year % 400 == 0 or (year % 100 != 0 and year % 4 == 0):
            dom_leap = daysofmonths[:]
            dom_leap[1] = 29
            days1901to2000.extend(dom_leap)
        else:
            days1901to2000.extend(daysofmonths)

    amountofdays = 0
    sundays = 0
    for days in days1901to2000:
        if amountofdays % 7 == 5:  # 1 Jan 1901 was a Tuesday
            sundays += 1
        amountofdays += days
    return sundays


if __name__ == "__main__":
    print(count_sundays())
