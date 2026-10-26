/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Substrate.ReferentialRegime.CoReference
public import SE.Persistence.Commitment.Status

set_option autoImplicit false

/-!
# Contextual Commitments

SE.Coreference.ContextualCommitments

Reads a co-reference account through the Persistence commitment calculus, one
context at a time.

In a context `c`, the account's `coReference c` is read as the asserted-same
pairs `P`. Distinct-commitments `D` are a separate input. They are not derived
from the failure of `coReference`: a pair that is not co-referent is not thereby
established to refer to different wholes.

The equivalence closure of `coReference c` can establish pairs the account does
not. It is therefore named separately, and it coincides with `coReference c`
only under hypotheses such as `Equivalence (coReference c)`. When closure is
warranted is not settled here.

Persistence states its calculus for carriers in `Type`, so this module
specializes the account to universe 0, as Individuation does.
-/

namespace SE.Coreference

open SE.Substrate SE.Persistence

@[expose] public section

variable {Referent : Type}

-- RR.DEFINES: COREF.TYPE.DISTINCT_COMMITMENTS
/-- Independently warranted distinct-commitments in each context of an account. -/
structure DistinctCommitments (A : CoReferenceAccount.{0} Referent) where
  /-- `distinct c x y`: `x` and `y` are asserted to refer to different wholes in context `c`. -/
  distinct : A.Context → A.Reference → A.Reference → Prop

-- RR.DEFINES: COREF.DEF.GENERATED_CO_REFERENCE
/-- Two references are generated co-referent in a context when the equivalence closure of the account's co-reference links them. -/
def GeneratedCoReference (A : CoReferenceAccount.{0} Referent)
    (c : A.Context) (x y : A.Reference) : Prop :=
  Generated (A.coReference c) x y

-- RR.DEFINES: COREF.DEF.CONTEXT_CONSISTENT
/-- In a context, the account's co-reference and the distinct-commitments are consistent in the sense of Persistence. -/
def ContextConsistent (A : CoReferenceAccount.{0} Referent)
    (D : DistinctCommitments A) (c : A.Context) : Prop :=
  Consistent (A.coReference c) (D.distinct c)

-- RR.DEFINES: COREF.THM.CO_REFERENCE_IMP_GENERATED_CO_REFERENCE
/-- Whatever the account judges co-referent in a context is generated co-referent. -/
theorem coReference_imp_generatedCoReference
    (A : CoReferenceAccount.{0} Referent) (c : A.Context)
    {x y : A.Reference} (h : A.coReference c x y) :
    GeneratedCoReference A c x y :=
  Generated.rel h

-- RR.DEFINES: COREF.THM.GENERATED_CO_REFERENCE_IFF_OF_EQUIVALENCE
/-- When the account's co-reference in a context is already an equivalence relation, closure adds no pairs. -/
theorem generatedCoReference_iff_of_equivalence
    (A : CoReferenceAccount.{0} Referent) (c : A.Context)
    (hEq : Equivalence (A.coReference c)) {x y : A.Reference} :
    GeneratedCoReference A c x y ↔ A.coReference c x y :=
  ⟨fun h => Generated.le_of_equivalence hEq (fun _ _ hxy => hxy) h,
    fun h => Generated.rel h⟩

-- RR.DEFINES: COREF.THM.CONTEXT_CONSISTENT_IFF_EXISTS_ADMISSIBLE
/-- In a context, the commitments are consistent exactly when some admissible identity relation exists. -/
theorem contextConsistent_iff_exists_admissible
    (A : CoReferenceAccount.{0} Referent) (D : DistinctCommitments A)
    (c : A.Context) :
    ContextConsistent A D c ↔
      ∃ E, Admissible (A.coReference c) (D.distinct c) E := by
  unfold ContextConsistent
  exact consistent_iff_exists_admissible

-- RR.DEFINES: COREF.THM.UNDETERMINED_OF_NOT_GENERATED_CO_REFERENCE_OF_NO_DISTINCT
/-- With no distinct-commitments, a pair that is not generated co-referent is undetermined, not distinct. -/
theorem undetermined_of_not_generatedCoReference_of_no_distinct
    (A : CoReferenceAccount.{0} Referent) (c : A.Context)
    {x y : A.Reference} (h : ¬ GeneratedCoReference A c x y) :
    Undetermined (A.coReference c) (fun _ _ => False) x y := by
  refine ⟨h, ?_⟩
  rintro ⟨u, v, hD, _⟩
  exact hD

end

end SE.Coreference
