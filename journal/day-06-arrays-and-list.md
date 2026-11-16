# Day 06: Arrays and List

- **Updated:** 2026-11-16
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Exercise

An in-memory network device list supports add, view, and delete by displayed number. The numbered menu uses a fixed array, while devices belong to a growable `List<string>`.

Display numbers start at one. A list index starts at zero, so deletion uses `RemoveAt(number - 1)` after checking the range. Device labels can repeat. Closing input or selecting 0 exits.

## Verification

The Release build passed. [All 4 CLI checks](../assets/progress/day-06-checks.txt) passed. See the [recorded example](../days/day-06/README.md).

## What I understood

<!-- Write this reflection in your own words. -->
-

## Review questions

1. Why do the menu choices suit an array?
2. Why does deletion subtract 1 from the displayed number?
3. What happens to the display numbers after deletion?
