
#' patient_level_ssize_sample
#'
#' @param n Initial patient cohort size
#' @param osNode decision tree
#'
#' @return Sampled patient subset size
#' @export
#'
#' @examples
patient_level_ssize_sample <- function(N = 1114,
                                       osNode,
                                       pathString,
                                       N.mc) {

  LEVELS <- seq_len(osNode$height)[-1]

  path_ssize <- vector(mode = "double", length = N.mc)

  for (mc in seq_len(N.mc)) {

    n <- N

    for (i in LEVELS) {

      n_subset <- rep(n, each = 2)
      probs_branch <- osNode$Get('p', filterFun = function(x) x$level == i)
      odd_index <- seq(from = 1, to = length(probs_branch), by = 2)

      for (j in odd_index) {

        n[j] <- rbinom(n = 1,
                       size = n_subset[j],
                       prob = probs_branch[j])
        n[j + 1] <- n_subset[j] - n[j]
      }

      osNode$Set(n_sampled = n, filterFun = function(x) x$level == i)
    }

    path_ssize[mc] <- osNode$Get("n_sampled",
                                 filterFun = function(x) x$pathString == pathString)
  }

  return(path_ssize)
}
