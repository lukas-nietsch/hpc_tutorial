# packages ----------------------------------------------------------------
set.seed(2305)
library(hypervolume)
library(here)

# load data ---------------------------------------------------------------
load(here("data/hv_succession_KDE.RData"))

# permutations ------------------------------------------------------------

# SM - TG - 9
hv_kde_permute_SM_TG <- hypervolume_permute(
  "permutations_KDE_pairwise/SM_TG/",
  hv1 = hv_succession_KDE[[3]],
  hv2 = hv_succession_KDE[[5]],
  n = 100,
  cores = 100
)