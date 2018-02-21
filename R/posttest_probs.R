# Medical decision-making: Probabilistic medical reasoning,
# Owens, DK Sox, HC, Medical Informatics, 2001


#' posttest_pos
#'
#' P(Disease+|Test+)
#'
#' @param prev prevalence, probability
#' @param sens sensitivity, probability
#' @param spec specificity, probability
#'
#' @return
#' @export
#'
#' @examples
posttest_pos <- function(prev,
                         sens,
                         spec){
  TP <- prev * sens
  FP <- (1 - prev) * (1 - spec)

  TP/(TP + FP)
}


#' posttest_neg
#'
#' P(Disease+|Test-)
#'
#' @param prev prevalence, probability
#' @param sens sensitivity, probability
#' @param spec specificity, probability
#'
#' @return
#' @export
#'
#' @examples
posttest_neg <- function(prev,
                         sens,
                         spec){
  FN <- prev * (1 - sens)
  TN <- (1 - prev) * spec

  FN/(FN + TN)
}


posttest_pos_aggregate <- function(n_pos,
                                   n_neg,
                                   sens,
                                   spec,
                                   prev) {

  N <- n_pos + n_neg

  lik_pos <- choose(n_pos, N) * sens^n_pos * (1 - sens)^n_neg
  lik_neg <- choose(n_neg, N) * spec^n_neg * (1 - spec)^n_pos

  (lik_pos*prev)/(lik_pos*prev + lik_neg*(1 - prev))
}

# Prevalence estimation when disease status is verified only among test
# positives: Applications in HIV screening programs, G. Thomas, Emma, B. Peskoe,
# Sarah, Spiegelman, Donna, Statistics in Medicine, 2017
#
# posttest_prob <- ((n_pos/N) + spec - 1)/(sens + spec - 1)
# posttest_var <-



