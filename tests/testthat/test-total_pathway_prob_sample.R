context("test-total_pathway_prob_sample.R")

library(treeSimR)
library(purrr)
library(data.tree)

osNode <- readRDS(file = paste0("../../data/", "osNode_cost.Rds"))
# osNode <- readRDS(file = paste0("data/", "osNode_cost.Rds"))


##TODO: strange error

test_that("check root values", {

  expect_equal(total_pathway_prob_sample(osNode,
                                         pathString = osNode$pathString,
                                         N.mc = 1),
               osNode$p)

  expect_equal(total_pathway_prob_sample(osNode,
                                         pathString = osNode$pathString,
                                         N.mc = 1),
               osNode$path_probs)
})
