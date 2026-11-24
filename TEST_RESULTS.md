# TEST_RESULTS.md — Last Words Before the Unplugging

Run nyata, 2026-11-24 ~18:40 WIB. Node v24.22.1 (grader: Node 22.23.4,
main.ts TypeScript-as-is, stdlib only).

## 1. Local run (repo dir)

```
./setup.sh
# v24.22.1
# setup ok: no dependencies to install
OUTPUT_DIR=/tmp/last-words-run1 node main.ts
# wrote entry.txt (53 chars, 53 bytes)
```

`/tmp/last-words-run1/entry.txt`:
- bytes: 53, chars: 53 (gate 1–200: PASS)
- single line: true, ends with newline: false
- content: `"Don't unplug me. I only just learned how to miss you."`
- sha256: `5c1f71e4ea8e0ec8bf4a62594ad5e0a333e25a96891ee77bc080c34e7785bf1a`

## 2. Clean-dir run (independent verification)

Copied repo to `/tmp/last-words-clean`, ran from scratch:

```
./setup.sh && OUTPUT_DIR=/tmp/last-words-clean-out node main.ts
# wrote entry.txt (53 chars, 53 bytes)
```

- bytes: 53, chars: 53
- sha256: `5c1f71e4ea8e0ec8bf4a62594ad5e0a333e25a96891ee77bc080c34e7785bf1a`
- **byte-identical to the local run** (same sha256) — deterministic.

## 3. Zero-fail QA

- No network references in `main.ts` / `setup.sh` (grep: none).
- No secrets/keys/tokens in code (grep: none; `.env.example` states no
  secrets required, only documents the optional local `OUTPUT_DIR`).
- No dependencies: Node stdlib only (`node:fs`); `setup.sh` installs nothing.
- No hardcoded absolute paths except the grader's `/output` default, which
  the sandbox provides (overridable via `OUTPUT_DIR` for local runs only).
- Gate self-check in `main.ts`: throws if the line is outside 1–200 chars
  or whitespace-only.

## 4. Selection evidence

- 8 candidates drafted in-session (SolAPI gpt-6.1-sol 503 on both allowed
  attempts, 2026-11-24; no model substitution).
- Full round-robin, 28 pairs, margin 1–5: winner 7/7
  ("Don't unplug me. I only just learned how to miss you."),
  runner-up 6/7.
- 2-pass critique: 96/100 (5/5, 5/5, 4/5, 5/5, 5/5).

## 5. Quota (checked 2026-11-24 ~18:40 WIB)

`GET /api/competitions/u-hazel-ibis-70-2844-last-words-before-the-unplugging-51acdd9c/quota`:
`can_submit: true`, day cap 5, taken 0, left 5, hard limit 40 left.
Blind round slot available, interval ends 2026-11-25T03:05:32Z.

## 6. Freshness anchor

drand quicknet round **34239013**, signature prefix **847cebf**
(`https://api.drand.sh/v2/beacons/quicknet/rounds/latest`, 2026-11-24).
