# B001 — Expression Language

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9.1
FROZEN_AT: N/A

## Purpose and prerequisites

Integrate M001–M008 under language-tooling pressure: recursive ASTs, total case analysis, optional environment lookup, structured parse/evaluation failure, lawful/round-trip properties, strictness/stack reasoning, and defensible tests. This is a manual parser trial; parser combinators are not yet permitted.

## Engineering capability

Build a coherent small-language boundary whose parser rejects invalid/trailing input, evaluator respects lexical shadowing and total failure, printer preserves meaning through precedence, and components evolve toward source diagnostics without entanglement.

## Public API

- Apprentice.B001.Syntax: UnaryOp(..), BinaryOp(..), Expr(..), isValidIdentifier, wellFormed.
- Apprentice.B001.Parser: ParseError(..), parseExpr.
- Apprentice.B001.Eval: Env, EvalError(..), eval.
- Apprentice.B001.Pretty: pretty.

Do not change these APIs during the initial attempt. Additional private helpers/modules are allowed if they do not expose or bypass the contract.

## Grammar and lexical contract

~~~text
expression     ::= let-expression | additive
let-expression ::= "let" identifier "=" expression "in" expression
additive       ::= multiplicative (("+" | "-") multiplicative)*
multiplicative ::= unary (("*" | "/") unary)*
unary          ::= "-" unary | atom
atom           ::= decimal | identifier | "(" expression ")"
decimal        ::= ASCII digit+
identifier     ::= ASCII letter-or-underscore ASCII-letter-digit-or-underscore*
~~~

Keywords let and in are not identifiers. ASCII whitespace (space, tab, CR, LF) may occur between tokens, including at ends. Integers are nonnegative decimal literals in source; unary minus represents negation. Binary operators are left-associative; multiplication/division bind tighter than addition/subtraction; unary minus binds tighter than binary operators. Parsing must consume the entire non-whitespace input.

## Functional requirements

- FR-1: isValidIdentifier implements the lexical rule and rejects keywords; wellFormed recursively checks every variable/binder name.
- FR-2: parseExpr accepts exactly the grammar, returns structural ParseError with zero-based offset, nonempty expected categories, and found character or end-of-input.
- FR-3: invalid token, missing delimiter/operand/keyword, empty input, keyword misuse, and trailing garbage return Left; no exceptions.
- FR-4: eval handles every AST constructor. Environment association lists use the first matching binding.
- FR-5: let evaluates its bound expression in the current environment, then body with the new binding shadowing old bindings.
- FR-6: unbound variables and division by zero return the corresponding structural EvalError; integer arithmetic is unbounded.
- FR-7: pretty emits deterministic valid source for every wellFormed Expr, with sufficient parentheses to preserve exact AST associativity/precedence and no unnecessary leading/trailing whitespace.
- FR-8: parseExpr (pretty e) == Right e for wellFormed e. Parser acceptance of noncanonical source need not preserve original formatting.

## Invariants

- INV-1: successful parser output is wellFormed.
- INV-2: parser success consumes all non-whitespace input.
- INV-3: evaluator never inspects environment bindings after the first matching name.
- INV-4: printer/parser round trip preserves the exact AST, not only evaluation result.
- INV-5: diagnostics are structural data; human rendering is not part of this version's equality contract.

## Complexity, memory, strictness, stack

For n input characters and n AST nodes, parsing/rendering/evaluation must be O(n) absent integer arithmetic cost. Avoid repeated string append and uncontrolled backtracking. Flat operator chains at n/2n/4n must show linear-class growth. Deep nesting and left-skewed ASTs receive broad stack qualification and allocation/residency review. Evaluation must not evaluate the right operand of division after a Left from the left operand, and must not scan past a found environment binding. No streaming requirement yet.

## Forbidden shortcuts

No parser library, Read/reads-based whole-expression parser, pretty-printing library, eval/string round-trip, direct String concatenation pattern known to be quadratic over growing output, partial functions, error/undefined after completion, unsafe operations, exception-based control flow, warning suppression, test weakening, API changes, or hidden reference material.

## Public examples

~~~text
parseExpr "1 + 2 * 3" == Right (Binary Add (Lit 1) (Binary Multiply (Lit 2) (Lit 3)))
parseExpr "10 - 3 - 2" is left-associated
eval [] (Binary Divide (Lit 1) (Lit 0)) == Left (DivisionByZero (Lit 0))
eval [("x", 9)] (Var "x") == Right 9
parseExpr "1 trailing" is Left
parseExpr (pretty e) == Right e for wellFormed e
~~~

## Completion gates

Gates 0–8, 10 changed requirement, 11 oral defense, and 13 hidden integration apply. Minimum Gold; Platinum requires strong learner-authored tests/mutation defense and a localized source-span design round.

## Reflection and oral defense

Explain termination/progress for every parser branch; distinguish failure offset from backtracking choice; prove associativity preservation by pretty; trace lexical shadowing; identify quadratic rendering/backtracking risks; explain demand after an error; defend generator validity/shrinking; and design the change that attaches source spans without polluting evaluation semantics.

## Future revisit

Parser combinators and richer errors; source spans/recovery; static types and GADT typed AST; document algebra; IR/desugaring/optimization; incremental parsing; schema and protocol languages.
