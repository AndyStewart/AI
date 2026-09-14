---
name: adr
description: Create, refine, supersede, or first assess the need for Architecture Decision Records (ADRs) in a repository. Use when moving from story to implementation planning, when checking whether work requires an ADR, or when Codex needs to add a new ADR, update an ADR set with a superseding decision, choose ADR numbering and file naming, or turn design discussion into a concise in-repo markdown decision record with context, decision, alternatives, and consequences.
---

# ADR

Create short, repository-local Architecture Decision Records in markdown. Keep them brief, decision-first, and easy to diff.

Use this skill in two modes:

- `ADR check`: determine whether the proposed work requires a new ADR and which existing ADRs constrain it.
- `ADR authoring`: create, refine, or supersede an ADR once a decision should be recorded.

## ADR Check First When Planning

When the user is moving from story to implementation planning, first check whether the work affects:

- architecture boundaries
- persistence
- integrations
- public APIs
- domain modelling
- security
- cross-cutting policies

Produce:

## ADR check

ADR required: Yes/No

Reason:
...

Relevant ADRs:
- ...

Rules for the check:

- Prefer `No` unless the work materially changes or creates a lasting design decision.
- Treat changes that cross module boundaries, alter persistence strategy, change external contracts, or introduce new cross-cutting policy as strong ADR candidates.
- Reference the repository's existing ADRs when they already constrain the work.
- If an ADR is required, propose the ADR topic and stop the planning workflow before implementation briefing continues.
- If no current ADRs apply, say so explicitly rather than leaving the section empty.

## Interview First

Before drafting or editing an ADR, interview the user to understand their intent and remove ambiguity.

- Use the ask-questions tool when available. Otherwise ask concise clarifying questions in chat.
- Do not draft until you can state the decision in one sentence and distinguish it from the main rejected alternatives.
- Keep the interview tight. Ask only the smallest set of questions needed to resolve uncertainty.
- If the repository convention answers a question, do not ask the user to restate it.
- If the user already made an explicit choice, reflect it back and only ask about the unresolved parts.
- If ambiguity remains after one round, ask a second focused round instead of guessing.

Treat these as the minimum facts to establish:

- What kind of ADR task this is: new ADR, superseding ADR, or improve an existing draft.
- The decision being made, in one sentence.
- The options that were seriously considered.
- The main forces or constraints behind the choice.
- The consequences the team expects or accepts.
- Whether the user wants a proposed decision, an accepted record, or a draft for review.

Use targeted questions based on the task:

- New ADR: what decision is being made, what alternatives were considered, why this option wins now, and what would cause a revisit.
- Superseding ADR: what changed since the earlier ADR, which old ADR is being replaced, and whether the old file should get a `Superseded By` note.
- Improve draft: what parts are tentative, what ambiguity should be removed, and whether the goal is stronger rationale, clearer trade-offs, or tighter structure.

If the user is unsure, help them choose by presenting short options and the trade-off that differentiates them. Do not invent certainty that the user does not have.

## Workflow

1. Inspect the repository for an existing ADR convention before creating anything.
2. Interview the user to remove ambiguity about the decision, alternatives, status, and intended outcome.
3. Reuse the existing ADR directory, numbering style, and headings if they already exist.
4. If no convention exists, default to `doc/adr/` and monotonic filenames like `0001-short-kebab-case-title.md`.
5. Draft one ADR per file for one decision only.
6. Put the decision and status near the top, then the supporting context and ramifications.
7. Keep the ADR short, usually about one page and rarely more than a couple of pages.

## Default ADR Rules

- Use markdown.
- Use one file per decision.
- Use a monotonic numeric prefix in the filename.
- Use a concise descriptive title in the filename and document heading.
- Use these statuses unless the repository already uses different ones: `proposed`, `accepted`, `superseded`.
- Treat accepted ADRs as historical records. Do not rewrite the original decision because opinions changed later.
- If a decision changes materially, create a new ADR and mark the new one as superseding the earlier one.
- If the repository already cross-links superseded ADRs from the old file, keep any back-link update minimal and explicit rather than rewriting the old rationale.

## Required Content

Include these sections unless the repository already has a stronger house template:

- `Title`
- `Status`
- `Date`
- `Context`
- `Decision`
- `Alternatives Considered`
- `Consequences`

Add these when useful:

- `Confidence`
- `Revisit Triggers`
- `Advice / Consultation`
- `Supersedes`
- `Superseded By`
- `Links`

## Writing Guidance

- Lead with the decision. Use an inverted-pyramid structure.
- Keep the language concrete and specific to the product or ecosystem.
- Summarize the forces and trade-offs that mattered.
- List the serious alternatives that were considered, with brief pros and cons.
- State important consequences explicitly when they are not obvious from the rationale.
- Record uncertainty when it matters. A short confidence statement is enough.
- Mention what would cause the team to revisit the decision.
- Link supporting material instead of embedding long appendices.
- When the user has not fully decided, write the uncertainty plainly instead of smoothing it over.

If the task started as an `ADR check`, carry the check result forward into any drafted ADR so the rationale is traceable.

## Tasks

### Create a new ADR

1. Confirm the decision, top alternatives, forces, consequences, and target status with the user.
2. Find the ADR directory and highest existing sequence number.
3. Infer the next filename.
4. Draft the ADR using [assets/adr-template.md](assets/adr-template.md).
5. Fill the template with repository-specific facts from the task at hand.
6. Keep the first paragraphs self-contained so a directory listing plus quick preview is useful.

### Supersede an ADR

1. Confirm which earlier ADR is being superseded, what changed, and the scope of the replacement decision.
2. Read the existing ADR and preserve its historical wording.
3. Create a new ADR with a new sequence number.
4. Explain what changed and why the prior decision no longer fits.
5. Add `Supersedes` in the new ADR.
6. Only add a `Superseded By` note to the old ADR if the repository already follows that pattern or the user explicitly asks for it.

### Improve a draft ADR

1. Confirm whether the goal is to clarify the decision, tighten the structure, strengthen the rationale, or remove ambiguity.
2. Tighten the title so it names the decision, not the meeting topic.
3. Move the actual decision above detailed background.
4. Cut filler, duplication, and implementation details that belong elsewhere.
5. Make trade-offs and consequences explicit.
6. Check that the ADR still covers exactly one decision.

## Ambiguity Checks

Before finishing, verify that the ADR answers these questions without hand-waving:

- What was decided?
- Why now?
- Compared to which alternatives?
- Under which constraints or assumptions?
- With which expected downsides or follow-up consequences?

If any answer is vague, go back to the user with a targeted question instead of filling the gap yourself.

## Resources

- Use [references/fowler-adr-notes.md](references/fowler-adr-notes.md) for the distilled conventions from Martin Fowler's ADR article.
- Use [assets/adr-template.md](assets/adr-template.md) as the default markdown starting point when no repository-specific template exists.
