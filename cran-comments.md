## Test environments
* local OS X install, R 3.5.3
* ubuntu 14.04 (on travis-ci), R 3.5.3
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note


# ezpickr 1.0.5

* `pick()` and `picko()` functions now allow users to specify value-separator parameter using `delim` option for `*.csv`, `*.csv2`, and `*.tsv` files when the expected delimitters are not used. For example, in any event your csv file is separating each value using whitespace instead of comma(,) do the following:

``` r
data <- pick(delim=" ")
```

