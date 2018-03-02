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

res <- lapply(scenario_parameters,
              decision_tree_ACE,
              N.mc = N.mc,
              cost_dectree = "osNode_cost.Rds",
              health_dectree = "osNode_cost.Rds",
              LTBI_pathString = "LTBI screening cost/Agree to Screen/Positive/PPV")
