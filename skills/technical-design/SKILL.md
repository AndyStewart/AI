---
name: technical-design
description: Collaboratively develop or revise implementation-ready technical designs for approved requirements, ending in self-contained handoff documents. Use for technical implementation proposals, not product discovery or ADR authoring.
---

# Technical Design

Create a design that gives an implementation agent or person enough technical
detail to complete the work without reconstructing technical decisions from the
conversation history. Linked requirements remain authoritative for intended
behaviour. Treat the user as the design author and an active participant in
material technical decisions.

Use the target repository's agent guidance to locate relevant architecture
decisions, product requirements, and the place where designs are stored. Read
only material relevant to the proposed capability.

At the start, assess whether the proposal materially changes an architectural
boundary, persistence strategy, durable public contract, or cross-cutting policy.
Follow the repository's ADR process for such decisions; use an available ADR skill
when appropriate. Otherwise link relevant accepted decisions and keep the design
focused on the capability.

## Collaborative design

When material choices, uncertainties, or trade-offs remain, work through them
with the user before consolidating the final document. For each material decision,
offer a recommendation, explain only meaningful alternatives and trade-offs, and
invite the user to choose, correct, or refine the direction. Clearly distinguish
agreed decisions from assumptions and unresolved questions. Do not manufacture a
discussion when the direction is already settled; proceed directly to drafting or
revision in that case.

During the discussion, use the `show-me` skill when a focused visual would make a
non-obvious boundary, ownership model, runtime interaction, state transition,
deployment topology, trust boundary, or competing option easier to evaluate. Keep
each visual focused on the current decision. Discussion visuals are provisional;
carry them into the final design only when they remain useful to the implementation
agent and do not merely repeat the written contracts.

Once the material direction is stable, summarize the resulting decision set and
remaining assumptions so the user can correct it, then consolidate the agreed
design into a self-contained handoff. The implementation agent should not need
the original conversation to distinguish decisions, assumptions,
responsibilities, or open questions.

## Information and representation

Include as much detail as the implementation requires; do not omit useful detail
merely to keep the document short. Prefer the densest clear representation:

1. Diagrams for context, boundaries, ownership, runtime interaction, state,
   deployment, and ordering.
2. Tables for mappings, outcomes, failures, decisions, schema changes, and
   evidence.
3. Type shapes, signatures, schema definitions, and pseudocode for exact
   implementation constraints.
4. Prose for rationale, invariants, compatibility rules, caveats, and trade-offs
   that those forms cannot express clearly.

Diagrams should explain structure or behaviour, but must not be the sole carrier
of an exact constraint. Put precise retries, timeouts, outcomes, ordering rules,
or similar implementation details in an adjacent table, definition, or concise
statement.

Choose the views that fit the work. When these boundaries are affected, keep their
responsibilities and contracts distinct, adapting them to the project's
architecture:

- Frontend contracts describe client-side models, rendering responsibilities,
  user-visible states, and compatibility with the transport payload.
- Transport contracts describe requests, responses, authentication, and error
  mapping at HTTP, messaging, CLI, or other external boundaries.
- Component or module contracts describe public operations and business outcomes.
  Identify ownership and keep internal implementation details separate.
- Domain models describe aggregate ownership, entity and value-object roles,
  lifecycle, authority, invariants, and concurrency.
- Persistence and external-service contracts describe schemas, constraints,
  migration ownership, configuration, and failure semantics where relevant.

`Public` means a transport or component-consumer contract. Database schema and
infrastructure dependencies are integration contracts; repositories, entities,
value objects, and mappings remain internal unless the architecture says
otherwise.

Include the context needed to understand the change, while keeping detailed
specification focused on affected boundaries. Order those details in the way that
best explains the implementation. Separate frontend, transport, and module
contracts when they change so each consumer and owner can see its exact
responsibility. Mention an unchanged route or signature only when its returned
type graph or behaviour changes materially.

Link to the approved requirements instead of paraphrasing their card,
conversation, or acceptance criteria. Use requirement identifiers for
traceability and evidence without reproducing their wording. State application
results once in the module contract and map them at consumer boundaries.

When relevant:

- Show exact routes, inputs, authentication and authorization, status codes,
  redirects, cookies, caching, and error mapping.
- Show actual public interface signatures and immutable request/result types.
- Show frontend models, component responsibilities, user-visible states, and
  compatibility behaviour.
- Show aggregate ownership and relationships, including scalar foreign keys and
  navigation-property constraints.
- Make secret handling, retention, privacy, observability, delivery ordering,
  failure semantics, and concurrency explicit.

For every persistent domain addition, identify its ownership, lifecycle, write
path, invariants, and mapped schema object. For every schema addition, name the
domain or infrastructure concept it represents. Specify the schema delta exactly:
tables, columns, types, nullability, keys, foreign keys, checks, indexes,
concurrency tokens, delete behaviour, and migration or backfill behaviour where
applicable. Do not reproduce unaffected effective schema.

Finish with concise evidence mapped to requirement identifiers and material
technical risks. Before finalizing, verify that public fields trace to module
results and persistent domain state reconciles with the schema.

## Document shape

Choose and order only the sections that make the particular change easiest to
understand and implement. The sections below are a menu, not a mandatory template;
add or rename a section when another shape communicates the design more clearly.
Do not add headings merely to say that nothing changes.

### Context and visual model

Show the smallest useful view of the surrounding system and the proposed change.
Use context, ownership, sequence, state, data-flow, or deployment diagrams when
they communicate the design more efficiently than prose.

### Decision and boundaries

State decisive technical choices, concise rationale, material rejected
alternatives, important exclusions, and relevant ADRs.

### Implementation structure

Show the affected modules, components, files, responsibilities, dependencies, and
extension points when that structure helps the implementer locate or divide the
work. Keep incidental internal detail out of the design.

### Runtime behaviour

Show important interactions, state transitions, ordering, failure paths, retries,
timeouts, and recovery. Pair a sequence, state, or data-flow diagram with a dense
table when exact outcomes or constraints matter.

### Frontend contract

Show changed client models, component ownership, rendering responsibilities, and
user-visible states.

### Transport contract

Use a compact request table when useful:

| Request | Input and guards | Success | Failure or alternate outcome |
| --- | --- | --- | --- |
| `POST /example` | request shape; authentication | status and response | status and response |

### Component or module public contract

Show real operation signatures and immutable request/result types. List each
result state once, with the consumer's mapping responsibility.

### Domain model and invariants

Show the smallest useful type or ownership shape, then state lifecycle,
authority, uniqueness, ordering, and concurrency rules. For persistent additions,
identify the write path and mapped schema object.

### Persistence contract

Describe additions, alterations, and removals rather than the effective schema:

| Schema delta | Exact columns and constraints | Domain or infrastructure mapping | Owner |
| --- | --- | --- | --- |
| Add `ExampleRecords` | `ExampleId` PK; unique `LookupKey`; `RowVersion` concurrency token | `ExampleRecord`; created by `ExecuteAsync` | module mapping; infrastructure migration |

State migration, backfill, and compatibility behaviour.

### Infrastructure contract

Describe only changed external abstractions, configuration, delivery or failure
behaviour, and security or operational constraints.

### Delivery and evidence

Define the smallest buildable vertical slices. Map requirement identifiers and
material risks to focused module, persistence, transport, frontend, browser,
migration, or UI evidence as applicable.

### Non-goals and open questions

Include only material exclusions and unresolved decisions.

## Review

Before presenting the design, verify:

- Material decisions are agreed or explicitly marked unresolved, and assumptions
  are not presented as decisions.
- An implementation agent can use the design without consulting the original
  discussion.
- The design contains all technical detail needed for implementation rather than
  optimizing for arbitrary brevity.
- Requirements are linked and traced to evidence without repeating their content.
- Diagrams and dense structured forms replace prose where they communicate more
  clearly, while every exact constraint remains unambiguous outside the diagram.
- When transport or module contracts change, an adapter can be implemented from
  them without extracting rules from prose.
- When domain boundaries change, the implementer can identify their ownership and
  invariants.
- When persistence changes, a migration author can construct the schema without
  reverse engineering entity names; every persistent domain addition maps to a
  schema object and write path, and every schema addition names the concept it
  represents.
- Frontend, transport, and module deltas are stated once at their owning boundary
  when affected.
- Internal types are not accidentally exposed as integration contracts.
- Evidence covers each requirement identifier and material technical risk.
- No prose repeats the story, a contract, a type shape, or another section.
