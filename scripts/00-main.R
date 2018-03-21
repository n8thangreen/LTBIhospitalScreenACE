# *******************************************
# LTBI screening ACE
# N Green
#
# high-level script
# for a (deterministic) sensitivity analysis
# of screening programme
#
# *******************************************


rm(list = ls())

devtools::load_all(".")

library(LTBIscreeningproject)
library(purrr)
library(data.tree)
library(treeSimR)


########
# data #
########

source("scripts/03-prep-decisiontree.R", echo = TRUE)
source("scripts/05-prep-folders.R", echo = TRUE)

#########
# model #
#########

res <- mapply(FUN = decision_tree_ACE,
              scenario_parameters,
              N.mc = 20,
              cost_dectree = "osNode_cost.Rds",
              health_dectree = "osNode_cost.Rds",
              # LTBI_pathString = "LTBI screening cost/LTBI/Sensitivity",
              LTBI_pathString = "LTBI screening cost/Positive/PPV",
              N = c(n_NPH, n_NPH, # predictive QFT GIT/gold
                    n_WMH, n_WMH,
                    n_all, n_all),
              # N = c(n_NPH, n_NPH, n_NPH, # sens/spec over prevalence
              #       n_WMH, n_WMH, n_WMH,
              #       n_all, n_all, n_all),
              SIMPLIFY = FALSE,
              USE.NAMES = FALSE)

save(res, file = "data/res.RData")
