# M006 — Structured Errors and Total Validation

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9
FROZEN_AT: N/A

## Purpose and prerequisites

After M005, distinguish expected absence from invalid supplied data. Build stable structural diagnostics with path context and total decimal/range validation.

## Public API and contract

The module exports PathSegment, Port, Endpoint, ValidationError, prependPath, parsePort, and validateEndpoint.

- FR-1: parsePort path Nothing returns MissingValue path.
- FR-2: only a nonempty sequence of ASCII decimal digits is valid syntax; signs, whitespace, and other characters return InvalidDecimal with original text/path.
- FR-3: decimal values 1 through 65535 return Port; all syntactically valid values outside range return PortOutOfRange without Int overflow.
- FR-4: prependPath adds exactly one leading segment to every error constructor.
- FR-5: validateEndpoint checks name then port, rejecting absent name, empty name, invalid port, and otherwise returns Endpoint.
- INV-1: structural error constructor/path/payload is stable and presentation is not the API.
- INV-2: no exception or partial parse is observable for any String.

## Complexity, memory, strictness

Decimal validation is O(number of characters), single pass or equivalent, and must handle very long digit strings without overflow or quadratic concatenation. Path prepend is O(1). validateEndpoint does not parse port after a missing/empty name. Allocation grows linearly with input text at worst.

## Forbidden shortcuts

No read/fromJust/error/undefined/unsafe operations, exception catching as validation, sentinel port, flattening errors to String, quadratic repeated text append, API changes, or warning suppression.

## Examples, gates, reflection

parsePort [Field "port"] (Just "443") succeeds; " 443", "+1", "0", and "65536" fail with distinct structural categories. Gates 0–8, 10, 11; minimum Gold. Explain overflow avoidance, error taxonomy stability, fail-fast ordering, and how later applicative validation could accumulate independent errors. B001 and compiler/network diagnostics revisit this design.
