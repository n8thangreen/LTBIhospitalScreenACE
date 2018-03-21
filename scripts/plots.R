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
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

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

# QFT-gold
plot(NULL,
     xlim = c(0, 180),
     ylim = c(143, 150),
     ylab = "Cost of A&E screening per eligible patient (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost,
       pch = 4,
       col = 2)
points(x = res[[4]]$LTBI_Dx_ssize,
       y = res[[4]]$mc_cost,
       pch = 8,
       col = 3)

points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost),
       pch = 19)
points(mean(res[[4]]$LTBI_Dx_ssize),
       mean(res[[4]]$mc_cost),
       pch = 19)


# cost/LTBI TP ------------------------------------------------------

plot(NULL,
     xlim = c(0, 280),
     ylim = c(0, 1200),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost*n_NPH/res[[1]]$LTBI_Dx_ssize,
       pch = 2,
       col = 2)
points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost*n_WMH/res[[3]]$LTBI_Dx_ssize,
       pch = 2,
       col = 3)
points(x = res[[5]]$LTBI_Dx_ssize,
       y = res[[5]]$mc_cost*n_WMH/res[[5]]$LTBI_Dx_ssize,
       pch = 2,
       col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost)*n_NPH/mean(res[[1]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost)*n_WMH/mean(res[[3]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize),
       mean(res[[5]]$mc_cost)*n_WMH/mean(res[[5]]$LTBI_Dx_ssize),
       pch = 19)


# combined sample

plot(NULL,
     xlim = c(0, 450),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[7]]$LTBI_Dx_ssize,
       y = res[[7]]$mc_cost*n_WMH/res[[7]]$LTBI_Dx_ssize,
       pch = 8,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize,
       y = res[[8]]$mc_cost*n_WMH/res[[8]]$LTBI_Dx_ssize,
       pch = 8,
       col = 3)


points(mean(res[[7]]$LTBI_Dx_ssize),
       mean(res[[7]]$mc_cost)*n_WMH/mean(res[[7]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[8]]$LTBI_Dx_ssize),
       mean(res[[8]]$mc_cost)*n_WMH/mean(res[[8]]$LTBI_Dx_ssize),
       pch = 19)


###################
# forwards model: #
# sens/spec       #
###################

# prevalence sensitivity analysis -----------------------------------------

## cost-effectiveness plane

plot(NULL,
     xlim = c(0, 400),
     ylim = c(143, 148),
     ylab = "Cost of A&E screening per eligible patient (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

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


# cost/LTBI TP ------------------------------------------------------

plot(NULL,
     xlim = c(0, 280),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost*n_NPH/res[[1]]$LTBI_Dx_ssize,
       pch = 2,
       col = 2)
points(x = res[[2]]$LTBI_Dx_ssize,
       y = res[[2]]$mc_cost*n_NPH/res[[2]]$LTBI_Dx_ssize,
       pch = 2,
       col = 3)
points(x = res[[3]]$LTBI_Dx_ssize,
       y = res[[3]]$mc_cost*n_NPH/res[[3]]$LTBI_Dx_ssize,
       pch = 2,
       col = 4)

points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost)*n_NPH/mean(res[[1]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[2]]$LTBI_Dx_ssize),
       mean(res[[2]]$mc_cost)*n_NPH/mean(res[[2]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[3]]$LTBI_Dx_ssize),
       mean(res[[3]]$mc_cost)*n_NPH/mean(res[[3]]$LTBI_Dx_ssize),
       pch = 19)


plot(NULL,
     xlim = c(0, 280),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[4]]$LTBI_Dx_ssize,
       y = res[[4]]$mc_cost*n_WMH/res[[4]]$LTBI_Dx_ssize,
       pch = 2,
       col = 2)
points(x = res[[5]]$LTBI_Dx_ssize,
       y = res[[5]]$mc_cost*n_WMH/res[[5]]$LTBI_Dx_ssize,
       pch = 2,
       col = 3)
points(x = res[[6]]$LTBI_Dx_ssize,
       y = res[[6]]$mc_cost*n_WMH/res[[6]]$LTBI_Dx_ssize,
       pch = 2,
       col = 4)

points(mean(res[[4]]$LTBI_Dx_ssize),
       mean(res[[4]]$mc_cost)*n_WMH/mean(res[[4]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[5]]$LTBI_Dx_ssize),
       mean(res[[5]]$mc_cost)*n_WMH/mean(res[[5]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[6]]$LTBI_Dx_ssize),
       mean(res[[6]]$mc_cost)*n_WMH/mean(res[[6]]$LTBI_Dx_ssize),
       pch = 19)

# combined sample

plot(NULL,
     xlim = c(0, 450),
     ylim = c(0, 1000),
     ylab = "Cost of A&E screening per LTBI cases correctly diagnosed (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[7]]$LTBI_Dx_ssize,
       y = res[[7]]$mc_cost*n_WMH/res[[7]]$LTBI_Dx_ssize,
       pch = 8,
       col = 2)
points(x = res[[8]]$LTBI_Dx_ssize,
       y = res[[8]]$mc_cost*n_WMH/res[[8]]$LTBI_Dx_ssize,
       pch = 8,
       col = 3)
points(x = res[[9]]$LTBI_Dx_ssize,
       y = res[[9]]$mc_cost*n_WMH/res[[9]]$LTBI_Dx_ssize,
       pch = 8,
       col = 4)

points(mean(res[[7]]$LTBI_Dx_ssize),
       mean(res[[7]]$mc_cost)*n_WMH/mean(res[[7]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[8]]$LTBI_Dx_ssize),
       mean(res[[8]]$mc_cost)*n_WMH/mean(res[[8]]$LTBI_Dx_ssize),
       pch = 19)
points(mean(res[[9]]$LTBI_Dx_ssize),
       mean(res[[9]]$mc_cost)*n_WMH/mean(res[[9]]$LTBI_Dx_ssize),
       pch = 19)

