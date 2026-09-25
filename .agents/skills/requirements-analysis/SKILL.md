---
name: requirements-analysis
description: Analyze and document requirements for the voluntary blood donation management system with controlled AI features.
---

# Requirements Analysis Skill

## Purpose

Analyze requirements for **Hệ thống quản lý hiến máu tình nguyện có tích hợp AI** and produce reviewable requirements artifacts. Follow the user-approved SDLC and never implement source code while performing requirements analysis.

## Source-of-truth rules

1. Read existing project requirements, decisions, and applicable `AGENTS.md` instructions before drafting.
2. Treat user-confirmed requirements and explicitly approved project documents as authoritative. Do not treat a proposed assumption, sample prompt, or AI output as an approved business rule.
3. Do not add or infer business behavior. If a detail is missing, conflicting, or unclear, record it in `docs/requirements-issues.md` as an open question and avoid specifying its behavior as settled.
4. Preserve approved requirements. If new information conflicts with an approved requirement, report the conflict and request a human decision; do not silently rewrite the baseline.
5. Distinguish explicit requirements from assumptions and unresolved questions. Assumptions must be minimal, labeled, and must not decide business behavior.
6. Do not create personal health information, examples that look like real health records, or medical advice.
7. AI chatbot requirements must limit answers to organization-approved blood donation process documents. It must refuse unsupported questions and direct the user to an appropriate staff member or expert. It must not provide individualized medical advice.
8. Minimize personal or sensitive data sent to AI. Never put API keys or other secrets in requirements artifacts.

## Analysis procedure

1. **Inspect sources:** Read the current requirements, README, relevant decisions, and existing artifacts. Note source and version/date where available.
2. **Identify stakeholders:** List people or organizations that have an interest in the system, distinguishing confirmed stakeholders from candidates needing confirmation.
3. **Identify actors:** List external roles or systems that interact with the product. Use only roles supported by the sources; record unresolved permissions separately.
4. **Identify functional requirements:** Extract one independently understandable behavior per requirement. Assign stable sequential IDs `FR-001`, `FR-002`, etc. Include only source-supported behavior. For AI behavior, state its permitted input/output and safety boundary only when supported by approved sources.
5. **Identify non-functional requirements:** Extract measurable or verifiable constraints and assign stable sequential IDs `NFR-001`, `NFR-002`, etc. Keep technical choices and quality requirements distinct from business behavior. If a quality target has no value, record it as unresolved rather than inventing a threshold.
6. **Identify business rules:** List explicit domain rules separately and cite their source requirement. Do not convert an unresolved policy into a rule.
7. **Identify assumptions:** List only assumptions needed to interpret the current draft. Mark each unapproved and explain which requirements depend on it.
8. **Identify ambiguities and conflicts:** Create actionable issue IDs (`ISSUE-001`, ...), describe the affected requirement, explain the decision needed, and do not resolve it on the user's behalf.
9. **Create user stories:** Assign IDs (`US-001`, ...). Use a concise actor / goal / value format. Every story must reference one or more `FR` or `NFR` IDs; do not make stories for unapproved scope.
10. **Create acceptance criteria:** Assign IDs (`AC-001`, ...). Write observable, testable outcomes with setup/action/expected result where useful. Link each criterion to requirement and story IDs. Where behavior is underspecified, write a criterion that verifies the confirmed boundary only and link the unresolved detail to an issue; do not make up a desired outcome.
11. **Create traceability:** Include mappings among every requirement, user story, and acceptance criterion. Requirements without a justified story or criterion must be called out, not silently omitted.
12. **Review completeness:** Apply the checklist below and report remaining decisions for human verification.

## Required domain review prompts

For each topic, explicitly classify it as **specified**, **not specified**, or **conflicting**, and cite IDs/source:

- Login and authentication
- Roles and authorization
- Registrant/person management
- Blood donation campaigns
- Donation locations
- Donation dates/times
- Schedule registration
- Capacity per time slot
- Participation status
- Blood groups
- Reminder notifications
- Statistics and reports
- AI-generated invitations/reminders
- AI chatbot grounded in approved documents
- AI campaign summaries
- Personal data protection and minimization
- AI prohibition on individualized medical advice

Do not interpret this checklist as permission to add any listed function.

## Required artifacts

When requested for this project, create or update only these requirements artifacts unless the user asks otherwise:

- `docs/requirements.md`: scope/source baseline, stakeholders, actors, FRs, NFRs, business rules, assumptions, domain review, and traceability matrix.
- `docs/user-stories.md`: stories with requirement links and brief rationale.
- `docs/acceptance-criteria.md`: testable ACs with FR/NFR and US links.
- `docs/requirements-issues.md`: ambiguities, conflicts, questions, affected IDs, and decision status.

Use Vietnamese when the project documents are in Vietnamese. Keep IDs stable across files. Do not edit source code, tests, database schemas, or approved source requirements as part of this skill unless explicitly requested.

## Completion checklist

Before reporting completion, verify:

- Every functional requirement has a unique `FR-###` ID.
- Every non-functional requirement has a unique `NFR-###` ID.
- Every user story maps to at least one requirement.
- Every requirement has traceability to story/acceptance criteria, or an explicit documented reason and issue.
- Acceptance criteria have observable pass/fail outcomes and no invented thresholds or policies.
- Unresolved questions and conflicts are explicit and actionable.
- The domain review prompts above are all classified.
- No unsupported business behavior or personal health data was introduced.
- No source code was written.
