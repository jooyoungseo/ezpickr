## Test environments
* local OS X install, R 3.5.2
* ubuntu 14.04 (on travis-ci), R 3.5.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

# ezpickr 1.0.1

* New function `picko()` has been added to assist Korean R users in importing Korean-included `path/to/file` as an alternative of `pick()` function; other non-Korean R users can still employ the existing `pick()` function.
* A more robust mechanism has been applied to a file path that contains any Korean characters.
* `pick()` and `picko()` functions now automatically return an Excel file that contains more than one sheet as a list of each Work Sheet (Thanks hyun seung Lee for the suggestion via email).
* `view()` function now internally employs `writexl::write_xlsx()` function instead of `readr::write_csv()` to create Microsoft Excel file to provide users with a stable encoding consistency; since this change, `mode` option of the `view()` function has been removed.
* `table` class is now supported in `view()` function by automatically converting it into data.frame class.
* Startup message has been added to the package so that Korean R users can benefit from the newly developed `picko()` function when interacting with Korean-included dataset.
