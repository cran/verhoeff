context("test_prepare_number_args")

test_that("prepare number throws appropriate errors on vectors", {
  expect_error(prepare_number(c("start", "end")),
               regexp = "Only a single number can be passed")
  expect_error(prepare_number(c(1234, 5678)),
               regexp = "Only a single number can be passed")
})

iris <- data("iris")
test_that("prepare number throws appropriate errors on bad coercion", {
  expect_error(prepare_number("start"),
               regexp = "NAs were introduced.")
  expect_error(prepare_number(iris),
               regexp = "NAs were introduced.")
})

test_that("prepare number warns on logicals", {
  expect_warning(prepare_number(TRUE),
                 regexp = "Coercing logical values to numeric.")
  expect_warning(prepare_number(FALSE),
                 regexp = "Coercing logical values to numeric.")
})

rm(iris)
