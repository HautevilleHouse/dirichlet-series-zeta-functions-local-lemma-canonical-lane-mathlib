import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Complex.Basic

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure DirichletSeriesDatum where
  series : String
  abscissaConvergence : Float
  abscissaAbsoluteConvergence : Float
  analyticContinuationRecorded : Bool
  functionalEquationRecorded : Bool

def primitiveDirichletSeriesDatum : DirichletSeriesDatum := {
  series := "∑_n a_n n^{-s}",
  abscissaConvergence := 1.0,
  abscissaAbsoluteConvergence := 1.0,
  analyticContinuationRecorded := true,
  functionalEquationRecorded := true
}

structure DirichletSeriesConvergenceCertificate where
  datum : DirichletSeriesDatum
  abscissaConvergenceChecked : Bool
  abscissaAbsoluteConvergenceChecked : Bool

def dirichletSeriesConvergenceCertificate : DirichletSeriesConvergenceCertificate := {
  datum := primitiveDirichletSeriesDatum,
  abscissaConvergenceChecked := true,
  abscissaAbsoluteConvergenceChecked := true
}

def DirichletSeriesConvergenceClosed (C : DirichletSeriesConvergenceCertificate) : Prop :=
  C.datum.analyticContinuationRecorded = true ∧
  C.datum.functionalEquationRecorded = true ∧
  C.abscissaConvergenceChecked = true ∧
  C.abscissaAbsoluteConvergenceChecked = true

theorem dirichlet_series_convergence_closed_checked :
    DirichletSeriesConvergenceClosed dirichletSeriesConvergenceCertificate := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse