---
name: story-writing
description: Shape rough product ideas into product-ready epics and small linked child stories, document durable product decisions, and optionally hand approved stories to the project tracker. Use for idea exploration, backlog shaping, vertical slicing, or approved story handoff.
---

# Story Writing

Help the user turn a rough idea into a usable initial backlog. Use idea-generation questions to explore the product opportunity, then write an epic with Card and Conversation and small, user-facing child stories with Card, Conversation, and Confirmation. The child-story cards are the product agreement; the epic captures the shared outcome, boundaries, and hierarchy without duplicating child-story Confirmation criteria.

The story set should be product-ready: another person should be able to begin design or implementation without asking further product-requirements questions. Open discussion after approval should be about technical design, implementation approach, test strategy, or delivery sequencing, not what users should experience or what behavior is in scope.

This skill produces product story output, product vision documentation updates, and tracker story items only. Do not move into design, contracts, implementation planning, ADRs, or code until the user has approved the story set and explicitly changes the workflow move.

## Product Context

Before interviewing or slicing stories, discover the target repository's authoritative product direction and relevant domain guidance. Use those principles to shape questions and challenge scope. Do not treat product direction as implemented capability or as a source of MVP scope; ask for current-state assumptions when they matter. If no product direction is documented, make the gap visible and use the user's stated intent as the source of product scope.

## Product Assumption Discipline

Story writing is an interview workflow. Do not turn inferred answers into story content, tracker updates, readiness-field changes, or approval notes unless the user has explicitly confirmed them.

- Treat existing code, previous tracker item text, comments, tests, and local investigation as context for better questions, not as authority for unresolved product behavior.
- When an item has open product questions, ask the user to answer them before setting any tracker readiness or review fields, clearing an information-needed state, or updating Confirmation criteria.
- If local context suggests a likely answer, present it as an option or recommendation and explain the evidence, then wait for the user's decision.
- Do not silently convert a recommendation, implementation convenience, existing code shape, or plausible default into an accepted product assumption.
- If the user asks to "answer questions" or "make stories ready", first list the blocking product questions and ask them; only update the tracker after the user answers or explicitly accepts named assumptions.
- If an item was updated from an unconfirmed assumption, correct its state and add a comment explaining that the prior update was not an approved product decision.

## Core Workflow

1. Product context - discover the repository's authoritative product direction and identify the principles relevant to the idea.
2. Idea generation - explore the opportunity, users, outcomes, candidate workflows, risks, constraints, and non-goals before settling on a story shape.
3. Scope summary - restate the feature idea, the intended user value, and the important assumptions.
4. Epic card - write one parent epic as Card and Conversation to capture the overall outcome and boundaries; keep observable Confirmation criteria on the child stories.
5. Story slicing - split the epic into small, ordered, independently valuable child stories, each also written only as Card, Conversation, Confirmation.
6. Dependency mapping - identify sequencing dependencies between child stories and challenge any dependency that is really an implementation preference.
7. Product requirements readiness check - identify unresolved product questions that would block design or implementation; ask the user to decide them, narrow scope, or explicitly accept a named assumption before approval.
8. Product decision check - identify any major product decisions made during exploration that affect the product's long-term vision, principles, user promise, or future story boundaries.
9. INVEST review - run an independent subagent to review the draft epic and child stories against INVEST and product-readiness, then suggest improvements.
10. Story refinement - present the INVEST suggestions as optional improvements, apply only the changes the user accepts or that are clearly aligned with the story intent, and avoid treating INVEST as a hard gate.
11. User approval - ask the user to approve the epic, child stories, dependency map, explicit assumptions, and any proposed product-direction updates.
12. Product documentation - after approval, update the repository's authoritative product-direction document when major product decisions clarify or change the long-term vision.
13. Tracker handoff - when approved and the user has agreed on a tracker, create the parent and child items using that tracker's discovered hierarchy, classifications, links, and workflow conventions.
14. Close-out - present the approved hierarchy, dependency links, product-direction changes, and created item identifiers or URLs.

## Interview Rules

- Ask only the next useful questions, usually 3-6 at a time.
- Start with idea-generation questions when the feature is rough: ask what user problem is worth solving, what moments should feel different, what decisions or interactions might emerge, and what the smallest valuable version could be.
- Prefer concrete questions about users, workflow, permissions, data, integrations, failure cases, and release constraints.
- Keep interviewing until each story's Conversation can explain the user-facing product behavior well enough for another person to begin design or implementation without asking further product-requirements questions.
- Prefer scenario questions: ask what happens before, during, and after the user action; what information is available; what decisions are made; and what changes as a result.
- If the user provides only a technical task, interview for the user-facing goal before writing stories.
- Name assumptions explicitly when the user chooses not to answer a product detail, and do not approve or hand off a story with unresolved product questions unless the assumption is visible in Conversation, Confirmation, or the tracker item's WIP section.
- Ask for explicit confirmation before treating a named assumption as accepted. Phrases like "this seems likely", "the code already does this", or "I recommend" are not approval.
- Push back when the idea is still an implementation task rather than user-facing value.
- Push back when the idea conflicts with the documented product direction or adds complexity, friction, or scope without improving the intended user outcome.
- Notice durable product choices as they emerge. If the user makes a decision that would guide future feature choices, constrain the product promise, define a lasting product principle, or reject a plausible product direction, flag it as a candidate product decision.

Cover only the areas needed to avoid inventing scope: target user, current pain, desired outcome, first usable version, non-goals, permissions, data, integrations, failure handling, rollout constraints, and dependency assumptions.

Product requirements are ready when the remaining unknowns are technical rather than product-facing. Before approval, check that each story answers:

- who can perform the behavior and who is affected
- what triggers the behavior and what observable result follows
- which user-visible states, rules, calculations, limits, and validations matter
- what feedback, timing, result, or record the user can observe
- what failure, edge, or permission cases must be handled for the story to be usable
- what is intentionally out of scope
- which assumptions are accepted and which decisions remain for technical design

## Conversation Detail

Treat Conversation as the shared understanding captured from the interview, not a placeholder. It should be detailed enough that the problem, product behavior, boundaries, assumptions, and key decisions are clear before implementation starts.

For each story, include concise bullets covering the relevant subset of:

- problem context: why this story matters and what pain it removes
- actors and permissions: who can do it, who cannot, and who is affected
- workflow: what happens before, during, and after the story's main action
- data and rules: important inputs, outputs, states, calculations, validations, or business constraints
- examples: representative happy-path data or cases when they clarify behavior
- boundaries: what is intentionally out of scope for this story
- dependencies and assumptions: external systems, existing capabilities, ordering, or accepted product assumptions
- failure and edge behavior: only the cases needed for the story to be usable or safely shippable

Do not leave product behavior hidden behind vague phrases such as "works as expected", "handles edge cases", "uses the existing flow", or "shows the right result" unless the relevant expectation is already clear elsewhere in the story.

Do not turn Conversation into technical design. Avoid prescribing tables, endpoints, classes, components, services, queues, or implementation phases unless the user explicitly asks for technical stories.

## Story Rules

- Default to many small stories rather than a few large ones.
- Each story must deliver observable user value across the stack.
- Keep each story independently shippable where possible.
- Avoid UI-only, API-only, database-only, or refactor-only stories unless the user explicitly asks for technical tasks.
- Order stories by the thinnest path to useful progress.
- Prefer a narrow happy path before edge cases, admin controls, reporting, automation, or optimization.
- If a story is too large, narrow the audience, entry point, supported scenario, output, data set, or failure mode.
- Include dependencies only when one story cannot deliver its user outcome until another story exists. Do not record implementation order, refactoring order, or convenience as a product dependency.

## Epic And Dependency Shape

Create one parent epic for the overall idea. The epic is a Card and Conversation outcome container, not a project plan and not a duplicate acceptance-test card. Use it to preserve the user-facing goal, scope boundaries, and the child-story hierarchy. Put observable Confirmation criteria on the child stories, where they can map directly to independently valuable slices.

Create child stories as vertical slices under the epic. Each child story must be small enough to implement independently, but it may depend on another child story when the user-facing behavior would otherwise be impossible or incoherent.

After slicing, include a dependency map:

- `Story A -> Story B` means Story B depends on Story A.
- Prefer no dependency when two stories can ship independently.
- Explain each dependency in one short product-facing sentence.
- If dependencies form a chain longer than needed, reslice the stories or challenge the scope.
- Do not use dependency links to describe technical sequencing.

## Product Vision Documentation

During story exploration, separate story content from durable product decisions. Child stories should remain C/C/C cards; epics should remain concise Card-and-Conversation outcome containers. Product decisions that affect the product's long-term direction should be recorded in the repository's authoritative product documentation so they do not live only in the conversation or a tracker item.

Update the discovered product-direction document when exploration produces a decision that:

- changes or clarifies the user promise, product principles, or long-term vision
- establishes a lasting product rule that future stories should respect
- chooses between materially different product directions
- defines a non-goal that prevents future scope drift
- changes the expected user, social, strategic, accessibility, or operational experience

Follow the repository's established location for durable product decisions; avoid creating a competing decision log. If no location exists, propose one as part of the documentation update for approval. Do not update product documentation for ordinary story details, implementation choices, temporary assumptions, unresolved options, or acceptance criteria. Keep those in the C/C/C story or tracker item.

Follow the repository's ADR process when the decision is architectural, technical, or implementation-policy rather than product-facing; use an available `adr` skill when appropriate.

When proposing product-direction changes, keep them concise and product-focused. Explain the user-facing choice and how it shapes future story exploration, without implementation details, delivery plans, architecture, technical trade-offs, item links, or test strategy.

## INVEST Review

Before asking for final approval, run an independent subagent to review the draft epic, child stories, and dependency map. Ask the subagent for improvement suggestions using INVEST as a heuristic, not as a compliance checklist:

- Independent: can the story deliver useful value without unnecessary coupling to other stories?
- Negotiable: does the story leave room for product conversation rather than locking in a design or implementation?
- Valuable: is the user value observable and worth shipping?
- Estimatable: is the story clear enough that its size and risk could be discussed without rediscovering product requirements?
- Small: is the story narrow enough for a thin, vertical delivery slice?
- Testable: are the Confirmation criteria specific and observable enough to verify?

Keep the review independent: give the subagent the story set, dependency map, and relevant product principles, but ask it to challenge unclear value, unresolved product questions, oversized stories, unnecessary dependencies, weak Confirmation criteria, vague accepted assumptions, and hidden implementation tasks.

Treat the output as advisory. Present the suggestions separately from the story cards, explain which suggestions you recommend accepting, and keep any rejected suggestion visible when it reflects a real trade-off. Do not rewrite approved story intent just to satisfy INVEST, and do not let the review add implementation details.

## XP Story Shape

Use Card and Conversation for the epic, and Card, Conversation, and Confirmation for every child story. Do not add parent links, dependency links, design, implementation plan, architecture notes, test plan, estimates, task lists, or WIP sections to the approved story cards. Put hierarchy and dependencies in a separate dependency map or tracker metadata, not inside the story cards.

```md
## Epic: <short outcome title>

Card

As a <user>, I want <capability> so that <outcome>.

Conversation

- <problem context, workflow detail, rule, example, boundary, assumption, or dependency>
- <enough detail to understand the behavior without prescribing implementation design>
- <what is intentionally out of scope, if useful>

## Story <n>: <short outcome title>

Card

As a <user>, I want <capability> so that <outcome>.

Conversation

- <problem context, workflow detail, rule, example, boundary, assumption, or dependency>
- <enough detail to understand the behavior without prescribing implementation design>
- <what is intentionally out of scope, if useful>

Confirmation

1. Given <context>, when <action>, then <observable result>.
2. Given <context>, when <action>, then <observable result>.
3. Given <context>, when <action>, then <observable result>.
```

Keep the Card concise and outcome-focused. Make Conversation specific enough to preserve the interview context and product decisions, but concise enough to remain readable. Use 2-4 Confirmation criteria per child story by default. Make every child-story Confirmation criterion testable, user-observable, and specific enough that no further product decision is required to judge whether it passed.

## Output

When the story set is approved, provide:

- feature summary
- assumptions
- approved parent epic using Card and Conversation
- approved ordered child stories using Card, Conversation, Confirmation
- dependency map between child stories
- explicit accepted assumptions and remaining technical-only questions
- product-direction documentation updates created, if any
- user approval note
- tracker handoff result, when requested or when the tracker is the agreed WIP system
- recommended next step: start design or implementation for the first story only

## Tracker Handoff

Keep story writing and WIP tracking distinct. The approved story is the stable product agreement; the tracker item is the mutable execution ledger.

When the user wants tracker items for WIP, first discover the tracker's conventions and create the approved hierarchy using its supported equivalent of:

- one parent epic item containing the epic Card and Conversation plus metadata for child stories
- one child item per approved story containing metadata for its parent and dependencies, followed by the story C/C/C card
- links from the parent to every child, from each child back to the parent, and from each dependent child to its dependencies
- the tracker's corresponding parent and child classifications

Preserve the XP story content exactly where practical. Use the tracker's established classifications for backlog type. Track active work in the child story's WIP section and item comments when that is the repository's convention. If the next workflow move is not implementation yet, do not add WIP sections to every item.

Use the tracker's workflow fields, states, and classifications according to discovered repository conventions. Do not invent field values or substitute labels for structured workflow fields. If the required tracker conventions or capabilities are unavailable, report the blocker and the intended mapping rather than silently changing the story state.

Use this parent epic item shape, adapted to the tracker's syntax:

```md
## Epic: <short outcome title>

### Card

As a <user>, I want <capability> so that <outcome>.

### Conversation

- <problem context, workflow detail, rule, example, boundary, assumption, or dependency>

## Child Stories

- <tracker-item-reference> - <child story title>
```

Use this child story item shape:

```md
## Story: <short outcome title>

Parent Epic

- <epic-item-reference> - <epic title>

Dependencies

- <dependency-item-reference> - <dependency title>: <why this story depends on it>
- None

### Card

As a <user>, I want <capability> so that <outcome>.

### Conversation

- <problem context, workflow detail, rule, example, boundary, assumption, or dependency>

### Confirmation

1. Given <context>, when <action>, then <observable result>.
2. Given <context>, when <action>, then <observable result>.
```

When a child story becomes the active workflow item, add or update its WIP section:

```md
## WIP

### Current Slice

### Test Plan
- Acceptance:
- Unit:

### Decisions / Assumptions

### Open Questions

### Next Small Move

### Codex Notes
```

Use tracker comments or activity history for decision history and progress notes when supported. Link implementation work to the item using the repository's convention, and close it only when the story's Confirmation criteria are satisfied.

## Calibration

- Treat this as an interview and story-writing workflow, not a brainstorming dump.
- Use brainstorming only to generate sharper product options, then converge into C/C/C cards.
- Treat major product decisions as possible product-direction documentation updates, not as extra story sections or separate decision logs.
- Prefer small, independent, deliverable stories over comprehensive phase plans.
- Push back on stories that are really architecture layers or implementation tasks.
- Keep the final story set concise enough to use as a backlog.
- Hand off one approved child story at a time for later design or implementation.
