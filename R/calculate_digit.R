#' calculate_digit
#'
#' Calculates a single Verhoeff Check Digit. This function is exported, but it would usually
#' be called from one of the `verhoeff_*` wrapper functions
#'
#' @param number A number you want to calculate the check digit for
#' @param d5 The verhoeff d5 matrix. Retrievable with create_verhoeff_matrices()$d5
#' @param d5_p The verhoeff p matrix. Retrievable with create_verhoeff_matrices()$d5_p
#' @param inv_v The verhoeff inv matrix. Retrievable with create_verhoeff_matrices()$inv_v
#'
#' @return A single integer
#' @export
#'
#' @examples
#' dat <- verhoeff::create_verhoeff_matrices()
#' calculate_digit(5, dat$d5, dat$d5_p, dat$inv_v)
calculate_digit <- function(number, d5, d5_p, inv_v){

  number <- prepare_number(number)

  c <- 0
  for (i in 1:length(number)){
    c <- d5_calc(d5, c,
                 d5_p_calc(d5_p, i, number[i]))
  }

  final <- inv_v[c + 1]
  return(final)
}


d5_p_calc <- function(d5_p, i, number) {
  d5_p[(i %% 8) + 1, number + 1] + 1
}

d5_calc <- function(d5, c, d5_p_calc) {
  d5[c + 1, d5_p_calc]
}
