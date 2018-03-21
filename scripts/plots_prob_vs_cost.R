

###################
# forwards model: #
# sens/spec       #
###################

# prevalence sensitivity analysis -----------------------------------------

## cost-effectiveness plane

plot(NULL,
     xlim = c(0, 0.2),
     ylim = c(100, 148),
     ylab = "Cost of screening per eligible patient (£)",
     xlab = "Proportion LTBI TP given eligible")

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




# cost/LTBI TP ------------------------------------------------------

# combined sample

plot(NULL,
     xlim = c(0, 0.2),
     ylim = c(0, 2300),
     ylab = "Cost of screening per LTBI cases correctly diagnosed (£)",
     xlab = "Proportion LTBI TP given eligible")

points(x = res[[7]]$LTBI_Dx_ssize/res[[7]]$N,
       y = res[[7]]$mc_cost*n_WMH/res[[7]]$LTBI_Dx_ssize,
       pch = 8,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize/res[[8]]$N,
       y = res[[8]]$mc_cost*n_WMH/res[[8]]$LTBI_Dx_ssize,
       pch = 8,
       col = 3)
points(x = res[[9]]$LTBI_Dx_ssize/res[[9]]$N,
       y = res[[9]]$mc_cost*n_WMH/res[[9]]$LTBI_Dx_ssize,
       pch = 8,
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

