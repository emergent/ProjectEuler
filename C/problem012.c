/*
 * Problem 12 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=012
 */
#include <math.h>
#include <stdio.h>

void problem012() {
    int ans;
    int term;       /* 項の値 */
    int term_count; /* 項の番号 */
    int i, loop_max, aliquot_num;

    /* solve this problem here */
    term = term_count = 0;
    while (1) {
        term_count++;
        term += term_count;
        loop_max = floor(sqrt(term));
        aliquot_num = 0;
        for (i = 1; i <= loop_max; i++) {
            if (term % i == 0) {
                if (term / i == i) {
                    aliquot_num++;
                } else {
                    aliquot_num += 2;
                }
            }
        }
        if (aliquot_num >= 501) {
            ans = term;
            break;
        }
    }

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem012();
    return 0;
}
