# SE Theory: Coreference

Lean 4 formalization of foundational
Coreference theory for Structural Explainability.

Coreference asks when two references are treated as referring
to the same referent, in a stated context.

This repository formalizes context-indexed co-reference judgments,
the equivalence relation generated from those judgments, and the
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

## Scientific Grounding and Limitations

Generated co-reference is an equivalence closure over references.
Its reflexivity, symmetry, and transitivity are mathematical properties
of that closure.
They do not establish successful denotation or identity of the intended referents.

Even when no co-reference links are asserted, the generated relation
relates each reference to itself.
This does not establish that the reference denotes
an existing or uniquely identified referent.

Contextual consistency establishes compatibility of supplied
co-reference and distinct-commitments.
It does not independently validate either set of judgments
against the intended referents.

Scientifically warranted co-reference requires independently justified
conditions connecting references to their intended referents,
including successful denotation where claimed, reliable attribution, and
adequate evidence for the identity judgment under the stated interpretation.

These conditions are not established by the generic commitment calculus.

### Counterexamples and Negative Findings

Distinct referents may have identical names, identifiers, or recorded
attributes.
Such agreement does not establish co-reference.

Different records may inherit an erroneous attribution from a common source.
Agreement between dependent records is not
independent corroboration of referent identity.

Conversely, multiple records or changing record contents may describe
one continuing referent.
Differences in their representations do not automatically
establish distinct referents.

The October 2026 NIST Disk Chopper Spectrometer investigation did not
establish that two independently produced presentations identified one
particular physical acquisition episode.
The accessible file-derived index record and
its source file shared a production lineage.
Their agreement did not independently establish occurrence identity.

The DCS investigation was suspended because the necessary evidence
could not be inspected, not because occurrence co-reference was
shown to be impossible.
Reconsideration requires adequate run-specific evidence,
documented record-production and attribution rules, and a
test capable of discriminating competing acquisition histories.

Independence of evidence is not imposed as a universal requirement.
Its relevance depends on the claimed conclusion and the applicable
error or attribution model.

### Outstanding Scientific Obligations

The theory has not established:

- when a reference successfully denotes one intended referent;
- when separately produced records warrant a positive co-reference judgment;
- when a generated co-reference link is scientifically sound;
- when co-reference judgments may be transported across contexts;
- which evidence and assumptions justify those conclusions for an
  intended referent kind.

An undetermined judgment must not be promoted to either co-reference
or distinctness merely to produce a definite result.

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

## Scope

Repository scope is defined in `SE_MANIFEST.toml`.

## Exclusions

Repository exclusions are defined in `SE_MANIFEST.toml`.

## Import

Downstream Lean projects should import the public surface:

`import SE.Coreference`
