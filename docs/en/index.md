# SE Theory: Coreference

Lean 4 formalization of foundational
Coreference theory for Structural Explainability.

Coreference asks when two references are treated as referring
to the same referent, in a stated context.

This repository formalizes context-indexed co-reference judgments,
the identity relation those judgments generate, and the
distinct-commitments kept separate from them.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-coreference/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-coreference)

## Coreference

A co-reference account supplies, for each context, a relation on references.
The Neutral Substrate defines this interface without assuming reflexivity,
symmetry, or transitivity, and without identifying co-reference with
reference equality, carrier equality, individuation, or persistence.

This repository reads such an account through the Persistence commitment
calculus, one context at a time.
The account's co-reference judgments are read as asserted-same pairs.
The equivalence closure of those pairs is named separately
as generated co-reference,
because closure can establish pairs the account does not.
It coincides with the account's co-reference
only under hypotheses such as equivalence.

Distinct-commitments are a separate input.
A pair that is not co-referent is not thereby established to refer to different wholes.

These relations are formal constructions.
When a co-reference judgment is warranted,
and what licenses its continuation across contexts, depend on
independently justified criteria and remain active research.

## Dependencies

This repository is a theory-layer repository
for Structural Explainability.

It depends on Mathlib and on three Structural Explainability
theory repositories:

- Neutral Substrate, for the abstract co-reference account
- Persistence, for the commitment calculus
- Individuation, for successful presentations and same-unit judgments

It does not import Transformation's operator taxonomy,
effect dimensions, or state models.

The current formal development specializes accounts to universe 0,
as Persistence is stated for carriers in `Type`.

## Covers

This repository covers:

- context-indexed co-reference judgments over a co-reference account
- generated co-reference and its relation to the account's co-reference
- distinct-commitments and their consistency with co-reference
- Lean-side reference vocabulary
- machine-readable public-surface registries
- public Lean import surface

## Owns

This repository owns:

- the public import surface `SE/Coreference.lean`
- the repository-level aggregator `SE.lean`
- reference artifacts under `reference/`
- generated coreference artifacts under `data/coreference/`

## Out of Scope

This repository does not own:

- neutral substrate primitives
- transformation operator, family, or kind definitions
- transformation taxonomy lifts
- transformation effect dimensions or state models
- dimension-specific observational bridges
- identity regime definitions or profiles
- domain-specific identity criteria or their scientific justification
- the abstract co-reference account
- the commitment calculus (equivalence generation, consistency, admissibility, and status)
- whole formation and same-unit judgments
- validation and export tooling for artifacts
- domain mappings
- runtime systems
- operational policy

## Design Constraints

Lean source files are authoritative for formal theory semantics and proofs.

Reference registries describe the registered public surface
and must correspond to that Lean surface.

Python and generated data may mirror, validate, export,
or document the Lean surface.
They must not define theory semantics independently of Lean.

See the Lean source files and reference registries for current values.

## Documentation Constraints

Documentation is descriptive only.
It may provide orientation, summaries, and navigation.

It must not introduce formal semantics absent from Lean.

Machine-readable artifacts mirror the Lean surface
and reference registries under `data/coreference/`.

## Import

Downstream Lean projects should import the public surface:

`import SE.Coreference`

## Tooling

Python and other tooling may be used for:

- documentation generation
- formatting and linting
- repository automation
- reference artifact validation
- generated contract export checks

They must not:

- define correctness
- validate theory semantics independently of Lean
- replace Lean definitions or proofs
- introduce downstream theory dependencies
