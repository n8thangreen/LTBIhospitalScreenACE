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
n_aldridge <- 514968/7*0.325 # 'study total'/years*'GP registration'


# deterministic scenario data ---------------------------------------------

# there are 2 decision tree arrangements:
#  - prevalence is 'known' -> sensitivity and specificity used ['forwards' model]
#  - number of positive test results is known -> PPV and NPV used ['backwards' model]

parameter_values_file <- system.file("data", "scenario_parameters.xlsx", # forwards
# parameter_values_file <- system.file("data", "scenario_parameters_predictive.xlsx", #backwards
                                     package = "LTBIhospitalScreenACE")

scenario_parameter_cost <- readxl::read_excel(parameter_values_file,
                                              sheet = "cost")

scenario_parameter_p <- readxl::read_excel(parameter_values_file,
                                           sheet = "p")

# transform to long format

scenario_parameter_p.melt <-
  as.data.frame(scenario_parameter_p) %>%
  reshape2::melt(id.vars = "scenario") %>%
  plyr::rename(x = .,
               replace = c("variable" = "node",
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

# different trees for if p (branch probabilities) are specified
# as uniform distn or point values

# yaml_filename <- "decision_tree_predictive_GP.yaml"
yaml_filename <- "decision_tree_GP.yaml"
# yaml_filename <- "decision_tree_A&E_p.yaml"
# yaml_filename <- "decision_tree_predictive_A&E_p.yaml"

osNode.cost.fileName <- system.file("data", yaml_filename,
                                    package = "LTBIhospitalScreenACE")

costeff.cost <- treeSimR::costeffectiveness_tree(yaml_tree = osNode.cost.fileName)
osNode.cost <- costeff.cost$osNode

data_folder <- system.file("data", package = "LTBIhospitalScreenACE")

save(osNode.cost, file = paste0(data_folder, "/osNode_cost.RData"))
saveRDS(osNode.cost, file = paste0(data_folder, "/osNode_cost.Rds"))
