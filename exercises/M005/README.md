# M005 — Explicit Absence Across Lookups

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9.1
FROZEN_AT: N/A

## Purpose and prerequisites

After M001–M004, model ordinary absence explicitly and compose dependent lookups without sentinels, partial functions, exceptions, or conflating absent with present-but-empty.

## Public API

Apprentice.M005.Exercise exports UserId, TeamId, User, Team, findUser, findTeam, and preferredLead. Constructors/fields are public; the API and first-match policy are fixed.

## Functional requirements and invariants

- FR-1: findUser/findTeam return the first matching ID or Nothing.
- FR-2: preferredLead finds a user, then its optional preferred team, then that team, then its optional lead.
- FR-3: absence at any stage yields Nothing; Just "" is a present empty lead and remains Just "".
- INV-1: no sentinel ID/string represents absence.
- INV-2: later duplicate IDs do not override the documented first match.
- INV-3: stages after an absent dependency are not semantically required.

## Complexity, memory, strictness

Each lookup is O(n) in the searched list and stops at the first match. preferredLead performs at most one user traversal and one team traversal; repeated searches or sorting are forbidden. A missing user must not require the teams list. No tight timing gate; private evidence uses visit counts and scaling.

## Forbidden shortcuts

No head/tail/fromJust/error/undefined/unsafe operations, exceptions for absence, sentinel values, Data.Map/Set, repeated lookup of the same collection, API changes, or warning suppression.

## Examples, gates, reflection

A missing user, a user with no preferred team, a missing team, and a team with no lead all yield Nothing; a lead "" yields Just "". Gates 0–7 and 11 apply; minimum Gold. Explain why Nothing does not carry diagnostics, how laziness can demonstrate short circuit, and when a map would become justified. Future transfer: B001 environment lookup, caches, parsers, and Smithy references.
