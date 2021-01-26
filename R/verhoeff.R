#' verhoeff_calculate
#'
#' @param number The vector of numbers you want a check digit for
#' @param as_list Return the results as a list? Defaults to false
#'
#' @return Vector or list of check digits
#' @export
#'
#' @examples
#' verhoeff_calculate(1234)
verhoeff_calculate <- function(number, as_list = FALSE){

  v_matrices <- create_verhoeff_matrices()


  check_digit <- lapply(number,
                       calculate_digit,
                       d5 = v_matrices$d5,
                       d5_p = v_matrices$d5_p,
                       inv_v = v_matrices$inv_v)

  if (!as_list){
    check_digit <- unlist(check_digit)
  }

  return(check_digit)
}


#' verhoeff_append
#'
#' Return a number with its check digit appended
#'
#' @param number The number to calculate a check digit for
#' @param sep A separator for the two numbers
#'
#' @return Numeric vector of length equal to its input
#' @export
#'
#' @examples
#' verhoeff::verhoeff_append(123)
verhoeff_append <- function(number, sep = "-"){
  original_number <- number
  check_digit <- verhoeff_calculate(number)

  appended_number <- paste(original_number, check_digit, sep = sep)

  return(appended_number)
}



#' verhoeff_validate
#'
#' Enter a number, and an existing check digit. Function will return true if the supplied check digit is a correct verhoeff check digit for the given number
#'
#' @param number A numerical input
#' @param check_digit An existing check digit for the input number
#'
#' @return Logical vector
#' @export
#'
#' @examples
#' verhoeff::verhoeff_validate(123, 3)
verhoeff_validate <- function(number, check_digit){

  number <- number
  check_digit <- as.integer(check_digit)

  calc_check_digit <- verhoeff_calculate(number)

  return(
   identical(check_digit, calc_check_digit)
  )
}
