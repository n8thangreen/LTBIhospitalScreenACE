#
# LTBI screening ACE
# N Green
#
# plots
#

plot(NULL,
     xlim = c(0, 180),
     ylim = c(143, 150),
     ylab = "Cost of A&E screening per eligible patient (£)",
     xlab = "Number of LTBI cases correctly diagnosed through A&E screening")

points(x = res[[1]]$LTBI_Dx_ssize,
       y = res[[1]]$mc_cost,
       pch = 2,
       col = 2)
points(x = res[[2]]$LTBI_Dx_ssize,
       y = res[[2]]$mc_cost,
       pch = 5,
       col = 3)
points(mean(res[[1]]$LTBI_Dx_ssize),
       mean(res[[1]]$mc_cost),
       pch = 19)
points(mean(res[[2]]$LTBI_Dx_ssize),
       mean(res[[2]]$mc_cost),
       pch = 19)


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




