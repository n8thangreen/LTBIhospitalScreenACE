
#' Total pathway probability sample
#'
#' @param osNode Decision tree object.
#' @param pathString Route from root to leaf. Node names separated by /.
#' @param N.mc Number of samples.
#'
#' @return Vector of probabilities.
#' @export
#'
#' @examples
#'
total_pathway_prob_sample <- function(osNode,
                                      pathString,
                                      N.mc = 2){

  path_prob <- vector(mode = "double", length = N.mc)

  for (i in seq_len(N.mc)) {

    # sample p
    if (all(c("pmin", "pmax") %in% osNode$fields)) {

      rprob <- osNode$Get(sampleNodeUniform)
      osNode$Set(p = rprob)
    }

    all_path_probs <- calc_pathway_probs(osNode, FUN = "product")
    osNode$Set(path_probs = all_path_probs)
    path_prob[i] <- osNode$Get("path_probs",
                               filterFun = function(x) x$pathString == pathString)
  }

  path_prob
}

