context("Test number reversing")

test_that("reverse_number works", {
  expect_equal(reverse_number(1234), c(4, 3, 2, 1))
  expect_equal(reverse_number(4), c(4))
})

test_that("prepare_number returns correct output", {
  expect_equal(prepare_number(10000), c(0, 0, 0, 0, 1))
  expect_equal(prepare_number(9876), c(6, 7, 8, 9))
})
