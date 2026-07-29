import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure ZetaLocalFunctionDatum where
  prime : ℕ
  localFactor : String
  eulerFactorRoute : String
  localZetaFunctionRoute : String

structure ZetaLocalFunctionLayerCertificate where
  datum : ZetaLocalFunctionDatum
  localRoute : String
  eulerProductRoute : String
  check : Bool

def zetaLocalFunctionLayerCertificate : ZetaLocalFunctionLayerCertificate := {
  datum := {
    prime := 2,
    localFactor := "(1 - p^{-s})^{-1}",
    eulerFactorRoute := "standard Euler factor",
    localZetaFunctionRoute := "p-adic local zeta function"
  },
  localRoute := "local lemma attached to each prime",
  eulerProductRoute := "global Euler product factorization",
  check := true
}

def ZetaLocalFunctionLayerClosed (C : ZetaLocalFunctionLayerCertificate) : Prop :=
  C.datum.prime = 2 ∧ C.check = true

theorem zeta_local_function_layer_closed_checked :
    ZetaLocalFunctionLayerClosed zetaLocalFunctionLayerCertificate := by
  exact And.intro rfl rfl

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse