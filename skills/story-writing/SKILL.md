---
name: story-writing
description: Turn rough product ideas into product-ready epics and small linked child stories, including deployable-boundary decisions and approved tracker handoff. Use for idea exploration, backlog shaping, story slicing, or approved story handoff.
---

# Story Writing

Turn a rough product idea into a usable, product-ready backlog: one epic and small child stories using Card, Confirmation, and Conversation. The story set is the product agreement. It must let someone begin design or implementation without rediscovering product requirements.

This skill produces product stories, durable product-direction updates, and—only when requested—tracker items. Do not move into design, contracts, implementation planning, ADRs, or code until the user approves the story set and explicitly changes the workflow.

## Workflow

1. Discover the repository's authoritative product direction and relevant domain guidance. Use it to shape questions, but do not treat it as implemented capability or MVP scope. If none exists, surface the gap and use the user's stated intent as the source of product scope.
2. Interview to understand users, outcomes, workflows, constraints, and non-goals before choosing a story shape.
3. Summarize the intended user value, deployable unit, scope boundaries, and explicit assumptions.
4. Draft the epic, ordered child stories, and a product-facing dependency map.
5. Identify durable product decisions and propose any necessary product-direction documentation updates.
6. Before seeking approval, obtain at least one independent subagent review when delegation is available and authorized. If it is unavailable, continue but state that the independent review was unavailable.
7. Present review suggestions separately; apply only changes the user accepts or that plainly preserve the agreed story intent.
8. Obtain approval for the stories, dependencies, assumptions, and proposed product-direction updates. Only then update documentation or create tracker items.

## Product Assumptions And Interview

Treat existing code, tracker text, comments, tests, and local investigation as context for better questions—not authority for unresolved product behavior. Never turn an inference, implementation convenience, or plausible default into a story, tracker update, or accepted assumption without explicit user confirmation.

Ask only the next useful questions, normally 3–6 at a time. Cover the relevant subset of: target user and pain; desired outcome; first usable version and non-goals; permissions; data and integrations; failure cases; rollout constraints; and dependencies. Prefer concrete scenario questions about what happens before, during, and after an action.

Product requirements are ready when the remaining unknowns are technical rather than product-facing. Before approval, each story must make clear:

- who acts and who is affected;
- the trigger and observable outcome;
- user-visible rules, states, validations, limits, or calculations;
- required feedback, timing, and records;
- material failure, edge, and permission behavior;
- what is deliberately out of scope; and
- accepted assumptions and technical-only questions.

If the user declines to decide a product detail, name the assumption and obtain explicit confirmation before approval or handoff. “This seems likely,” existing code, or a recommendation is not confirmation.

## Story Shape

Use Card, Confirmation, and Conversation for the epic and every child, in that order. Keep hierarchy and dependencies outside approved cards, in a dependency map or tracker metadata.

```md
## Epic: <short outcome title>

Card

As a <user>, I want <capability> so that <outcome>.

Confirmation

1. Given <context>, when <action>, then <observable result>.

Conversation

- <shared outcome, boundary, assumption, or decision>

## Story <n>: <short outcome title>

Card

As a <user>, I want <capability> so that <outcome>.

Confirmation

1. Given <context>, when <action>, then <observable result>.
2. Given <context>, when <action>, then <observable result>.

Conversation

- <relevant context, actors, workflow, rules, example, boundary, dependency, or accepted assumption>
```

Keep Cards concise and outcome-focused. Conversation is the shared product understanding: include only the relevant problem context, actors and permissions, workflow, data and rules, boundaries, accepted assumptions, dependencies, and material edge behavior. Do not hide behavior behind “works as expected” or prescribe tables, endpoints, components, services, queues, or implementation phases.

Use 2–4 Confirmation criteria per child by default. Every criterion must be specific, user-observable, and testable without a further product decision.

## Slicing And Dependencies

- Size every child story so one person or agent can take it from a fresh context window through the required design clarification, implementation, review, and relevant validation. Split it if it would require handing accumulated working context to a new window.
- Default to small, vertical stories that deliver observable user value. Do not write UI-only, API-only, database-only, refactor-only, or architecture-layer stories unless the user explicitly asks for technical work.
- Choose the deployable unit before proposing children. Prefer independently deployable children where that creates coherent, balanced releases. Use the epic as the deployable unit when partial workflow releases would be incoherent, misleading, or unusable.
- When the epic is the deployable unit, each child must still be independently understandable, implementable, demonstrable, and testable through a bounded user-observable behavior or state transition.
- Balance slices by product behavior, complexity, and uncertainty. Do not front-load the complete workflow, invent artificial reduced behavior, or leave later children as minor variants.
- Order stories by the thinnest path to useful progress within the chosen deployable unit. Prefer a narrow happy path before edge cases, administration, reporting, automation, or optimisation.
- When a story exceeds one fresh context window, narrow its audience, entry point, supported scenario, output, data set, or failure mode; make the remaining behavior a later story.
- Include `Story A -> Story B` only when B's user-facing behavior requires a product state or action established by A. Explain each dependency in one short product-facing sentence; never use dependencies for technical sequencing or convenience.

State the deployable unit and its rationale in the scope summary. If child- and epic-level deployment are both plausible, present the trade-off rather than silently choosing one.

## Product Direction

Keep durable product decisions separate from story cards. After approval, update the repository's authoritative product-direction document when exploration changes or clarifies the user promise, product principles, long-term vision, a lasting product rule, a material product direction, or a non-goal that prevents scope drift.

Do not document ordinary story details, temporary assumptions, unresolved options, acceptance criteria, or implementation choices as product direction. If a decision is architectural, technical, or implementation-policy, flag it for the repository's ADR workflow; do not author an ADR as part of this skill.

## Independent Review

Before approval, request an independent subagent review when it can run. Give it the draft story set, dependency map, deployable boundary, and relevant product principles. Ask it to assess INVEST as a heuristic, not a compliance gate:

- **Independent:** coupling has product meaning or is avoided.
- **Negotiable:** product intent is clear without prescribing a design.
- **Valuable:** the outcome is observable and worth shipping.
- **Estimatable:** product requirements do not need rediscovery.
- **Small:** one fresh context window can complete the vertical slice and relevant validation.
- **Testable:** Confirmation criteria are specific and observable.

Ask it to challenge unclear value, unresolved questions, unbalanced or oversized stories, unnecessary dependencies, weak Confirmation criteria, vague assumptions, and hidden implementation tasks. Treat its findings as advisory and retain visible rejected suggestions when they expose a real trade-off.

## Approval And Handoff

When the story set is approved, provide the feature summary; deployable-unit rationale; accepted assumptions and technical-only questions; epic; ordered child stories; dependency map; product-direction updates; and the next recommended step for the first child only.

Only perform tracker handoff when the user requests it or an agreed tracker is the WIP system. Then read [references/tracker-handoff.md](references/tracker-handoff.md) before creating or updating tracker items.

## Calibration

- Treat this as an interview and story-writing workflow, not a brainstorming dump.
- Push back on scope that conflicts with product direction or does not improve the intended user outcome.
- Keep approved stories concise enough to use as a backlog.
- Hand off one approved child story at a time for later design or implementation.
