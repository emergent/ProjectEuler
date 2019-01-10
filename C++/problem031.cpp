/*
 * Problem 31 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=31
 */
#include <iostream>
#include <chrono>
#define LIMIT 201

constexpr int pat(int x) {
    int pat = 0;
    for (int a = 0; a < x; a+=100) {
        for (int b = 0; b < x-a; b+=50) {
            for (int c = 0; c < x-(a+b); c+=20) {
                for (int d = 0; d < x-(a+b+c); d+=10) {
                    for (int e = 0; e < x-(a+b+c+d); e+=5) {
                        for (int f = 0; f < x-(a+b+c+d+e); f+=2) {
                            pat += 1; }}}}}}
    return pat + 1;
}

int main(int argc, char **argv) {
    std::chrono::system_clock::time_point start, end;
    start = std::chrono::system_clock::now();

    std::cout << pat(LIMIT) << std::endl;

    end = std::chrono::system_clock::now();

    double time = static_cast<double>(std::chrono::duration_cast<std::chrono::microseconds>(end - start).count() / 1000.0);

    printf("time %lf[ms]\n", time);
    return 0;
}
