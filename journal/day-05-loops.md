# Day 05: Loops

- **Updated:** 2026-11-16
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Exercise

Guess a number from 1 to 100. Each valid guess uses one of seven attempts. The program reports whether to guess higher or lower and offers another round at the end.

A `while` loop counts guesses, another loop handles replay, and `continue` skips invalid guesses without consuming an attempt. Each round calls `Random.Shared`. Set the optional environment variable `GUESS_TARGET` to a number from 1 to 100 to repeat a specific example. Without it, each round picks a new random number.

## Verification

The Release build passed. [All 5 CLI checks](../assets/progress/day-05-checks.txt) passed. See the [recorded example](../days/day-05/README.md).

## What I understood

<!-- Write this reflection in your own words. -->
-

## Review questions

1. What line consumes an attempt?
2. What does continue skip when the guess is invalid?
3. What happens when the input stream closes halfway through a round?
