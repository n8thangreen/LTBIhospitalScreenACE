
#' Posterior LTBI probability
#'
#' Conditional on having 'survived' up to time \code{t}.
#'
#' @param p_LTBI Probability.
#' @param t Time (positive integer).
#'
#' @return Probability
#' @export
#'
#' @examples
#'
#' (0.975*0.975*0.99*0.3)/(0.975*0.975*0.99*0.3 + 0.7)
#' posterior_LTBI_prob(0.3, 3)
#'
posterior_LTBI_prob <- function(p_LTBI,
                                t) {

  annual_risk <- 1 - c(0.025, 0.025, rep(0.01, 100)) #Mullie (2017)

  p_not_progress_by_t <- prod(annual_risk[seq_len(t)])

  posterior <- (p_not_progress_by_t * p_LTBI)/(p_not_progress_by_t*p_LTBI + (1 - p_LTBI))

  return(posterior)
}


