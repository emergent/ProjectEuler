/*
 * Problem 4 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=004
 */
#include <math.h>
#include <stdio.h>

/*
- 999x999から始める。
- 最大のものは6桁になるだろうという前提で処理する(10000 < y < 1000000)
 */
void problem004() {
    int ans;
    int i, j, target, tmp, digit_num;
    int digit[6];

    /* solve this problem here */
    ans = 0;
    for (i = 999; i >= 101; i--) {
        for (j = 999; j >= 101; j--) {
            target = i * j;
            if (target < ans || target < 100000) {
                /* 現状の最大値より小さいまたは5桁になったらループを一つ抜ける
                 */
                break;
            }
            for (digit_num = 0; digit_num < 6; digit_num++) {
                tmp = (int)pow(10, digit_num + 1);
                digit[digit_num] = target - ((target / tmp) * tmp);
                digit[digit_num] /= (int)pow(10, digit_num);
            }
            if (digit[0] == digit[5] && digit[1] == digit[4] &&
                digit[2] == digit[3]) {
                if (target > ans) {
                    printf("(i,j) = (%d, %d), i*j = %d\n", i, j, target);
                    ans = target;
                }
            }
        }
    }

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem004();
    return 0;
}
