## Test environments
* local R installation, R 3.6.1
* ubuntu 16.04 (on travis-ci), R 3.6.1
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

# ezpickr 2.0.0

* All the CRAN issues have been resolved.
* `readr` has been replaced with `vroom` package for a better performance.
* Supported "*.R" file in `pick()` function.
* Package startup message has been removed.
* `view()` function, which has been deprecated, has been removed (please use `viewxl()` moving forward).
