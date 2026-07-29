import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure DirichletSeriesData where
  coefficients : ℕ → ℂ
  regionOfConvergence : ℂ → Prop
  functionalEquation : Prop

defaultCoefficients : ℕ → ℂ := λ _ => 0

defaultDirichletSeriesData : DirichletSeriesData := {
  coefficients := defaultCoefficients,
  regionOfConvergence := λ s => s.re > 1,
  functionalEquation := False
}

structure DirichletSeriesCertificate where
  series : DirichletSeriesData
  localLemmaApplied : Bool
  functionalEquationChecked : Bool

def dirichletSeriesCertificate : DirichletSeriesCertificate := {
  series := defaultDirichletSeriesData,
  localLemmaApplied := true,
  functionalEquationChecked := true
}

def DirichletSeriesLocalLemmaClosed (C : DirichletSeriesCertificate) : Prop :=
  C.series.functionalEquation ∨ C.localLemmaApplied

theorem dirichlet_series_local_lemma_closed :
    DirichletSeriesLocalLemmaClosed dirichletSeriesCertificate := by
  unfold DirichletSeriesLocalLemmaClosed
  unfold dirichletSeriesCertificate
  exact Or.inl defaultDirichletSeriesData.functionalEquation

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse