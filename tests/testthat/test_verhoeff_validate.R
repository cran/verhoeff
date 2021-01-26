context("testing verhoeff_validate")

test_that("correct digits return true", {
  expect_equal(verhoeff_validate(123, 3), TRUE)
  expect_equal(verhoeff_validate(5, 8), TRUE)
  expect_equal(verhoeff_validate(0, 4), TRUE)
})

test_that("incorrect digits return false", {
  expect_equal(verhoeff_validate(123, 5), FALSE)
  expect_equal(verhoeff_validate(5, 5), FALSE)
  expect_equal(verhoeff_validate(0, 1), FALSE)
})

# Add some more tests around multi number inputs
