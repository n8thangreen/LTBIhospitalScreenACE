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
#' ##TODO: check maths
#'
#' See Modeling in Medical Decision Making: A Bayesian Approach
#' Giovanni Parmigiani book example
#'
#' Currently, only computes with pmf for prevalence of two probabilities
#' i.e. p(x=1)=prevalence
#' so then the likelihood reeduces to sensitivity and specificity
#' if using a distn for prevalence eg beta/uniform
#' then will need to integrate denominator.
#'
#' @param n_pos Number of positives
#' @param n_neg Number of negatives
#' @param sens Sensitivity
#' @param spec Specificity
#' @param prev Prevalence
#'
#' @return
#' @export
#'
#' @examples
#'
#' posttest_pos_aggregate(n_pos = 10, n_neg = 10, sens = 0.9, spec = 0.9, prev = 0.1)
#'
posttest_pos_aggregate <- function(n_pos,
                                   n_neg,
                                   sens,
                                   spec,
                                   prev) {

  # prob_pos <- prev*sens + (1 - prev)*(1 - spec)
  # prob_neg <- prev*(1 - sens) + (1 - prev)*spec

  prob_pos <- sens
  prob_neg <- spec

  lik_pos <- prob_pos^n_pos * (1 - prob_pos)^n_neg
  lik_neg <- (1 - prob_neg)^n_pos * prob_neg^n_neg

  (lik_pos*prev)/(lik_pos*prev + lik_neg*(1 - prev))
}


##TODO:
# Prevalence estimation when disease status is verified only among test
# positives: Applications in HIV screening programs, G. Thomas, Emma, B. Peskoe,
# Sarah, Spiegelman, Donna, Statistics in Medicine, 2017
#
# posttest_prob <- ((n_pos/N) + spec - 1)/(sens + spec - 1)
# posttest_var <-



