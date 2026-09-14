# Fowler ADR Notes

Source: Martin Fowler, "Architecture Decision Record", 24 March 2026  
URL: https://martinfowler.com/bliki/ArchitectureDecisionRecord.html

## Core points

- An ADR is a short document that captures one decision relevant to a product or ecosystem.
- Keep it short: typically one page, at most a couple of pages.
- Include the decision, the context for making it, and the significant ramifications.
- Write in an inverted-pyramid style: most important information first.
- Keep ADRs in the source repository that they apply to when possible.
- A common location is `doc/adr`.
- Store each ADR as its own file in a lightweight markup language such as markdown.
- Number ADRs with a monotonic sequence in the filename, plus a descriptive name.
- Use statuses such as `proposed`, `accepted`, and `superseded`.
- Once accepted, ADRs are historical records. If the decision changes, create a new ADR rather than rewriting the old one.
- Capture rationale and trade-offs, including serious alternatives with pros and cons.
- Record consequences explicitly when useful.
- Record confidence level and what changes in context should trigger reevaluation.
- If the team uses an advice process, summarize the advice gathered and link fuller records elsewhere.

## Practical implications for this skill

- Prefer a small, consistent markdown template over prose-heavy documents.
- Preserve existing repository conventions before applying defaults.
- Default to `doc/adr` only when the repository has no established ADR location.
- Favor links to deeper design notes, RFCs, or tickets rather than embedding them in the ADR.
