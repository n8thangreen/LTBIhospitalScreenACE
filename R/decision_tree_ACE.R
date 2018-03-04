
#' Decision Tree for ACE project
#'
#' Calculate decision tree expected costs and QALY loss
#' for N simulations
#'
#' @param parameters
#' @param N.mc
#' @param cost_dectree Rds file names
#' @param health_dectree Rds file names
#'
#' @return
#' @export
#'
#' @examples
#'
decision_tree_ACE <- function(parameters,
                              N.mc = 2,
                              cost_dectree = "osNode_cost.Rds",
                              health_dectree = "osNode_health.Rds",
                              LTBI_pathString){

  mcall <- match.call()

  osNode.cost <- readRDS(file = paste0("data/", cost_dectree))
  osNode.health <- readRDS(file = paste0("data/", health_dectree))

  assign_branch_values(osNode.cost,
                       osNode.health,
                       parameter_p = subset(parameters, val_type == "QALYloss"),
                       parameter_cost = subset(parameters, val_type == "cost"))

  LTBI_Dx_prob <- total_pathway_prob_sample(osNode.cost,
                                            pathString = LTBI_pathString,
                                            N.mc)

  LTBI_Dx_ssize <- patient_level_ssize_sample(osNode = osNode.cost,
                                              pathString = LTBI_pathString,
                                              N.mc = N.mc)

  mc_cost <- MonteCarlo_expectedValues(osNode = osNode.cost,
                                       n = N.mc)

  mc_health <- MonteCarlo_expectedValues(osNode = osNode.health,
                                         n = N.mc)

  list(osNode_cost = osNode.cost,
       osNode_health = osNode.health,
       mc_cost = as.numeric(mc_cost$`expected values`),
       mc_health = as.numeric(mc_health$`expected values`),
       LTBI_Dx_prob = LTBI_Dx_prob,
       LTBI_Dx_ssize = LTBI_Dx_ssize,
       call = mcall,
       N.mc = N.mc)
}
