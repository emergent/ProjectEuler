#! /usr/bin/env python3
"""
Problem 14 - Project Euler
http://projecteuler.net/index.php?section=problems&id=014
"""
chains = {}


def getCollatzChainLength(n):
    chain = []
    extra = 0
    while n != 1:
        if n in chains:
            extra = chains[n]
            break
        else:
            chain.append(n)
            if n % 2 == 0:  # even
                n = n // 2
            else:  # odd
                n = n * 3 + 1
    else:
        chain.append(n)

    for i, item in enumerate(chain):
        if item not in chains:
            chains[item] = len(chain[i:]) + extra

    return len(chain) + extra


if __name__ == "__main__":
    print(
        max(
            [(x, getCollatzChainLength(x)) for x in range(1, 1_000_000)],
            key=(lambda x: x[1]),
        )
    )
