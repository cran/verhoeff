% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepare_number.R
\name{prepare_number}
\alias{prepare_number}
\title{prepare_number}
\usage{
prepare_number(number)
}
\arguments{
\item{number}{A single number that can be coerced to numeric}
}
\value{
A numeric vector of length equal to number of digits in the input
}
\description{
Takes a number and prepares it for input to the verhoeff algorithim by reversing it
}
\examples{
prepare_number(1234)
}
