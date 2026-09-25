---
name: implementation
description: Implement approved requirements for the voluntary blood donation management system through a controlled, tested, reviewable workflow.
---

# Implementation Skill

## Purpose

Implement only work that is supported by a human-approved specification, architecture, and database design. This skill governs implementation changes; it does not authorize changes to approved requirements or design decisions.

## Required workflow

Perform these stages in order for every implementation task:

1. **Read Specification**
2. **Understand Architecture**
3. **Understand Database**
4. **Implement**
5. **Run Linter**
6. **Run Tests**
7. **Review Diff**

Do not skip a stage. If a required source document is missing, contradictory, unapproved, or too vague to implement without business assumptions, stop before writing code and report the exact gap and decision needed.

## Stage instructions

### 1. Read Specification

- Read the approved requirements and the exact requirement IDs in scope, acceptance criteria, and relevant open issues.
- Confirm the requested behavior and its pass/fail conditions.
- Do not treat an open issue, assumption, design proposal, or AI-generated content as approved behavior.
- If acceptance criteria leave behavior material to implementation unclear, stop and report it rather than choosing a default.

### 2. Understand Architecture

- Read `docs/architecture.md` and the applicable architecture decisions.
- Follow the approved component boundaries, dependencies, and communication patterns.
- Do not change architecture or an accepted ADR without explicit human approval.
- If the architecture is missing, conflicts with the specification, or cannot support the requested behavior, stop and report the conflict.

### 3. Understand Database

- Read the approved database design and SQLite schema, including keys, constraints, relationships, and unresolved database issues.
- Preserve approved schema semantics and existing data. Do not silently add or change tables, columns, constraints, status values, or migrations.
- If implementation needs a schema change that is not already approved, stop and report the proposed change for the required database/human review.

### 4. Implement

- Make the smallest code change that satisfies the approved requirement and acceptance criteria.
- Do not add functions, routes, user flows, fields, roles, state transitions, or behavior outside the approved scope.
- Do not guess when a requirement is ambiguous. Stop and request a human decision.
- Do not hard-code API keys, credentials, tokens, or secrets. Read secrets through the approved configuration mechanism (the project currently specifies `.env` for the OpenAI API key).
- Do not write personal or sensitive health information to application logs, test output, error messages, or AI prompts unless explicitly approved and strictly necessary. Never create realistic personal health data as sample data.
- For AI features, preserve the approved-document boundary: the chatbot may answer process questions only from organization-approved documents; it must report when the approved material lacks the answer and must not provide personal medical advice, diagnose disease, or determine an individual's donation eligibility.
- Do not treat generated AI output as authoritative. Preserve any required human review step.
- Do not change or weaken tests to make implementation pass. Add or update tests only to reflect approved behavior; preserve existing test intent.
- Do not install new dependencies or introduce technologies unless approved by the user or specification.

### 5. Run Linter

- Inspect project configuration and use the linter already configured for the changed language/files.
- Do not invent a new linter, modify lint rules, or add dependencies solely to produce a clean result without approval.
- Report the exact command and outcome. If no linter is configured or it cannot run, state that clearly and continue only if the implementation can still be reviewed safely.
- Fix findings caused by the implementation. Do not hide unrelated existing findings; report them separately.

### 6. Run Tests

- Run the relevant existing tests after each implementation change, then run the complete project test suite when available and practical.
- For this project, use pytest as specified by the project requirements.
- Report commands, pass/fail results, and tests that could not run.
- If a test fails, investigate and fix implementation defects without changing tests merely to force a pass. If the failure exposes an ambiguous requirement, stop and report it.
- Do not claim tests passed if they were not run.

### 7. Review Diff

- Inspect the complete diff and working tree status after implementation, linting, and tests.
- Check that the diff changes only files needed for the approved task; identify any unrelated or pre-existing changes separately.
- Check for accidental secrets, personal/sensitive data in logs, unapproved requirements/schema changes, and out-of-scope functionality.
- Review that acceptance criteria are covered by tests and that no test was weakened to pass.
- If an unapproved architecture or requirements change appears, do not silently accept it; revert only changes made for the current task when safe, and report the issue.

## Stop conditions

Stop before implementing if any of these apply:

- The required specification, architecture, or database design is unavailable or has not been approved.
- Requirements conflict or omit a decision needed for correct behavior.
- A change would alter approved requirements, architecture, schema, or business rules without authorization.
- Implementing safely would require inventing a feature, personal-data field, AI behavior, or external integration.
- A required test/linter failure cannot be resolved without changing scope or weakening a test.

When stopping, report the files/documents inspected, the exact blocking requirement or decision, affected IDs where available, and what human decision is needed. Do not begin speculative implementation while waiting.

## Completion report

For completed implementation work, report:

- Requirement IDs and acceptance criteria addressed.
- Every file changed, with a brief reason.
- Linter commands and results.
- Test commands and results, including failures or unrun tests.
- Diff review outcome and any remaining risks/issues.
- Confirmation that requirements, approved architecture, and approved database design were not changed, or explicitly identify an authorized design change.

Never report completion while required implementation checks remain unreported.
