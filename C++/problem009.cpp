/*
 * Problem 9 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=9
 */
#include <iostream>

bool isPythagorean(int triplet[], int c) {
    int a, b;
    for (b = 4; b < c; b++) {
        for (a = 3; a < b; a++) {
            if (a * a + b * b == c * c) {
                triplet[0] = a;
                triplet[1] = b;
                triplet[2] = c;
                return true;
            }
        }
    }
    return false;
}

int main(int argc, char **argv) {
    int triplet[3];
    int abc = 0;
    int quot = 1;
    for (int c = 5; c < 1000; c++) {
        if (isPythagorean(triplet, c)) {
            int sumabc = triplet[0] + triplet[1] + triplet[2];
            if (1000 % sumabc == 0) {
                quot = 1000 / sumabc;
                abc = (triplet[0] * triplet[1] * triplet[2]) * quot * quot * quot;
                break;
            }
        }
    }
    for (int i = 0; i < 3; i++) {
        if (i != 2) {
            std::cout << triplet[i] * quot << ",";
        } else {
            std::cout << triplet[i] * quot << std::endl;
        }
    }
    std::cout << abc << std::endl;
    return 0;
}
