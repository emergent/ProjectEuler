/*
 * #7 10001st prime - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=7
 */
import { sieve } from "./prime.ts";
const primes = sieve(200000);
console.log(primes[10000]);
