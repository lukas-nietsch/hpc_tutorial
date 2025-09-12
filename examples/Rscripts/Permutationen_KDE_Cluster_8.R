# packages ----------------------------------------------------------------
set.seed(2305)
library(hypervolume)
library(here)

# load data ---------------------------------------------------------------
load(here("data/hv_succession_KDE.RData"))

# permutations ------------------------------------------------------------

# SM - SA - 8
hv_kde_permute_SM_SA <- hypervolume_permute(
  "permutations_KDE_pairwise/SM_SA/",
  hv1 = hv_succession_KDE[[3]],
  hv2 = hv_succession_KDE[[4]],
  n = 100,
  cores = 100
)