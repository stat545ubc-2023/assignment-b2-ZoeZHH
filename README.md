
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countNAs - Count missing values for all columns by group

<!-- badges: start -->
<!-- badges: end -->

This package contains a function, count_all_missing_by_group(), which
counts the missing values in a data set which grouped by one variable.

## Installation

You can install the development version of countNAs from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/countNAs")
#> Downloading GitHub repo stat545ubc-2023/countNAs@HEAD
#> 
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/jg/z5btlncd2_d4h2mh_9999nfm0000gn/T/RtmpumrOOd/remotes46daa1e49d8/stat545ubc-2023-countNAs-703fb3e/DESCRIPTION’ ... OK
#> * preparing ‘countNAs’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘countNAs_0.1.0.tar.gz’
#> Installing package into '/private/var/folders/jg/z5btlncd2_d4h2mh_9999nfm0000gn/T/RtmpwvvdNJ/temp_libpath462a16c131f8'
#> (as 'lib' is unspecified)
```

## Example

These are basic examples which show you how to solve common problems by
using `count_all_missing_by_group()` function in countNAs package:

Example - Applying to an existing dataset, this example computes the
number of missing values in the `airquality` dataset grouped by the
`cyl` column.

``` r
# load your function
library(countNAs)
# load your dataset
library(palmerpenguins)
#> Warning: package 'palmerpenguins' was built under R version 4.1.2
# apply your function
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

An alternative way of invoking the `count_all_missing_by_group()`:
piping the dataset into the function.

``` r
airquality |> count_all_missing_by_group(Month) 
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

The optional `.groups` argument allows us to keep the output grouped by
the grouping column. See example below; notice how the output is a
grouped tibble, rather than the ungrouped tibble output of the earlier
examples.

``` r
count_all_missing_by_group(airquality, Month, .groups = "keep")
#> # A tibble: 5 × 6
#> # Groups:   Month [5]
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```
