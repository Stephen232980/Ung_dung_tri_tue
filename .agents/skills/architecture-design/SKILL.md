---
name: architecture-design
description: Design and document a requirements-traceable architecture for the voluntary blood donation management system with controlled AI features.
---

# Architecture Design Skill

## Purpose

Produce reviewable architecture artifacts for the voluntary blood donation management system. Architecture must be derived only from requirements that have been approved by a human. This skill does not implement the system.

## Source-of-truth and scope rules

1. Read the approved requirements baseline, `docs/requirements-issues.md`, relevant project decisions, and applicable `AGENTS.md` instructions before designing.
2. Treat only explicitly approved requirements as authoritative. A proposed requirement, assumption, sample prompt, or AI output is not approval.
3. Do not modify requirements, close requirement issues by assumption, invent workflows, or add features.
4. If an architecture decision depends on an unresolved issue, record the dependency in the architecture and decision log as pending human decision. Do not silently choose a business rule.
5. Use only the technologies already approved for the project. Do not add infrastructure, frameworks, services, or deployment components unless a requirement needs them and the user approves them.
6. Do not write source code, schemas, migrations, tests, or implementation files while performing architecture design.
7. Keep personal and sensitive data out of AI prompts unless a requirement expressly requires it and the data is necessary. Never include secrets in architecture artifacts.
8. AI chatbot boundaries must preserve approved requirements: answer only from organization-approved process documents; report when requested information is not present in those documents; do not provide individual medical advice, diagnose disease, or determine an individual's eligibility to donate.
9. Keep AI outputs reviewable by humans and do not describe generated content as authoritative unless a requirement and human decision establish that status.

## Required analysis steps

1. **Establish baseline:** list the approved requirement IDs and unresolved issues used. If no approved baseline exists, label the design draft and do not claim requirements are approved.
2. **Select architectural style:** choose the simplest style that meets the approved requirements and the student's expected scale. Explain the rationale and tradeoffs. Do not add distributed architecture without a requirement.
3. **Identify components:** name each logical component and map it to requirements. Include only components needed to fulfill approved scope.
4. **Define responsibilities:** state each component's responsibilities, inputs, outputs, and explicit exclusions.
5. **Map dependencies:** show which component depends on which other component and why. Prefer clear, limited dependencies and identify any boundary that protects the domain from infrastructure details.
6. **Define communication:** document synchronous/asynchronous interactions, protocols or mechanisms only when supported by chosen approved technologies. Mark unselected details as open instead of guessing.
7. **Describe data flow:** trace relevant use cases from actor through components to persistence or external systems and back. For AI flows, show input minimization, approved-document grounding, output handling, refusal path, and human review where required.
8. **Identify external systems:** distinguish confirmed external systems from candidates. Describe data exchanged and unresolved privacy/retention questions.
9. **Define security boundaries:** identify trust zones, authentication/authorization enforcement boundaries, secret handling, sensitive-data boundaries, and external AI boundary. Do not claim specific controls are requirements unless approved.
10. **Record decisions:** create stable decision IDs (`ADR-001`, `ADR-002`, ...), including context, decision, rationale, consequences, alternatives considered, requirement links, and status (Proposed / Accepted / Rejected / Superseded). Only a human can mark a decision Accepted.
11. **Trace requirements:** map every FR/NFR in scope to one or more architecture components or explain why it is not architectural. Map each component and decision back to requirement IDs. Flag uncovered requirements.
12. **Report open issues:** capture unresolved requirement dependencies in `docs/architecture-decisions.md` or reference their issue IDs without resolving them.

## Required artifacts

When requested for this project, create or update only:

- `docs/architecture.md`: status and baseline, style, context/boundaries, component responsibilities, dependency and communication views, data flows, external systems, security boundaries, and requirement traceability.
- `docs/architecture-decisions.md`: ADRs with status, rationale, consequences, requirement links, and pending decisions.

Use Vietnamese when the project documentation is Vietnamese. Do not alter requirements artifacts. Keep IDs consistent with the approved baseline.

## Completion checklist

- Architectural style is named and justified against requirements.
- Every component has clear responsibilities and requirement links.
- Dependencies and communications are described without inventing product behavior.
- Data flows cover key management, registration/capacity, reminders, reporting, and each approved AI feature when those requirements are in scope.
- External systems and exchanged data are identified.
- Security and privacy boundaries include the AI-provider boundary and secret handling.
- Every architecture decision has an ID and status; proposed decisions are not presented as human-approved.
- Traceability covers every requirement in scope and calls out gaps.
- Unresolved issues remain unresolved and visible.
- No source code or extra technology/feature was added.
