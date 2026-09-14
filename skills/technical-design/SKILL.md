---
name: technical-design
description: Write or revise contracts-first technical designs for approved requirements. Use for technical implementation proposals, not product discovery or ADR authoring.
---

# Technical Design

Create a design that lets consumers and implementers understand their contracts,
invariants, and responsibilities without extracting rules from long prose.

Use the target repository's agent guidance to locate relevant design conventions,
architecture decisions, and product requirements. Follow its established template
when one exists; read only material relevant to the proposed capability. If there
is no convention, organize the design around boundaries, contracts, invariants,
delivery slices, evidence, and unresolved decisions, omitting irrelevant sections.

Before drafting, assess whether the proposal materially changes an architectural
boundary, persistence strategy, durable public contract, or cross-cutting policy.
Follow the repository's ADR process for such decisions; use an available ADR skill
when appropriate. Otherwise link relevant accepted decisions and keep the design
focused on the capability.

Keep these distinctions explicit, adapting them to the project's architecture:

- Transport contracts describe requests, responses, authentication, and error
  mapping at HTTP, messaging, CLI, or other external boundaries.
- Component or module contracts describe public operations and business outcomes.
  Identify ownership and keep internal implementation details separate.
- Persistence and external-service contracts describe schemas, constraints,
  migration ownership, configuration, and failure semantics where relevant.

State each business outcome once and map it to consumer-visible behavior. Make
important invariants, ownership, lifecycle, and concurrency rules explicit. Finish
with the smallest useful delivery slices and evidence for the requirements and
material risks. Do not publish the design or begin implementation without the
user's authorization for that action.

Use the `show-me` skill to explain the design's most important technical detail
visually. Choose the smallest useful format: a call tree for runtime flow, a
component or file tree for ownership and boundaries, pseudocode for logic, or
Mermaid for interactions and data flow. Place the visual next to the concise
prose it supports, and use a focused HTML artifact only when the topic cannot be
made clear with a text-based visual.
