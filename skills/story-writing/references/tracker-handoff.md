# Tracker Handoff

Read this reference only after the story set is approved and the user requests tracker handoff, or has agreed that a tracker is the WIP system.

The approved story is the stable product agreement; the tracker item is the mutable execution ledger. First discover the tracker's hierarchy, classifications, workflow fields, linking conventions, and WIP format. Do not invent values or silently substitute labels for structured fields.

Create the tracker's equivalent of:

- one parent epic item containing the epic Card, Confirmation, and Conversation plus child-story metadata;
- one child item per approved story containing parent and dependency metadata, followed by the Card, Confirmation, Conversation card;
- parent-to-child, child-to-parent, and dependency links; and
- the established epic and child classifications.

Preserve the approved XP story content exactly where practical. Report the blocker and intended mapping when the tracker lacks a required convention or capability. Do not add WIP sections before a child becomes active when the next workflow move is not implementation.

## Parent Item Shape

```md
## Epic: <short outcome title>

### Card

As a <user>, I want <capability> so that <outcome>.

### Confirmation

1. Given <context>, when <action>, then <observable result>.

### Conversation

- <shared product context, rule, boundary, or accepted assumption>

## Child Stories

- <tracker-item-reference> - <child story title>
```

## Child Item Shape

```md
## Story: <short outcome title>

Parent Epic

- <epic-item-reference> - <epic title>

Dependencies

- <dependency-item-reference> - <dependency title>: <product-facing reason>
- None

### Card

As a <user>, I want <capability> so that <outcome>.

### Confirmation

1. Given <context>, when <action>, then <observable result>.
2. Given <context>, when <action>, then <observable result>.

### Conversation

- <relevant product context, workflow, rule, boundary, or accepted assumption>
```

## Active WIP

When a child becomes active, use the repository's established WIP convention. If no format exists, use:

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

Use comments or activity history for progress and decision history when supported. Link implementation work according to repository convention, and close a child only when its Confirmation criteria are satisfied. If the epic is the deployable unit, a completed child means its bounded behavior is confirmed, not that the partial workflow should be released; leave the epic open until all required behavior is complete.
