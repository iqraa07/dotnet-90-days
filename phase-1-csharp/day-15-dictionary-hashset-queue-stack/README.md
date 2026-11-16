# Day 15: Dictionary, HashSet, Queue, Stack

Queue helpdesk tickets in arrival order, count waiting work by category, and list resolved tickets in reverse order.

## Run

From the repository root in PowerShell:

```powershell
dotnet build .\phase-1-csharp\day-15-dictionary-hashset-queue-stack -c Release
@('add|1|Network|Wi-Fi drops', 'add|2|Network|VPN offline', 'counts', 'next', 'history', 'quit') | dotnet run --project .\phase-1-csharp\day-15-dictionary-hashset-queue-stack -c Release --no-build
```

The sample queues two Network tickets, reports `Network: 2`, resolves ticket 1, and lists that ticket in resolution history.

## How it works

The queue determines which ticket comes next. The hash set tracks IDs already used in the session, the dictionary groups waiting tickets by category, and the stack keeps the most recent resolution first.

| Command | Example |
|---|---|
| Queue a ticket | `add\|1\|Network\|Wi-Fi drops` |
| Resolve the oldest waiting ticket | `next` |
| Count waiting tickets by category | `counts` |
| List resolutions, newest first | `history` |
| Exit | `quit` |

Use a unique positive integer ID. IDs stay reserved after resolution. The category count treats `Network` and `network` as the same category and changes when tickets leave the queue. Queue and stack operations are usually constant time. Hash-based set and dictionary lookups are typically constant time, while building the counts still visits every waiting ticket.

## Verification

The Release build passed with 0 warnings and 0 errors. The four checks cover category counts, first-in first-out resolution, most-recent-first history, duplicate IDs, invalid commands, and empty states.

[CLI checks](../../assets/progress/day-15-checks.txt) · [Run transcript](../../assets/progress/day-15-output.txt) · [Daily overview](../../days/day-15/README.md) · [Journal](../../journal/day-15-dictionary-hashset-queue-stack.md)
