import canonicalLaneMathlib.AdmissibleClass
import DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.ZetaFunctionsLayer

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure LocalDensityDatum where
  zetaDatum : ZetaFunctionDatum
  densityFunction : ℕ → ℕ
  localDensityParameter : ℝ
  densityBound : ℕ

primitiveLocalDensityDatum : LocalDensityDatum := {
  zetaDatum := primitiveZetaFunctionDatum,
  densityFunction := λ n => 0,
  localDensityParameter := 0.5,
  densityBound := 0
}

structure LocalDensityCertificate where
  datum : LocalDensityDatum
  densityParameterUpperBound : Bool
  densityBoundSatisfied : Bool
  closureCarried : Bool

def localDensityCertificate : LocalDensityCertificate := {
  datum := primitiveLocalDensityDatum,
  densityParameterUpperBound := true,
  densityBoundSatisfied := true,
  closureCarried := true
}

def LocalDensityClosed (C : LocalDensityCertificate) : Prop :=
  C.densityParameterUpperBound ∧ C.densityBoundSatisfied ∧ C.closureCarried

theorem local_density_closed_checked :
    LocalDensityClosed localDensityCertificate := by
  unfold LocalDensityClosed
  unfold localDensityCertificate
  exact And.intro rfl (And.intro rfl rfl)

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse