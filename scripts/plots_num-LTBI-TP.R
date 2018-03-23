#
# LTBI screening ACE
# N Green
#
# cost-effectiveness plots


####################
# backwards model: #
# PPV/NPV          #
####################


# sensitivity analysis IGRAs ----------------------------------------------

# QFT-GIT
plot(NULL,
     xlim = c(0, 250),
     ylim = c(143, 150),
     ylab = "Cost of A&E screening per eligible patient (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening",
     main = "A&E")

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost,
       pch = 2,
       col = 2)
points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost,
       pch = 5,
       col = 3)
points(x = res[[5]]$LTBI_Dx_ssize,
       y = res[[5]]$mc_cost,
       pch = 8,
       col = 4)
points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize),
       mean(res[[5]]$mc_cost),
       pch = 19)

legend('topright', legend = c('NPH', 'WMH', 'Combined'), col = c(2,3,4), pch = c(2,5,8))



# cost per LTBI TP ------------------------------------------------------

x11()

plot(NULL,
     xlim = c(0, 280),
     ylim = c(0, 1200),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening",
     main = 'A&E')

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost*res[[1]]$N/res[[1]]$LTBI_Dx_ssize,
       pch = 2,
       col = 2)
points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost*res[[3]]$N/res[[3]]$LTBI_Dx_ssize,
       pch = 5,
       col = 3)
points(x = res[[5]]$LTBI_Dx_ssize,
       y = res[[5]]$mc_cost*res[[5]]$N/res[[5]]$LTBI_Dx_ssize,
       pch = 8,
       col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost)*res[[1]]$N/mean(res[[1]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost)*res[[3]]$N/mean(res[[3]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize),
       mean(res[[5]]$mc_cost)*res[[5]]$N/mean(res[[5]]$LTBI_Dx_ssize),
       pch = 19)

legend('topright', legend = c('NPH', 'WMH', 'Combined'), col = c(2,3,4), pch = c(2,5,8))



###################
# forwards model: #
# sens/spec       #
###################

# prevalence sensitivity analysis -----------------------------------------

## cost-effectiveness plane
x11()

plot(NULL,
     xlim = c(0, 400),
     ylim = c(143, 148),
     ylab = "Cost of A&E screening per eligible patient (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening",
     main = "A&E")
     # main = "GP")

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost,
       pch = 2,
       col = 2)
points(x = res[[2]]$LTBI_Dx_ssize,
       y = res[[2]]$mc_cost,
       pch = 2,
       col = 3)
points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost,
       pch = 2,
       col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost),
       pch = 19)
points(mean(res[[2]]$LTBI_Dx_ssize),
       mean(res[[2]]$mc_cost),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost),
       pch = 19)


points(x = res[[4]]$LTBI_Dx_ssize,
       y = res[[4]]$mc_cost,
       pch = 5,
       col = 2)
points(x = res[[5]]$LTBI_Dx_ssize,
       y = res[[5]]$mc_cost,
       pch = 5,
       col = 3)
points(x = res[[6]]$LTBI_Dx_ssize,
       y = res[[6]]$mc_cost,
       pch = 5,
       col = 4)

points(mean(res[[4]]$LTBI_Dx_ssize),
       mean(res[[4]]$mc_cost),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize),
       mean(res[[5]]$mc_cost),
       pch = 19)
points(mean(res[[6]]$LTBI_Dx_ssize),
       mean(res[[6]]$mc_cost),
       pch = 19)

# combined sample

points(x = res[[7]]$LTBI_Dx_ssize,
       y = res[[7]]$mc_cost,
       pch = 8,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize,
       y = res[[8]]$mc_cost,
       pch = 8,
       col = 3)
points(x = res[[9]]$LTBI_Dx_ssize,
       y = res[[9]]$mc_cost,
       pch = 8,
       col = 4)

points(mean(res[[7]]$LTBI_Dx_ssize),
       mean(res[[7]]$mc_cost),
       pch = 19)
points(mean(res[[8]]$LTBI_Dx_ssize),
       mean(res[[8]]$mc_cost),
       pch = 19)
points(mean(res[[9]]$LTBI_Dx_ssize),
       mean(res[[9]]$mc_cost),
       pch = 19)

legend('bottomright', legend = c('NPH', 'WMH', 'Combined', "20%", "30%", "40%"), col = c(1,1,1,2,3,4), pch = c(2,5,8,15,15,15))

# cost per LTBI TP ------------------------------------------------------

x11()
par(mfrow = c(1,3))

plot(NULL,
     # xlim = c(0, 280),
     xlim = c(0, 450),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening",
     main = "A&E NPH")

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost*res[[1]]$N/res[[1]]$LTBI_Dx_ssize,
       pch = 2,
       col = 2)
points(x = res[[2]]$LTBI_Dx_ssize,
       y = res[[2]]$mc_cost*res[[2]]$N/res[[2]]$LTBI_Dx_ssize,
       pch = 2,
       col = 3)
points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost*res[[3]]$N/res[[3]]$LTBI_Dx_ssize,
       pch = 2,
       col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost)*res[[1]]$N/mean(res[[1]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[2]]$LTBI_Dx_ssize),
       mean(res[[2]]$mc_cost)*res[[2]]$N/mean(res[[2]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost)*res[[3]]$N/mean(res[[3]]$LTBI_Dx_ssize),
       pch = 19)

legend('topright', legend = c('20%', '30%', '40%'), col = c(2,3,4), pch = c(2,5,8))


plot(NULL,
     xlim = c(0, 450),
     # xlim = c(0, 280),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening",
     main = "A&E WMH")

points(x = res[[4]]$LTBI_Dx_ssize,
       y = res[[4]]$mc_cost*res[[4]]$N/res[[4]]$LTBI_Dx_ssize,
       pch = 2,
       col = 2)
points(x = res[[5]]$LTBI_Dx_ssize,
       y = res[[5]]$mc_cost*res[[5]]$N/res[[5]]$LTBI_Dx_ssize,
       pch = 2,
       col = 3)
points(x = res[[6]]$LTBI_Dx_ssize,
       y = res[[6]]$mc_cost*res[[6]]$N/res[[6]]$LTBI_Dx_ssize,
       pch = 2,
       col = 4)

points(mean(res[[4]]$LTBI_Dx_ssize),
       mean(res[[4]]$mc_cost)*res[[4]]$N/mean(res[[4]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize),
       mean(res[[5]]$mc_cost)*res[[5]]$N/mean(res[[5]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[6]]$LTBI_Dx_ssize),
       mean(res[[6]]$mc_cost)*res[[6]]$N/mean(res[[6]]$LTBI_Dx_ssize),
       pch = 19)

# combined sample

plot(NULL,
     xlim = c(0, 450),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening",
     main = "A&E Combined")

points(x = res[[7]]$LTBI_Dx_ssize,
       y = res[[7]]$mc_cost*res[[7]]$N/res[[7]]$LTBI_Dx_ssize,
       pch = 8,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize,
       y = res[[8]]$mc_cost*res[[8]]$N/res[[8]]$LTBI_Dx_ssize,
       pch = 8,
       col = 3)
points(x = res[[9]]$LTBI_Dx_ssize,
       y = res[[9]]$mc_cost*res[[9]]$N/res[[9]]$LTBI_Dx_ssize,
       pch = 8,
       col = 4)

points(mean(res[[7]]$LTBI_Dx_ssize),
       mean(res[[7]]$mc_cost)*res[[7]]$N/mean(res[[7]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[8]]$LTBI_Dx_ssize),
       mean(res[[8]]$mc_cost)*res[[8]]$N/mean(res[[8]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[9]]$LTBI_Dx_ssize),
       mean(res[[9]]$mc_cost)*res[[9]]$N/mean(res[[9]]$LTBI_Dx_ssize),
       pch = 19)

