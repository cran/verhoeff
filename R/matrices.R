#' create_verhoeff_matrices
#'
#' @return An object with three fields; d5, d5_p, and inv_v
#' @export
#' @keywords internal
#'
#' @examples
#' verhoeff::create_verhoeff_matrices()$d5
#' verhoeff::create_verhoeff_matrices()$d5_p
#' verhoeff::create_verhoeff_matrices()$inv_v
create_verhoeff_matrices <- function(){
  d5_matrix <- matrix(as.integer(c(
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 0, 6, 7, 8, 9, 5,
    2, 3, 4, 0, 1, 7, 8, 9, 5, 6,
    3, 4, 0, 1, 2, 8, 9, 5, 6, 7,
    4, 0, 1, 2, 3, 9, 5, 6, 7, 8,
    5, 9, 8, 7, 6, 0, 4, 3, 2, 1,
    6, 5, 9, 8, 7, 1, 0, 4, 3, 2,
    7, 6, 5, 9, 8, 2, 1, 0, 4, 3,
    8, 7, 6, 5, 9, 3, 2, 1, 0, 4,
    9, 8, 7, 6, 5, 4, 3, 2, 1, 0
  )), ncol = 10, byrow = TRUE)

  d5_p_matrix <- matrix(as.integer(c(
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 5, 7, 6, 2, 8, 3, 0, 9, 4,
    5, 8, 0, 3, 7, 9, 6, 1, 4, 2,
    8, 9, 1, 6, 0, 4, 3, 5, 2, 7,
    9, 4, 5, 3, 1, 2, 6, 8, 7, 0,
    4, 2, 8, 6, 5, 7, 3, 9, 0, 1,
    2, 7, 9, 3, 8, 0, 6, 4, 1, 5,
    7, 0, 4, 6, 9, 1, 3, 2, 5, 8
  )), ncol = 10, byrow = TRUE)

  inv_vector <- as.integer(c(0, 4, 3, 2, 1, 5, 6, 7, 8, 9))

  return(list(d5 = d5_matrix,
              d5_p = d5_p_matrix,
              inv_v = inv_vector))
}
