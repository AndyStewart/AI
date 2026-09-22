---
name: implement-issue
description: "Use when implementing a tracked issue or story from its technical design, with per-criterion test-first delivery, acceptance evidence, and independent review."
---

# Implement Issue

## Required invocation

Use this skill before beginning implementation requested through a tracked issue or story, including requests phrased as "implement issue #…", "build this story", or a tracker link.

Treat the approved technical design as the implementation contract. Deliver the story one acceptance criterion at a time, proving each criterion through the system's modular boundary and then through an end-to-end acceptance test.

## Authority and readiness

- The story and its acceptance criteria define the required user-visible outcomes.
- The approved technical design defines the intended implementation flow and module contracts.
- Accepted ADRs and repository guidance define architectural constraints.

Do not silently choose between conflicting sources. Stop for resolution when a conflict would change behaviour, a public contract, or an architectural decision.

An explicit request to implement the story authorizes creating a missing technical design and then continuing. Use `technical-design` to do so. Pause only when design work exposes an unresolved product or architectural decision that requires the user's choice.

## Implementation workflow

1. Read the story, every acceptance criterion, any parent epic or linked requirements, and the technical design. Inspect the current code, tests, and recent history for existing delivery. If the tracker is unavailable, say so and use the repository evidence that is available.
2. Identify the important module entry point through which the behaviour should enter the system, such as an API endpoint, command handler, UI interaction, or public application service. Order the acceptance criteria according to the designed flow; keep only one criterion active at a time.
3. Maintain a concise evidence ledger for each criterion: the design contract and entry point, focused test, red result when applicable, green result, acceptance test, full-build result, and any deviation or risk. Reuse existing evidence rather than duplicating tests.
4. Before adding behaviour, assess whether the smallest focused pre-refactor would materially reduce risk or make the design easier to implement and verify. Do not refactor speculatively. When a pre-refactor is justified:
   - Run the existing relevant tests and full build to establish a baseline.
   - Make a separate behaviour-preserving change that adds no feature or capability and changes no public contract.
   - Run the same tests and full build, then review the refactor diff before feature work begins.
5. Implement one acceptance criterion:
   - First inspect whether the behaviour and suitable tests already exist. If an existing focused or acceptance test already proves the criterion at the required layer, run and reuse it; do not add a duplicate test.
   - If the behaviour already exists but its evidence is incomplete, add only the missing test coverage. Do not manufacture a failing test or temporarily break working code merely to produce a red result.
   - If behaviour is missing, write the narrowest fast automated test through the module's public contract. Default to a unit test; use a component or contract test when that is the natural boundary and record why. Run it and confirm that it fails for the intended missing behaviour.
   - Implement the smallest design-conforming change that makes the focused test pass, then run it again and confirm it passes.
   - Run an existing end-to-end acceptance test through the real user-facing entry point, extending the closest test or adding one only when no existing test proves the criterion.
   - Run the full build. A criterion is complete only when its focused test, acceptance test, and full build all pass and the evidence ledger records the results.
6. Review the criterion's diff against the story and technical design before starting the next criterion. For UI work, capture and inspect the required desktop and mobile evidence. Repeat until every criterion is proven.

## Final review and completion

After all criteria pass, launch two read-only review agents independently and, when possible, in parallel. Give both the story, technical design, final diff, and evidence ledger. Ask them to return findings with severity, location, evidence, and a recommended correction.

- **Code-quality review:** compare the change with surrounding repository conventions; identify style inconsistencies, poor readability/use of domain language, code smells, data clumps, primitive obsession, avoidable complexity, and maintainability problems.
- **Design-conformance review:** compare the story, technical design, implementation, and evidence; identify missed criteria, design departures, incorrect flow, and unproven requirements.

If delegation is genuinely unavailable, perform two distinct fresh self-review passes with those scopes and disclose the fallback.

Assess every finding rather than applying it mechanically. Send missed or incorrectly implemented criteria back through the criterion-level test-first workflow. After justified fixes, rerun the affected focused and acceptance tests, the full build, and the repository's complete final validation gate.

Do not report completion unless every acceptance criterion has recorded evidence, both reviews have been resolved, final validation passes, and any necessary design departure is explained and recorded in the technical design when authorized. Preserve unrelated working-tree changes. Do not commit, push, merge, or make external tracker changes unless the user has authorized them.

Use specialist skills already available in the repository when applicable: `technical-design` to create or revise the implementation contract, `git-commit-safety` before commits, and `adr` when the work changes an architectural decision.
