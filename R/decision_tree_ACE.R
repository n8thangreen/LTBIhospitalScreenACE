
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
                              health_dectree = "osNode_health.Rds"){

  mcall <- match.call()

  osNode.cost <- readRDS(file = cost_dectree)
  osNode.health <- readRDS(file = health_dectree)

  assign_branch_values(osNode.cost,
                       osNode.health,
                       parameter_p = subset(parameters, val_type == "QALYloss"),
                       parameter_cost = subset(parameters, val_type == "cost"))

  path_probs.screen <- calc_pathway_probs(osNode.cost)
  osNode.cost$Set(path_probs = path_probs.screen)

  mc_cost <- MonteCarlo_expectedValues(osNode = osNode.cost,
                                       n = N.mc)

  mc_health <- MonteCarlo_expectedValues(osNode = osNode.health,
                                         n = N.mc)

  list(mc_cost = as.numeric(mc_cost$`expected values`),
       mc_health = as.numeric(mc_health$`expected values`),
       call = mcall,
       N.mc = N.mc)
}

