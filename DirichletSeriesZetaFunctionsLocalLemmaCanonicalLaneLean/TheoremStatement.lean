import HautevilleHouse.DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.Formalization

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  localLemmaStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary.claimBoundary,
  localLemmaStatement := "local lemma for Dirichlet series and zeta functions, internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
  certificateLane := baselineCertificateLane,
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

def ClassicalSourceBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  formalizationCertificate.sourceConjectureClosureClaimed = false

def LocalLemmaLayerInternalized : Prop :=
  sourceTheoremStatement.sourceKey = sourceRepository ∧
  sourceTheoremStatement.certificateLane = baselineCertificateLane ∧
  ClassicalSourceBoundaryCarried

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  rfl

theorem theorem_statement_certificate_lane_checked :
    sourceTheoremStatement.certificateLane = baselineCertificateLane := by
  rfl

theorem classical_source_boundary_carried_checked :
    ClassicalSourceBoundaryCarried := by
  exact And.intro rfl rfl

theorem local_lemma_layer_internalized_checked :
    LocalLemmaLayerInternalized := by
  refine And.intro ?_ (And.intro ?_ classical_source_boundary_carried_checked)
  · rfl
  · rfl

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse