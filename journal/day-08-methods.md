# Day 08: Methods

- **Updated:** 2026-11-16
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Exercise

The default mode accepts an IPv4 prefix and displays the number of usable hosts under the traditional network-and-broadcast rule. Two other modes extract calculation patterns from the Day 02 temperature converter and Day 03 receipt.

Run with `-- temperature` or `-- receipt` after the project options to try the method examples. `CalculateSubnet` returns a `long` so `/0` fits. Under this exercise’s counting rule, `/31` and `/32` return zero. The demos show an overload, a default parameter, tuple results, and `out` via `TryParse`.

## Verification

The Release build passed. [All 10 CLI checks](../assets/progress/day-08-checks.txt) passed. See the [recorded example](../days/day-08/README.md).

## What I understood

<!-- Write this reflection in your own words. -->
-

## Review questions

1. Why does the result use long?
2. What is the role of the optional discount argument?
3. How does TryParse pass its result back to the caller?
