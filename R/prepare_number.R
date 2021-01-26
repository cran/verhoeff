#' prepare_number
#'
#' Takes a number and prepares it for input to the verhoeff algorithim by reversing it
#'
#' @param number A single number that can be coerced to numeric
#'
#' @return A numeric vector of length equal to number of digits in the input
#' @export
#'
#' @examples
#' prepare_number(1234)
prepare_number <- function(number){

  if (length(number) > 1){
    stop("Only a single number can be passed. Please do not pass vectors of length > 1",
         call. = FALSE)
  }

  if (is.logical(number)){
    warning("Coercing logical values to numeric. Please ensure this is expected.")
  }

  number <- suppressWarnings(as.numeric(number))

  if (is.na(number)){
    stop("NAs were introduced. Please check your input can be coerced to numeric",
         call. = FALSE)
  }

  rev_number <- reverse_number(number)
  return(rev_number)
}


#' reverse_number
#'
#' Takes a numeric or character number and reverses it. Only called from within `prepare_number`
#'
#' @param number A numeric or something that can be coerced to numeric
#'
#' @return A numeric vector with one element per digit
#' @noRd
#'
#' @examples
#' reverse_number(1234)
reverse_number <- function(number){
  # No arg checking is here, because it is always called from `prepare_number` which handles errors.
  number <- as.character(number)
  number <- strsplit(number, "")
  number <- number[[1]]
  number <- as.numeric(number)
  number <- rev(number)

  return(number)
}
