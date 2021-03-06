% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/verhoeff.R
\name{verhoeff_validate}
\alias{verhoeff_validate}
\title{verhoeff_validate}
\usage{
verhoeff_validate(number, check_digit)
}
\arguments{
\item{number}{A numerical input}

\item{check_digit}{An existing check digit for the input number}
}
\value{
Logical vector
}
\description{
Enter a number, and an existing check digit. Function will return true if the supplied check digit is a correct verhoeff check digit for the given number
}
\examples{
verhoeff::verhoeff_validate(123, 3)
}
