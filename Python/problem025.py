#! /usr/bin/env python3
'''
Problem 25 - Project Euler

The Fibonacci sequence is defined by the recurrence relation:

<blockquote>F<sub><i>n</i></sub> = F<sub><i>n</i>−1</sub> + F<sub><i>n</i>−2</sub>, where F<sub>1</sub> = 1 and F<sub>2</sub> = 1.</blockquote>
Hence the first 12 terms will be:

<blockquote>F<sub>1</sub> = 1<br>
F<sub>2</sub> = 1<br>
F<sub>3</sub> = 2<br>
F<sub>4</sub> = 3<br>
F<sub>5</sub> = 5<br>
F<sub>6</sub> = 8<br>
F<sub>7</sub> = 13<br>
F<sub>8</sub> = 21<br>
F<sub>9</sub> = 34<br>
F<sub>10</sub> = 55<br>
F<sub>11</sub> = 89<br>
F<sub>12</sub> = 144</blockquote>
The 12th term, F<sub>12</sub>, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

http://projecteuler.net/index.php?section=problems&id=025
'''
def fibonacci(): # generator
    a, b, i = 1, 1, 1
    while True:
        yield (i, a)
        a, b = b, a+b
        i = i + 1

if __name__ == '__main__':
    maxdigits = 1000
    fib = fibonacci()
    i, f = next(fib)
    while len(str(f)) < maxdigits:
        i, f = next(fib)
    print(i, f)



