
study_data <-
  list(
    'Northwick Park' =
      list(
        N = 259,
        month = 7 + 0.5*7,
        cost = c(nurse = 3801)),
    'West Middlesex' =
      list(
        N = 778,
        month = 7 + 0.5*17,
        cost = c(nurse = 3801)))

N_per_month <- purrr::map(study_data,
                          function(x) x$N/x$month)

nurse_cost_per_patient <- purrr::map(study_data,
                                     function(x) x$cost['nurse']*x$month/x$N)
