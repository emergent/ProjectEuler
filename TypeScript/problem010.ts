/*
 * #10 Summation of primes - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=10
 */
import { sieve } from "./prime.ts";
{
    const ans = sieve(2_000_000).reduce((acc, x) => acc + x, 0);
    console.log(ans);
}
