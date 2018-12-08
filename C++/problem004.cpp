/*
 * Problem 4 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=4
 */
#include <iostream>

bool isPalindromic(int x) {
    std::string str = std::to_string(x);
    std::string str_rev = str;
    std::reverse(str_rev.begin(), str_rev.end());
    return str == str_rev;
}

int main(int argc, char **argv) {
    int ans = 0;
    int target = 0;
    for (int i=999; i>=101; i--) {
        for (int j=999; j>=101; j--) {
            target = i * j;
            if (target < ans || target < 100000) {
                break;
            }
            if (isPalindromic(target) && target > ans) {
                ans = target;
            }
        }
    }
    std::cout << ans << std::endl;
    return 0;
}
