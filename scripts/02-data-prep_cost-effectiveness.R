#
# project: LTBI screening ACE
# N Green
# Oct 2016


#########
# costs #
#########

unit_cost <- list()


# LTBI --------------------------------------------------------------------

# LFT test
unit_cost$LFT_test <- QALY::inflation_adjust_cost(from_year = 2013,
                                                  to_year = 2016,
                                                  from_cost = 2.69,
                                                  reference = "Lilford (2013)")

# hepatitis B, C test
unit_cost$hep_test <- QALY::inflation_adjust_cost(from_year = 2013,
                                                  to_year = 2016,
                                                  from_cost = 25.42,
                                                  reference = "Lilford (2013)")
# HIV test
unit_cost$HIV_test <- QALY::inflation_adjust_cost(from_year = 2011,
                                                  to_year = 2016,
                                                  from_cost = 8,
                                                  reference = "Health Protection Agency (2011)")

# unit_cost$HIV_test <- list(distn = "pert",
#                            params = c(mode = unit_cost$HIV_test,
#                                       min = 4.5,
#                                       max = 13.5))


# NHS England. (2013). 2014 / 15 National Tariff Payment System
first_visit <- list(distn = "gamma",
                    params = c(shape = 53.3,
                               scale = 4.52)) #241

# NHS England. (2013). 2014 / 15 National Tariff Payment System
followup_visit <- list(distn = "gamma",
                       params = c(shape = 18.78,
                                  scale = 7.62)) #143

##TODO: screening programme costs
#...



