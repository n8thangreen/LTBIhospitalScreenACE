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


#' posttest_pos_aggregate
#'
#' ##TODO: not sure this is correct...
#' issues with large sample sizes and small probabilities
#'
#' \deqn{}
#'
#' @param n_pos Number of positive test results
#' @param n_neg Number of negative test results
#' @param sens Test sensitivity
#' @param spec Test specificity
#' @param prev Prevalance
#'
#' @return
#' @export
#'
#' @examples
posttest_pos_aggregate <- function(n_pos,
                                   n_neg,
                                   sens,
                                   spec,
                                   prev) {

  N <- n_pos + n_neg

  # lik_pos <- choose(N, n_pos) * sens^n_pos * (1 - sens)^n_neg
  lik_pos <- exp(lchoose(N, n_pos) + n_pos*log(sens) + n_neg*log(1 - sens))
  lik_neg <- exp(lchoose(N, n_neg) + n_neg*log(spec) + n_pos*log(1 - spec))

  (lik_pos*prev)/(lik_pos*prev + lik_neg*(1 - prev))
}

# Prevalence estimation when disease status is verified only among test
# positives: Applications in HIV screening programs, G. Thomas, Emma, B. Peskoe,
# Sarah, Spiegelman, Donna, Statistics in Medicine, 2017
#
# posttest_prob <- ((n_pos/N) + spec - 1)/(sens + spec - 1)
# posttest_var <-



