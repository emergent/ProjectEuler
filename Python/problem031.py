#! /usr/bin/env python3
"""
Problem 31 - Project Euler
http://projecteuler.net/index.php?section=problems&id=031
"""


def coin_patterns(rest, coins, pattern, ways):
    if len(coins) == 1 and coins[0] == 1:
        pattern.append(rest)
        ways.append(pattern)
    else:
        n = rest // coins[0]
        for i in range(0, n + 1):
            ways = coin_patterns(rest - coins[0] * i, coins[1:], pattern + [i], ways)
    return ways


if __name__ == "__main__":
    coins = [200, 100, 50, 20, 10, 5, 2, 1]
    ways = coin_patterns(200, coins, [], [])
    print(len(ways))
