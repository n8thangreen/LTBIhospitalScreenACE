#
# PPV and NPV calcs
#


QFT_IT_sens <- 0.84
QFT_IT_spec <- 0.99

QFT_goldplus_sens <- 0.88
QFT_goldplus_spec <- 0.97

prev <- 0.3


NPV(sens = QFT_IT_sens,
    spec = QFT_IT_spec,
    prev = prev)
# [1] 0.9352227

PPV(sens = QFT_IT_sens,
    spec = QFT_IT_spec,
    prev = prev)
# [1] 0.972973

NPV(sens = QFT_goldplus_sens,
    spec = QFT_goldplus_spec,
    prev = prev)
# 1] 0.9496503

PPV(sens = QFT_goldplus_sens,
    spec = QFT_goldplus_spec,
    prev = prev)
# [1] 0.9263158


