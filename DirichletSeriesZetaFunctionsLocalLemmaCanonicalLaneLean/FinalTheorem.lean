import canonicalLaneMathlib.AdmissibleClass
import DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.DirichletSeriesBridge
import DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.ZetaFunctionsLayer
import DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean.LocalDensityLayer

namespace HautevilleHouse
namespace DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean

def ConstrainedDirichletZetaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ LocalDensityClosed localDensityCertificate

theorem constrained_dirichlet_zeta_endgame (A : AdmissibleClass) :
    ConstrainedDirichletZetaClosure A := by
  unfold ConstrainedDirichletZetaClosure
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact bridge_from_admissible_class A
  · exact gate_from_admissible_class A
  · exact local_density_closed_checked

end DirichletSeriesZetaFunctionsLocalLemmaCanonicalLaneLean
end HautevilleHouse