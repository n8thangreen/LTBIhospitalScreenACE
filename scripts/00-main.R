# *******************************************
# LTBI screening ACE
# N Green
#
# high-level global scenario runner
# for a (deterministic) sensitivity analysis
# of screening programme
#
# *******************************************


rm(list = ls())

devtools::load_all(".")


########
# data #
########

source("scripts/02-data-prep_cost-effectiveness.R", echo = TRUE)

source("scripts/03-prep-decisiontree.R", echo = TRUE)

source("scripts/04-data-prep_modelling.R", echo = TRUE)

source("scripts/05-prep-folders.R", echo = TRUE)


#########
# model #
#########

source("scripts/06-parallel-decision-tree.R", echo = TRUE)
