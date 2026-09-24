---
name: technical-design
description: Collaboratively develop or revise implementation-ready technical designs for approved requirements, ending in self-contained handoff documents. Use for technical implementation proposals, not product discovery or ADR authoring.
---

# Technical-design convention

Technical designs turn an approved story into an implementation-ready proposal.
They are usually posted as a GitHub issue comment. Lead with stable contracts and
invariants; use prose only for decisions that a contract, diagram, or table
cannot express clearly.

This is a communication convention, not an architecture decision record. A
design that creates or materially changes a durable architectural decision must
propose an ADR first. Link relevant accepted ADRs rather than restating their
rationale.

## What a design must make clear

- **Public boundaries:** HTTP requests and responses, and the public
  application contracts a module exposes to its consumers.
- **Domain model:** aggregate ownership, entity and value-object roles,
  lifecycle, invariants, authority, and concurrency rules.
- **Persistence and infrastructure:** the required schema, constraints,
  migration ownership, external service abstractions, configuration, and
  failure semantics.
- **Delivery confidence:** required evidence, non-goals, and unresolved decisions.

`Public` means an HTTP or module-consumer contract. Database schema and
infrastructure dependencies are integration contracts; repositories, entities,
value objects, and mappings remain internal unless an accepted ADR says
otherwise.

## Writing rules

- Start from the observable story outcome, but do not repeat the full story or
  its acceptance criteria.
- Write the contract map before describing a workflow. Use tables for request
  and response mapping, result states, schema, and ownership when they are
  easier to scan than prose.
- State every application result once in the module-contract section. Endpoint
  tables map those results to HTTP rather than redefining business outcomes.
- Show exact routes, inputs, security requirements, status codes, redirects,
  and cookie effects when HTTP is involved.
- Show actual public interface signatures and immutable request/result types
  when a module surface changes. Web owns HTTP and browser concerns; modules
  own business outcomes.
- Show the smallest useful aggregate and relationship code shape, including the
  affected entities, value objects, and domain operations. Explicitly call out
  scalar foreign keys, ownership, and navigation-property constraints where
  relevant.
- Make secret handling, retention, cache/referrer policy, authorization, and
  concurrency explicit when the capability handles identity or bearer data.
- Omit sections that genuinely do not apply. Do not add a heading simply to
  say that no work is planned.

## Copyable template

````md
## Decision and boundaries

- [The one or two decisive choices and important exclusions.]
- Relevant ADRs: [links].

## Contract map

```text
[Consumer] -> [HTTP/API adapter] -> [public module facade] -> [internal capability]
                                                      -> [infrastructure]
```

## HTTP contract

| Request | Input and guards | Success | Failure or alternate outcome |
| --- | --- | --- | --- |
| `POST /example` | JSON request; antiforgery | `202 Accepted` | `400` invalid request; `503` unavailable |

## Module public contract

```csharp
public interface IExampleCapability
{
    Task<ExampleResult> ExecuteAsync(
        string? value,
        CancellationToken cancellationToken);
}

public enum ExampleStatus
{
    Succeeded,
    InvalidValue,
    Unavailable
}

public sealed record ExampleResult(ExampleStatus Status);
```

| Operation | Result states | Consumer responsibility |
| --- | --- | --- |
| `ExecuteAsync` | `Succeeded`, `InvalidValue`, `Unavailable` | Map outcome to transport/presentation |

## Domain model and invariants

```csharp
internal sealed class ExampleAggregate
{
    private readonly List<ExampleEntry> _entries = [];

    public ExampleId Id { get; }
    public IReadOnlyCollection<ExampleEntry> Entries => _entries;

    public void AddEntry(ExampleEntry entry)
    {
        // Enforce aggregate invariants before changing owned state.
        _entries.Add(entry);
    }
}

internal readonly record struct ExampleId(Guid Value);

internal sealed record ExampleEntry(string Value);

internal sealed class IndependentEntity
{
    // Scalar foreign key only; no navigation property to ExampleAggregate.
    public ExampleId ExampleId { get; }
}
```

- [Ownership, lifecycle, authority, expiry, uniqueness, and concurrency rules.]

## Persistence contract

| Table or mapping | Columns / constraints | Owner |
| --- | --- | --- |
| `ExampleRecords` | `ExampleId` PK; unique `LookupKey`; `RowVersion` | [module / Infrastructure migration] |

## Infrastructure contract

- [External abstraction, options, delivery ordering, and expected failure behaviour.]
- [Security, privacy, observability, cache, and referrer constraints.]

## Evidence

- [Focused module/persistence, HTTP, frontend, browser, migration, and UI evidence as applicable.]

## Non-goals and open questions

- [Explicit exclusions and decisions still requiring direction.]
````

## Review checklist

- Can a Web consumer implement the endpoint adapter from the HTTP and module
  contract sections without reading the prose?
- Can a module implementer identify every domain invariant and aggregate
  boundary without inferring it from a flow description?
- Can a migration author construct the schema and constraints without reverse
  engineering them from entity names?
- Does the design avoid exposing internal module types as integration surfaces?
- Does the evidence section cover each story confirmation criterion and the
  material technical risks?
