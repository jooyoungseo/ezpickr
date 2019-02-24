## Test environments
* local OS X install, R 3.5.2
* ubuntu 14.04 (on travis-ci), R 3.5.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

# ezpickr 1.0.2

* `purrr` package has been added to the import package list to efficiently return multiple Excel sheets as a list of tibble; this way offers a better performance than the previous `lapply()` mechanism.
* Users can now access a multi-sheet Excel file with each sheet name as well as its index number when using `pick()` and `picko()` functions.
* A bug that users cannot utilize explicit Korean path/file when `mode` option is specified in `pick()` function has been resolved; Korean users now can use explicit Korean-included path/file in `picko()` function as well.
* `view()` function is now deprecated to avoid any collision with `tibble::view()` function which has the same name; users is recommended to use `viewxl()` function in the future instead.
* `view()` and `viewxl()` functions now return a tibble object reflecting users' real-time manipulation done in Excel.
* `view()` and `viewxl()` functions have been fixed to process multiple sheets as a list object.
* `mbox` file format is now supported in both `pick()` and `picko()` functions using `mboxr::read_mbox()` function under the hood.
