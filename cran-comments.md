## Test environments
* local OS X install, R 3.5.2
* ubuntu 14.04 (on travis-ci), R 3.5.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

# ezpickr 1.0.3

* A critical and imperative bug that users cannot use the additional arguments of `readxl::read_excel()` for an Excel format within both `pick()` and `picko()` functions has been resolved; by default an Excel file with multiple sheets is returned as a list object when users have not passed any additional arguments.
