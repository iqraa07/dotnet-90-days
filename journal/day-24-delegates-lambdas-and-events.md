# Day 24: Delegates, Lambdas and Events

- **Started:** 2026-11-17
- **Updated:** 2026-11-17
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-24-delegates-lambdas-and-events)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Use delegates and lambdas to describe a ticket, send a notification, and select open tickets. Raise creation and closure events, then append the closure details to a file.

## Work completed

- [x] Used `Func`, `Action`, and `Predicate` delegates with lambdas.
- [x] Raised `TicketCreated` and `TicketClosed` with immutable ticket snapshots.
- [x] Connected creation to a console notifier and closure to a JSONL append.
- [x] Handled invalid commands, missing tickets, repeated closure, and log-write errors.
- [x] Built Release with 0 warnings and 0 errors and passed all 13 verification groups.
- [x] Exported and inspected landscape and portrait images from the sample run.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->

## Study notes

The event publisher updates ticket state before invoking subscribers. A successful closure subscriber appends the ticket ID, subject, and UTC time before printing its success message. If writing fails, the ticket stays closed and the program exits with code 1 after reporting the failure.

## Understanding check

1. Which delegates return a value, and which delegate sends the console notification?
2. How do the event arguments let a subscriber read the ticket state that triggered the event?
3. Why can a ticket be closed even when its log write fails?

## Evidence

[Daily overview](../days/day-24/README.md) · [Run transcript](../assets/progress/day-24-output.txt) · [CLI checks](../assets/progress/day-24-checks.txt)

## Next session

Try creating and closing two tickets, then inspect their JSONL entries. Day 25 covers asynchronous programming with `HttpClient`.
