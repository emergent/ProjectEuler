#! /usr/bin/env python3
'''
Problem 28 - Project Euler

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

<span style="color:#ff0000;font-family:'courier new';"><b>21</b></span> 22 23 24 <span style="color:#ff0000;font-family:'courier new';"><b>25</b></span><br>
20  <span style="color:#ff0000;font-family:'courier new';"><b>7</b></span>  8  <span style="color:#ff0000;font-family:'courier new';"><b>9</b></span> 10<br>
19  6  <span style="color:#ff0000;font-family:'courier new';"><b>1</b></span>  2 11<br>
18  <span style="color:#ff0000;font-family:'courier new';"><b>5</b></span>  4  <span style="color:#ff0000;font-family:'courier new';"><b>3</b></span> 12<br><span style="color:#ff0000;font-family:'courier new';"><b>17</b></span> 16 15 14 <span style="color:#ff0000;font-family:'courier new';"><b>13</b></span>

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

http://projecteuler.net/index.php?section=problems&id=028
'''
def sum_diagonals_n_by_n_spiral(n): # when n is odd number only
    return sum([4 * (x ** 2) - 6 * x + 6 for x in range(1, n+1, 2)]) - 3

if __name__ == '__main__':
    print(sum_diagonals_n_by_n_spiral(1001))
