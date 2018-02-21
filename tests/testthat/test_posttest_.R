context("test-posttest_")

library(purrr)
library(dplyr)


test_that("boundary values", {

  expect_equal(posttest_pos(0.5, 1, 1), 1)
  expect_equal(posttest_pos(0.5, 0.5, 0.5), 0.5)
  expect_equal(posttest_pos(0.5, 0, 0), 0)

  expect_equal(posttest_neg(0.5, 1, 1), 0)
  expect_equal(posttest_neg(0.5, 0.5, 0.5), 0.5)
  expect_equal(posttest_neg(0.5, 0, 0), 1)

})
