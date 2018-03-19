#******************************************************
# LTBI screening model ACE
# N Green
# Sept 2017
#
# prep scenario decision tree data
# deterministic sensitivity analysis


n_NPH <- 395
n_WMH <- 719
n_all <- n_NPH + n_WMH

# deterministic scenario data ---------------------------------------------

# there are 2 decision tree arrangements:
#  - prevalence is 'known' -> sensitivity and specificity used
#  - number of positive test results is known -> PPV and NPV used

parameter_values_file <- system.file("data", "scenario_parameters.xlsx",
# parameter_values_file <- system.file("data", "scenario_parameters_predicted.xlsx",
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

if (nrow(scenario_parameter_cost) > 0) scenario_parameter_cost$val_type <- "cost"
if (nrow(scenario_parameter_p.melt) > 0) scenario_parameter_p.melt$val_type <- "QALYloss"

scenario_parameters <- dplyr::bind_rows(scenario_parameter_cost,
                                        scenario_parameter_p.melt)

# split by scenario to lists
scenario_parameters <- split(x = scenario_parameters,
                             f = scenario_parameters$scenario)


save(scenario_parameters, file = "data/scenario_parameters.RData")


# yaml tree ---------------------------------------------------------------

# different trees for if p is specified
# as uniform distn or point values

yaml_filename <- "decision_tree_allscreen_p.yaml" #"decision_tree_predictive_allscreen_p.yaml" #"decision_tree_predictive.yaml" #decision_tree.yaml

# osNode.cost.fileName <- system.file("data", "decision_tree.yaml",
osNode.cost.fileName <- system.file("data", yaml_filename,
                                    package = "LTBIhospitalScreenACE")

costeff.cost <- treeSimR::costeffectiveness_tree(yaml_tree = osNode.cost.fileName)
osNode.cost <- costeff.cost$osNode

data_folder <- system.file("data", package = "LTBIhospitalScreenACE")

save(osNode.cost, file = paste0(data_folder, "/osNode_cost.RData"))
saveRDS(osNode.cost, file = paste0(data_folder, "/osNode_cost.Rds"))
