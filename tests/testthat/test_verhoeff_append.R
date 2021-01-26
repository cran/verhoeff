context("Testing verhoeff_append")

test_that("numbers are generated and appended correctly", {
  expect_equal(toString(verhoeff_append(123)), "123-3")
  expect_equal(toString(verhoeff_append(321)), "321-1")
  expect_equal(toString(verhoeff_append(9)), "9-1")
  expect_equal(toString(verhoeff_append(0)), "0-4")
})

test_that("vectors are appended correctly", {
  expect_equal(toString(verhoeff_append(c(123, 321))), "123-3, 321-1")
  expect_equal(toString(verhoeff_append(c(5, 5))), "5-8, 5-8")
})



test_df <- data.frame(
  numbers = c(123, 5, 78, 0, 1, 1, 3),
  check_digits = c(3, 8, 8, 4, 5, 5, 6)
)

test_df <- dplyr::mutate(test_df,
                         manually_appended = paste(numbers, check_digits, sep = "-"),
                         appended = verhoeff_append(numbers))

test_that("dataframes are mutated correctly", {
  expect_equal(test_df$manually_appended, test_df$appended)
})

rm(test_df)


test_that("errors are thrown on bad input", {
  expect_error(verhoeff_append("the", "NAs were introduced"))
  expect_warning(verhoeff_append(TRUE),
                 "Coercing logical values to numeric. Please ensure this is expected.")
})
