context("Check digits are correct")

test_that("digits are correct", {
  expect_equal(verhoeff_calculate(1234), 0)
  expect_equal(verhoeff_calculate(783435), 8)
  expect_equal(verhoeff_calculate(c(1234, 4321, 7635, 783435)), c(0, 0, 1, 8))
})

test_that("zeroes are not stripped", {
  expect_equal(verhoeff_calculate(1), 5)
  expect_equal(verhoeff_calculate(10), 9)
  expect_equal(verhoeff_calculate(100), 3)
})

test_that("digits are in list form", {
  expect_equal(verhoeff_calculate(1234, as_list = TRUE), list(0))
  expect_equal(verhoeff_calculate(783435, as_list = TRUE), list(8))
  expect_equal(verhoeff_calculate(c(1234, 4321, 7635, 783435),
                                  as_list = TRUE),
               list(0, 0, 1, 8))
})
