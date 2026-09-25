---
name: database-design
description: Design and verify a requirements-traceable SQLite data model for the voluntary blood donation management system.
---

# Database Design Skill

## Purpose

Design a normalized, requirements-traceable SQLite schema for **Hệ thống quản lý hiến máu tình nguyện có tích hợp AI**. This skill produces database design artifacts and SQL DDL when requested. It does not implement Flask source code, change approved requirements, or decide unresolved business policy.

## Source-of-truth and safety rules

1. Read the approved requirements baseline, requirements issues, approved architecture/decisions, and applicable `AGENTS.md` instructions before designing.
2. Use only human-approved requirements as the source of business behavior. A draft, assumption, example, proposed architecture, or AI output is not approval.
3. Do not modify requirements. Do not infer fields, lifecycles, statuses, permissions, retention, or uniqueness rules that are not specified. Record missing or conflicting information as an issue and mark dependent design choices as pending.
4. Do not add entities or columns merely because they are conventional. Examples in this skill are review prompts, not an approved schema.
5. Use SQLite only unless the user approves a change. Do not add an ORM, migration tool, or other technology unless approved requirements require it.
6. Do not write Flask source code, application logic, routes, models, tests, or migrations as implementation. SQL DDL is allowed as a database design artifact.
7. Treat personal and health-related data as sensitive. Collect and persist only fields justified by an approved requirement and a stated purpose. Do not create sample personal health records. If purpose, access, retention, or deletion requirements are missing, raise issues instead of deciding them.
8. Do not store AI prompts, provider payloads, responses, or chat history unless explicitly required. If storage is required, document purpose, minimization, access, and retention as unresolved until approved.
9. AI chatbot knowledge must come from organization-approved process documents only. Never design storage that implies the chatbot can diagnose, give personalized medical advice, or determine an individual's donation eligibility.
10. Do not include real credentials, API keys, or personal data in schema comments or artifacts.

## Required workflow

Follow these stages in order. Show the result and unresolved questions at each stage; do not skip directly to SQL.

### 1. Requirements

- List the approved requirement IDs that need persistence and their sources.
- Separate persistent-data requirements from transient operations and presentation behavior.
- Identify unresolved requirements that affect data shape or lifecycle. Do not design those decisions as settled.

### 2. Entities

- Derive candidate entities from approved nouns and lifecycle requirements.
- For each entity, state its purpose, source requirement, and whether it is confirmed or provisional.
- Review required domains: personal/registrant data, campaign data, donation schedules/time slots, participation status, blood groups, approved AI knowledge documents, and AI data only if explicitly required.
- Do not assume that registrant, volunteer, donor, user, or account are the same entity. Record the relationship as an issue if requirements do not clarify it.

### 3. Relationships

- Specify relationships, cardinality, and optionality only when requirements support them.
- Identify lifecycle ownership and whether dependent records can exist independently.
- Raise an issue for unclear relationships; do not infer cascade-delete behavior.

### 4. Normalization

- Explain normalization to at least 3NF where appropriate: atomic values, no repeating groups, eliminate partial dependencies, and eliminate transitive dependencies.
- Document any deliberate denormalization, its requirement, and consistency risk. Do not denormalize just for convenience.
- Keep derived statistics derived from source records unless approved performance requirements justify storing them.

### 5. Primary keys and foreign keys

- Assign exactly one primary key strategy per table and justify it. Prefer a simple SQLite-compatible key unless a requirement needs a natural key.
- Define each foreign key, referenced key, nullability, and intended delete/update action.
- Do not cascade delete personal, campaign, participation, or audit-like data by default; choose actions only from approved lifecycle requirements.
- Confirm SQLite foreign-key enforcement is enabled by the application connection design; flag it if architecture leaves this unresolved.

### 6. Constraints

For every table, review and document:

- `NOT NULL` for required values;
- `UNIQUE` only where the requirement says duplicates are prohibited;
- `CHECK` for approved finite domains, ranges, or valid value combinations;
- foreign-key constraints and nullability;
- default values only where requirements define the default;
- data type and SQLite affinity suitable for each field.

Do not invent a rule such as one registration per person/campaign, slot capacity, status transitions, blood-type format, or date ordering. Raise an issue if such a rule is needed but unspecified.

### 7. Indexes

- Propose indexes from approved query, lookup, reporting, join, and ordering needs.
- Consider indexes on foreign-key columns used in joins or deletes.
- State the query/use case served by every index and any uniqueness effect.
- Avoid speculative or redundant indexes; remember indexes add storage and write cost.

### 8. SQLite SQL schema

- Produce SQLite-compatible `CREATE TABLE` and `CREATE INDEX` statements only after prior stages are documented.
- Use explicit column names, documented SQLite types/affinities, named constraints where practical, and table-level foreign keys where clearer.
- Do not use vendor-specific SQL unavailable in SQLite.
- Ensure any enum-like `CHECK` values exactly match approved requirements; represent unresolved values as design issues rather than guesses.
- Include the need to enable `PRAGMA foreign_keys = ON` per connection in verification notes; do not assume SQLite enforces foreign keys automatically.

### 9. Verification

Verify the design against this checklist and report pass/fail/open for each item:

- Every table/column traces to a requirement or has a documented technical purpose.
- Every table has a primary key.
- Every foreign key references an existing primary/unique key and has a documented action.
- Required fields use `NOT NULL`; nullable fields have a reason.
- `UNIQUE` and `CHECK` constraints implement only approved rules.
- SQLite data types/affinities fit the represented values and avoid unsupported assumptions.
- Relationships/cardinalities agree with requirements.
- Normalization and any deliberate denormalization are explained.
- Indexes serve identified access patterns and are not redundant.
- Personal data is minimized, with unresolved access/retention/deletion issues called out.
- Campaign, schedule, participation status, blood group, and any required AI data are covered without adding unsupported fields.
- No unnecessary AI conversation or prompt data is persisted.
- DDL is syntactically valid SQLite. If execution is authorized and a SQLite runtime is available, validate it against a disposable in-memory database; otherwise report that syntax validation remains pending. Do not add/run application tests unless requested.
- Requirements-to-entity/table/column traceability has no unexplained gaps.

## Traceability format

Maintain a matrix with at least:

| Requirement ID | Entity/table | Attribute or relationship | Constraint/index | Status or issue |
|---|---|---|---|---|

Every persisted requirement must map to one or more schema elements. Every schema element must map to an approved requirement or have a clearly labeled technical reason. Mark unresolved mappings as pending and reference an issue ID.

## Artifact behavior

When asked to perform database design, create or update only the explicitly requested artifacts. If no output paths are specified, propose a database design document and a separate SQL DDL artifact before creating them. Keep the design in Vietnamese when the project documentation is Vietnamese. Never modify requirements or write Flask implementation code as part of this skill.

## Completion report

Report entities and relationships, normalization choices, keys and constraints, indexes and their purposes, SQLite DDL status, privacy implications, traceability coverage, verification results, and all decisions that require human input. Do not call a design complete while blocking business rules remain unresolved.
