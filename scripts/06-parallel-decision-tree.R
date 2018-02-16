#****************************************************************
# LTBI screening model ACE
# N Green
# Aug 2017


# library(parallel)

if (getwd() != "Q:/R/cluster--LTBI-decision-tree") {
  exit_wd <- getwd()}

setwd("Q:/R/cluster--LTBI-decision-tree")

# update local cluster folder data
file.copy(from = paste0(data_folder, "/scenario_parameters.RData"),
          to = "scenario_parameters.RData", overwrite = TRUE)
file.copy(from = paste0(data_folder, "/osNode_cost.Rds"),
          to = "osNode_cost.Rds", overwrite = TRUE)

# sync functions
#
# syncr::syncr(src = "C:/Users/ngreen1/Dropbox/TB/IDEA/R/packages/treeSimR/R/assign_branch_values.R",
#              dest = "Q:/R/cluster--LTBI-decision-tree")
#
# syncr::syncr(src = "C:/Users/ngreen1/Dropbox/TB/IDEA/R/packages/treeSimR/R/assign_branch_vals.R",
#              dest = "Q:/R/cluster--LTBI-decision-tree")
#
# syncr::syncr(src = "C:/Users/ngreen1/Dropbox/TB/IDEA/R/packages/treeSimR/R/payoff.R",
#              dest = "Q:/R/cluster--LTBI-decision-tree")
#
# syncr::syncr(src = "C:/Users/ngreen1/Dropbox/TB/IDEA/R/packages/treeSimR/R/calc_expectedValues",
#              dest = "Q:/R/cluster--LTBI-decision-tree")
#
# syncr::syncr(src = "C:/Users/ngreen1/Dropbox/TB/IDEA/R/packages/treeSimR/R/calc_pathway_probs",
#              dest = "Q:/R/cluster--LTBI-decision-tree")
#
# syncr::syncr(src = "C:/Users/ngreen1/Dropbox/TB/IDEA/R/packages/treeSimR/R/sample_distributions.R",
#              dest = "Q:/R/cluster--LTBI-decision-tree")

source("decision_tree_cluster.R")


# parallel config ---------------------------------------------------------

# Calculate the number of cores
no_cores <- detectCores() - 1

# Initiate cluster
cl <- makeCluster(no_cores, outfile = "temp_logfile.txt")

n.uk_tb <- 1
n.exit_tb <- 1

clusterExport(cl, "n.uk_tb")
clusterExport(cl, "n.exit_tb")
clusterExport(cl, "N.mc")

clusterEvalQ(cl, library(data.tree))
clusterEvalQ(cl, library(dplyr))
clusterEvalQ(cl, library(treeSimR))

clusterEvalQ(cl, source("subset_pop_dectree.R"))
clusterEvalQ(cl, source("myToDataFrame_fns.R"))
# clusterCall(cl, function() { source("subset_pop_dectree.R") })

set.seed(12345)

ptm <- proc.time()

dectree_res <- parLapplyLB(cl,
                           scenario_parameters,
                           fun = decision_tree_cluster,
                           N.mc = N.mc,
                           n.uk_tb = n.uk_tb,
                           n.exit_tb = n.exit_tb,
                           cost_dectree = "osNode_cost.Rds",
                           health_dectree = "osNode_cost.Rds")
proc.time() - ptm

stopCluster(cl)


# save --------------------------------------------------------------------

save(dectree_res, file = paste(exit_wd, diroutput, "dectree_res.RData", sep = "/"))


setwd(exit_wd)


##to debug
res <- lapply(scenario_parameters,
              decision_tree_cluster,
              N.mc = N.mc,
              n.uk_tb = n.uk_tb,
              n.exit_tb = n.exit_tb,
              cost_dectree = "osNode_cost.Rds",
              health_dectree = "osNode_cost.Rds")

xx <- decision_tree_cluster(parameters = scenario_parameters[[1]],
                            n.uk_tb = 10,
                            n.exit_tb = 10,
                            cost_dectree = "osNode_cost.Rds",
                            health_dectree = "osNode_cost.Rds")


