
<!-- README.md is generated from README.Rmd. Please edit that file -->

# verhoeff

This package is my take on implementing the Verhoeff algorithim for
calculating check digits. My influence for the algorithims
implementation was primarily from the wikipedia outline
(<https://en.wikipedia.org/wiki/Verhoeff_algorithm>), and the paper by
A. Dunn (Computer program for the calculation and validation of Verhoeff
check digits, <https://www.ccamlr.org/en/wg-fsa-sam-05/11>)

## Installation

You can install `verhoeff` from CRAN with:

``` r
install.packages("verhoeff")
```

Or grab the development version from github with:

``` r
devtools::install_github("condwanaland/verhoeff")
```

## Example

To calculate the Verhoeff Check Digit for a given number, use
`verhoeff_calculate`

``` r
library(verhoeff)
verhoeff::verhoeff_calculate(123)
#> [1] 3
```

To calculate for many numbers, just pass a vector.

``` r
verhoeff_calculate(c(1234, 5678, 9, 10))
#> [1] 0 8 1 9
```

If you would prefer the output to be in a list, with one check digit per
element, use the `as_list` parameter.

``` r
verhoeff_calculate(c(1234, 5678, 9, 10), as_list = TRUE)
#> [[1]]
#> [1] 0
#> 
#> [[2]]
#> [1] 8
#> 
#> [[3]]
#> [1] 1
#> 
#> [[4]]
#> [1] 9
```

The output of `verhoeff_calculate` is designed so it can be a new column
in a dataframe (i.e., as the output of a `dplyr::mutate` call)

``` r
suppressPackageStartupMessages(library(dplyr))

# Make a random dataframe that has integer columns
mtcars$name <- rownames(mtcars)
mtcars %>% 
  select(name, gear) %>% 
  mutate(check_digit = verhoeff_calculate(gear))
#>                   name gear check_digit
#> 1            Mazda RX4    4           3
#> 2        Mazda RX4 Wag    4           3
#> 3           Datsun 710    4           3
#> 4       Hornet 4 Drive    3           6
#> 5    Hornet Sportabout    3           6
#> 6              Valiant    3           6
#> 7           Duster 360    3           6
#> 8            Merc 240D    4           3
#> 9             Merc 230    4           3
#> 10            Merc 280    4           3
#> 11           Merc 280C    4           3
#> 12          Merc 450SE    3           6
#> 13          Merc 450SL    3           6
#> 14         Merc 450SLC    3           6
#> 15  Cadillac Fleetwood    3           6
#> 16 Lincoln Continental    3           6
#> 17   Chrysler Imperial    3           6
#> 18            Fiat 128    4           3
#> 19         Honda Civic    4           3
#> 20      Toyota Corolla    4           3
#> 21       Toyota Corona    3           6
#> 22    Dodge Challenger    3           6
#> 23         AMC Javelin    3           6
#> 24          Camaro Z28    3           6
#> 25    Pontiac Firebird    3           6
#> 26           Fiat X1-9    4           3
#> 27       Porsche 914-2    5           8
#> 28        Lotus Europa    5           8
#> 29      Ford Pantera L    5           8
#> 30        Ferrari Dino    5           8
#> 31       Maserati Bora    5           8
#> 32          Volvo 142E    4           3
```

In addition to `verhoeff_calculate`, `verhoeff` offers `verhoeff_append`
and `verhoeff_validate`.

Use `verhoeff_append` to append a check digit to a provided number:

``` r
verhoeff_append(123)
#> [1] "123-3"
verhoeff_append(c(123, 5, 0))
#> [1] "123-3" "5-8"   "0-4"
```

Use `verhoeff_validate` to check whether a check digit is correct for
the provided number

``` r
verhoeff_validate(number = 123, check_digit = 3)
#> [1] TRUE
verhoeff_validate(number = 123, check_digit = 4)
#> [1] FALSE
```

## Other implementations

See <https://github.com/fascinatingfingers/CheckDigit> for another
implementation of check digits that considers more than just the
Verhoeff algorithim.
