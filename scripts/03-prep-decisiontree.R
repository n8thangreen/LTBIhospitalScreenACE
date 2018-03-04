#******************************************************
# LTBI screening model ACE
# N Green
# Sept 2017
#
# prep scenario decision tree data
# deterministic sensitivity analysis


N.mc <- 10 # number of Monte Carlo iterations


# deterministic scenario data ---------------------------------------------

# parameter_values_file <- system.file("data", "scenario_parameters.xlsx",
parameter_values_file <- system.file("data", "scenario_parameters_predicted.xlsx",
                                     package = "LTBIhospitalScreenACE")

scenario_parameter_cost <- readxl::read_excel(parameter_values_file,
                                              sheet = "cost")

scenario_parameter_p <- readxl::read_excel(parameter_values_file,
                                           sheet = "p")

# transform to long format

scenario_parameter_p.melt <-
  as.data.frame(scenario_parameter_p) %>%
  reshape2::melt(id.vars = "scenario") %>%
  plyr::rename(replace = c("variable" = "node",
                           "value" = "p"))

# combine probs and costs in to a single array

scenario_parameter_cost$val_type <- "cost"
scenario_parameter_p.melt$val_type <- "QALYloss"

scenario_parameters <- dplyr::bind_rows(scenario_parameter_cost,
                                        scenario_parameter_p.melt)

# split by scenario to lists
scenario_parameters <- split(x = scenario_parameters,
                             f = scenario_parameters$scenario)


save(scenario_parameters, file = "data/scenario_parameters.RData")


# yaml tree ---------------------------------------------------------------

yaml_filename <- "decision_tree_predictive_allscreen.yaml" #"decision_tree_predictive.yaml" #decision_tree.yaml

# osNode.cost.fileName <- system.file("data", "decision_tree.yaml",
osNode.cost.fileName <- system.file("data", yaml_filename,
                                    package = "LTBIhospitalScreenACE")

costeff.cost <- treeSimR::costeffectiveness_tree(yaml_tree = osNode.cost.fileName)
osNode.cost <- costeff.cost$osNode

data_folder <- system.file("data", package = "LTBIhospitalScreenACE")

save(osNode.cost, file = paste0(data_folder, "/osNode_cost.RData"))
saveRDS(osNode.cost, file = paste0(data_folder, "/osNode_cost.Rds"))
