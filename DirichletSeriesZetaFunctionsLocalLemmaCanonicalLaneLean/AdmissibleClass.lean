import canonicalLaneMathlib.AdmissibleClass
import DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.LocalLemmaLayer

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

structure DirichletSeriesAdmissibleClass where
  object : DirichletSeriesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : DirichletSeriesAdmissibleClass) : Prop :=
  bridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

structure DirichletSeriesAdmittedObject where
  localDatum : LocalLemmaDatum
  convergenceCertificate : DirichletSeriesConvergenceCertificate
  zetaCertificate : ZetaFunctionLayerCertificate
  localLemmaCertificate : LocalLemmaCertificate
  classicalRemainderCarried : Bool

def primitiveDirichletSeriesAdmittedObject : DirichletSeriesAdmittedObject := {
  localDatum := primitiveLocalLemmaDatum,
  convergenceCertificate := dirichletSeriesConvergenceCertificate,
  zetaCertificate := zetaFunctionLayerCertificate,
  localLemmaCertificate := localLemmaCertificate,
  classicalRemainderCarried := true
}

def bridgeClosed (O : DirichletSeriesAdmittedObject) : Prop :=
  DirichletSeriesConvergenceClosed O.convergenceCertificate ∧
  ZetaFunctionLayerClosed O.zetaCertificate ∧
  LocalLemmaLayerClosed O.localLemmaCertificate

def gateClosed (A : DirichletSeriesAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : DirichletSeriesAdmissibleClass) :
    bridgeClosed A.object := by
  exact And.intro dirichlet_series_convergence_closed_checked
    (And.intro zeta_function_layer_closed_checked local_lemma_layer_closed_checked)

theorem gate_from_admissible_class (A : DirichletSeriesAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse