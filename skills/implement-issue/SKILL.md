---
name: implement-issue
description: "Use when implementing a tracked issue or story as validated, end-to-end vertical slices."
---

# Implement Issue

## Required invocation

Use this skill before beginning any implementation requested through a tracked issue or story, including requests phrased as "implement issue #…", "build this story", or a tracker link. Do not begin code changes until you have read the issue and established the first vertical slice below.

Deliver the requested issue in independently useful, reviewable increments.

1. Read the issue and, when present, its parent epic or linked requirements. Check the current code, tests, and recent history so the plan does not repeat work already delivered. If the tracker is unavailable, say so and ground the plan in repository evidence.
2. State a brief vertical-slice plan before editing. Each slice should deliver observable behaviour, have focused tests, and avoid speculative future capabilities. Call out any product decision that blocks safe implementation.
3. Implement only the first slice. Follow the repository's governing architecture, product, design, and testing guidance. Preserve unrelated working-tree changes.
4. Run the smallest relevant validation, review the slice diff against the issue, and report any limitation. For UI work, capture and inspect the required desktop and mobile evidence.
5. Commit that slice with a focused message only after validation and review. Do not commit, push, merge, or make external tracker changes unless the user has authorized them.
6. Continue one slice at a time until the issue acceptance criteria are met or user input is genuinely needed. Finish with the repository-required final validation and an independent review when the change is substantial.

Use specialist skills already available in the repository when applicable: `technical-design` for a requested contract-first design, `git-commit-safety` before commits, and `adr` when the work changes an architectural decision.
