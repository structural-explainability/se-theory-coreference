module -- shake: keep-all

import SE.Coreference.ContextualCommitments

/-!
# Contextual Commitments Tests

A one-context account over three references where only `0` co-refers with `1`,
and only in that direction.
-/

namespace SETest.Coreference.ContextualCommitments

open SE.Substrate SE.Persistence SE.Coreference

abbrev exampleAccount : CoReferenceAccount.{0} Unit where
  Context := Unit
  Reference := Fin 3
  coReference := fun _ a b => a = 0 ∧ b = 1

theorem example_closure_adds_pair :
    GeneratedCoReference exampleAccount () 1 0 ∧
      ¬ exampleAccount.coReference () 1 0 := by
  refine ⟨Generated.symm (Generated.rel ⟨rfl, rfl⟩), ?_⟩
  intro h
  exact absurd h.1 (by decide)

theorem example_not_generated_zero_two :
    ¬ GeneratedCoReference exampleAccount () 0 2 := by
  intro hg
  have hs : Equivalence (fun a b : Fin 3 => (a = 2 ↔ b = 2)) :=
    ⟨fun _ => Iff.rfl, fun h => h.symm, fun h₁ h₂ => h₁.trans h₂⟩
  have hsub : ∀ a b : Fin 3,
      exampleAccount.coReference () a b → (a = 2 ↔ b = 2) := by
    rintro a b ⟨rfl, rfl⟩
    decide
  have hIff := Generated.le_of_equivalence hs hsub hg
  exact absurd (hIff.mpr rfl) (by decide)

theorem example_undetermined_zero_two :
    Undetermined (exampleAccount.coReference ()) (fun _ _ => False) 0 2 :=
  undetermined_of_not_generatedCoReference_of_no_distinct
    exampleAccount () example_not_generated_zero_two

end SETest.Coreference.ContextualCommitments
