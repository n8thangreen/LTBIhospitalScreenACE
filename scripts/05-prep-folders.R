#*****************************************************
# project: LTBI screening ACE
# N Green
# Oct 2016
#
# simulation specific constants


# # create permanent output folder
diroutput <- sprintf("ext-data/output")
dir.create(diroutput, showWarnings = FALSE)

plots_folder <- system.file("plots",
                            package = "LTBIhospitalScreenACE")

dir.create(plots_folder, showWarnings = FALSE)

output_filename <- sprintf("decisiontree-results_%s.rds",
                           format(Sys.time(), "%Y-%m-%d %I-%p"))

