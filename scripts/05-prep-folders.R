#*****************************************************
# project: LTBI screening ACE
# N Green
# Oct 2016
#
# simulation specific constants


N.mc <- 10 # number of Monte Carlo iterations
study <- "QFT"

scenario_name <- ""

# # create permanent output folder
diroutput <- sprintf("ext-data/output")
dir.create(diroutput, showWarnings = FALSE)

plots_folder <- system.file("plots",
                            package = "LTBIhospitalScreenACE")

plots_folder_scenario <- sprintf("%s/%s", plots_folder, scenario_name)
dir.create(plots_folder_scenario, showWarnings = FALSE)

output_filename <- sprintf("decisiontree-results_%s_%s.rds", scenario_name,
                           format(Sys.time(), "%Y-%m-%d %I-%p"))

