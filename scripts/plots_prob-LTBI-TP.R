

###################
# forwards model: #
# sens/spec       #
###################

# prevalence sensitivity analysis -----------------------------------------

## cost-effectiveness plane

x11()
plot(NULL,
     xlim = c(0, 0.5),
     ylim = c(100, 180),
     ylab = "Cost of screening per eligible patient (£)",
     xlab = "Proportion LTBI TP given eligible",
     # main = "A&E combined data")
     main = "GP")

# combined sample

points(x = res[[7]]$LTBI_Dx_ssize/res[[7]]$N,
       y = res[[7]]$mc_cost,
       # pch = 2,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize/res[[8]]$N,
       y = res[[8]]$mc_cost,
       # pch = 2,
       col = 3)
points(x = res[[9]]$LTBI_Dx_ssize/res[[9]]$N,
       y = res[[9]]$mc_cost,
       # pch = 2,
       col = 4)

points(mean(res[[7]]$LTBI_Dx_ssize/res[[7]]$N),
       mean(res[[7]]$mc_cost),
       pch = 19)
points(mean(res[[8]]$LTBI_Dx_ssize/res[[8]]$N),
       mean(res[[8]]$mc_cost),
       pch = 19)
points(mean(res[[9]]$LTBI_Dx_ssize/res[[9]]$N),
       mean(res[[9]]$mc_cost),
       pch = 19)

legend('topright', legend = c('20%', '30%', '40%'), col = c(2,3,4), pch = c(1,1,1))


# cost per LTBI TP ------------------------------------------------------

# combined sample
x11()

plot(NULL,
     xlim = c(0, 0.5),
     ylim = c(0, 2500),
     ylab = "Cost of screening per LTBI cases correctly diagnosed (£)",
     xlab = "Proportion LTBI TP given eligible",
     # main = "A&E combined data")
     main = "GP")

points(x = res[[7]]$LTBI_Dx_ssize/res[[7]]$N,
       y = res[[7]]$mc_cost*n_WMH/res[[7]]$LTBI_Dx_ssize,
       pch = 1,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize/res[[8]]$N,
       y = res[[8]]$mc_cost*n_WMH/res[[8]]$LTBI_Dx_ssize,
       pch = 1,
       col = 3)
points(x = res[[9]]$LTBI_Dx_ssize/res[[9]]$N,
       y = res[[9]]$mc_cost*n_WMH/res[[9]]$LTBI_Dx_ssize,
       pch = 1,
       col = 4)

points(mean(res[[7]]$LTBI_Dx_ssize/res[[7]]$N),
       mean(res[[7]]$mc_cost)*n_WMH/mean(res[[7]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[8]]$LTBI_Dx_ssize/res[[8]]$N),
       mean(res[[8]]$mc_cost)*n_WMH/mean(res[[8]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[9]]$LTBI_Dx_ssize/res[[9]]$N),
       mean(res[[9]]$mc_cost)*n_WMH/mean(res[[9]]$LTBI_Dx_ssize),
       pch = 19)

legend('topright', legend = c("20%", "30%", "40%"), col = c(2,3,4), pch = c(1,1,1))



####################
# backwards model: #
# PPV/NPV          #
####################

# IGRA sensitivity analysis -----------------------------------------

## cost-effectiveness plane

plot(NULL,
     xlim = c(0, 0.25),
     ylim = c(135, 148),
     ylab = "Cost of screening per eligible patient (£)",
     xlab = "Proportion LTBI TP given eligible",
     # main = "A&E")
     main = "GP")

# combined sample

points(x = res[[1]]$LTBI_Dx_ssize/res[[1]]$N,
       y = res[[1]]$mc_cost,
       pch = 2,
       col = 2)
points(x = res[[3]]$LTBI_Dx_ssize/res[[3]]$N,
       y = res[[3]]$mc_cost,
       pch = 5,
       col = 3)
points(x = res[[5]]$LTBI_Dx_ssize/res[[5]]$N,
       y = res[[5]]$mc_cost,
       pch = 8,
       col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize/res[[1]]$N),
       mean(res[[1]]$mc_cost),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize/res[[3]]$N),
       mean(res[[3]]$mc_cost),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize/res[[5]]$N),
       mean(res[[5]]$mc_cost),
       pch = 19)

legend('bottomright', legend = c('NPH', 'WMH', 'Combined'), col = c(2,3,4), pch = c(2,5,8))


# cost per LTBI TP ------------------------------------------------------

cost_per_LTBITP <- function(res_i) res_i$mc_cost*res_i$N/res_i$LTBI_Dx_ssize

plot(NULL,
     xlim = c(0, 0.25),
     ylim = c(0, 1300),
     ylab = "Cost of screening per LTBI cases correctly diagnosed (£)",
     xlab = "Proportion LTBI TP given eligible",
     # main = "A&E")
     main = "GP")

# points(x = res[[1]]$LTBI_Dx_ssize/res[[1]]$N,
#        y = cost_per_LTBITP(res[[1]]),
#        pch = 2,
#        col = 2)
# points(x = res[[3]]$LTBI_Dx_ssize/res[[3]]$N,
#        y = cost_per_LTBITP(res[[3]]),
#        pch = 5,
#        col = 3)
# points(x = res[[5]]$LTBI_Dx_ssize/res[[5]]$N,
#        y = cost_per_LTBITP(res[[5]]),
#        pch = 8,
#        col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize/res[[1]]$N),
       mean(res[[1]]$mc_cost)*res[[1]]$N/mean(res[[1]]$LTBI_Dx_ssize),
       # pch = 19)
       pch = 2, col = 2)
points(mean(res[[3]]$LTBI_Dx_ssize/res[[3]]$N),
       mean(res[[3]]$mc_cost)*res[[3]]$N/mean(res[[3]]$LTBI_Dx_ssize),
       # pch = 19)
       pch = 5, col = 3)
points(mean(res[[5]]$LTBI_Dx_ssize/res[[5]]$N),
       mean(res[[5]]$mc_cost)*res[[5]]$N/mean(res[[5]]$LTBI_Dx_ssize),
       # pch = 19)
       pch = 8, col = 4)

legend('bottomright', legend = c('NPH', 'WMH', 'Combined'), col = c(2,3,4), pch = c(2,5,8))
