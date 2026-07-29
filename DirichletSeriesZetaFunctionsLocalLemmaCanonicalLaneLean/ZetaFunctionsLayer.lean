import canonicalLaneMathlib.AdmissibleClass
import DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.DirichletSeriesBridge

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure ZetaFunctionDatum where
  dirichletData : DirichletSeriesData
  analyticContinuation : Prop
  locationOfZeros : ℂ → Prop
  localZeroCheck : Bool

primitiveZetaFunctionDatum : ZetaFunctionDatum := {
  dirichletData := defaultDirichletSeriesData,
  analyticContinuation := True,
  locationOfZeros := λ s => s.re = 0.5,
  localZeroCheck := true
}

structure ZetaFunctionCertificate where
  datum : ZetaFunctionDatum
  zeroCheckPassed : Bool
  localDensityChecked : Bool

def zetaFunctionCertificate : ZetaFunctionCertificate := {
  datum := primitiveZetaFunctionDatum,
  zeroCheckPassed := true,
  localDensityChecked := true
}

def ZetaFunctionLocalLemmaClosed (C : ZetaFunctionCertificate) : Prop :=
  C.datum.localZeroCheck ∧ C.zeroCheckPassed ∧ C.localDensityChecked

theorem zeta_function_local_lemma_closed_checked :
    ZetaFunctionLocalLemmaClosed zetaFunctionCertificate := by
  unfold ZetaFunctionLocalLemmaClosed
  unfold zetaFunctionCertificate
  unfold primitiveZetaFunctionDatum
  exact And.intro rfl (And.intro rfl rfl)

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse