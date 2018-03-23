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

#########k
# model #
#########

res <- mapply(FUN = decision_tree_ACE,
              scenario_parameters,
              N.mc = 20,
              cost_dectree = "osNode_cost.Rds",
              health_dectree = "osNode_cost.Rds",
              LTBI_pathString = "LTBI screening cost/LTBI/Agree to Screen/Sensitivity", # GP forwards
              # LTBI_pathString = "LTBI screening cost/Agree to Screen/Positive/PPV", # GP backwards
              # LTBI_pathString = "LTBI screening cost/LTBI/Sensitivity", # A&E forwards
              # LTBI_pathString = "LTBI screening cost/Positive/PPV", # A&E backwards
              # N = c(n_NPH, n_NPH, # QFT-GIT/gold (backwards)
              #       n_WMH, n_WMH,
              #       n_all, n_all),
              N = c(n_NPH, n_NPH, n_NPH, # prevalence (forwards)
                    n_WMH, n_WMH, n_WMH,
                    n_all, n_all, n_all),
              SIMPLIFY = FALSE,
              USE.NAMES = FALSE)

save(res, file = "data/res.RData")
