---
name: git-commit-safety
description: Safely prepare commits with proportionate validation and clear, useful commit messages. Use when asked to commit, assess commit or push readiness, or improve a commit message.
---

# Git Commit Safety

Inspect `git status` and the staged/unstaged diff before acting. Preserve unrelated changes.

Before committing:

1. Choose validation that matches the change: formatting or documentation checks for non-code changes; focused tests for a narrow behavior change; the project’s full build/test gate for broad or risky changes.
2. Run the chosen checks and treat warnings, failures, and missing coverage as blockers unless the user explicitly overrides this.
3. Reuse successful checks only when the relevant files and behavior are unchanged. Do not claim checks that did not run.
4. If validation is missing or failing, explain the exact gap and do not commit or call the branch safe to push.

Write the commit message from the actual diff:

- Use imperative mood and a concise subject, normally under 72 characters.
- Describe the user-visible or repository-level outcome, not implementation trivia.
- Add a body only when context, rationale, or notable validation is useful.
- Include an issue/reference identifier when the repository or user provides one.
- Do not bundle unrelated changes just to make the message easier to write.

Before committing or reporting readiness, summarize the checks that passed, any remaining risk, and the proposed message. After committing, report the commit ID and validation performed.
