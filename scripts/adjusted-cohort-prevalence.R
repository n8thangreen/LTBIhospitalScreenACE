#
# calculate LTBI prevalence in A&E high-risk cohort
# N Green
# Feb 2018
#


# join with incidence in country of origin data
# baseline prevalence


# adjust for time in country

posterior_LTBI_prob(p_LTBI,
                    t)

# adjust for test result

## for individual-level LTBI test data

sens <- 0
spec <- 0
test_results <- c(T,T,F,F,F,T)
pretest_probLTBI <- c(0.3, 0.2, 0.1, 0.3, 0.2, 0.1)

posttest_probLTBI <-
  pretest_probLTBI %>%
  purrr::map_if(.p = test_results,
                .f = posttest_pos,
                sens = sens,
                spec = spec) %>%
  purrr::map_if(.p = !test_results,
                .f = posttest_neg,
                sens = sens,
                spec = spec) %>% unlist()

## for aggregated data

n <- table(test_results)
pretest_cohort_prev <- mean(pretest_probLTBI)

posttest_probLTBI <-
  posttest_pos_aggregate(n_pos = n['TRUE'],
                         n_neg = n['FALSE'],
                         sens,
                         spec,
                         prev = pretest_cohort_prev)
