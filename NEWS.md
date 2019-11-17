* `readr` has been replaced with `vroom` package for a better performance.
* Supported "*.R" file in `pick()` function.


# ezpickr 1.2.0

* `DocumentTermMatrix` and `TermDocumentMatrix` class are now supported in `viewxl()` function.


# ezpickr 1.1.0

* "*.Rmd" file format is now supported in `pick()` using `rmarkdown::render()` function.


# ezpickr 1.0.5

* `pick()` and `picko()` functions now allow users to specify value-separator parameter using `delim` option for `*.csv`, `*.csv2`, and `*.tsv` files when the expected delimitters are not used. For example, in any event your csv file is separating each value using whitespace instead of comma(,) do the following:

``` r
data <- pick(delim=" ")
```


# ezpickr 1.0.4

* "xpt" file format is now supported in `pick()` function.
* Atomic class (vector) is now supported in `viewxl()` function.


# ezpickr 1.0.3

* A critical bug that users cannot use the additional arguments of `readxl::read_excel()` for an Excel format within both `pick()` and `picko()` functions has been resolved; by default an Excel file with multiple sheets is returned as a list object when users have not passed any additional arguments.


# ezpickr 1.0.2

* `purrr` package has been added to the import package list to efficiently return multiple Excel sheets as a list of tibble; this way offers a better performance than the previous `lapply()` mechanism.
* Users can now access a multi-sheet Excel file with each sheet name as well as its index number when using `pick()` and `picko()` functions.
* A bug that users cannot utilize explicit Korean path/file when `mode` option is specified in `pick()` function has been resolved; Korean users now can use explicit Korean-included path/file in `picko()` function as well.
* `view()` function is now deprecated to avoid any collision with `tibble::view()` function which has the same name; users are recommended to use `viewxl()` function in the future instead.
* `view()` and `viewxl()` functions now return a tibble object reflecting users' real-time manipulation done in Excel.
* `view()` and `viewxl()` functions have been fixed to process multiple sheets as a list object.
* `mbox` file format is now supported in both `pick()` and `picko()` functions using `mboxr::read_mbox()` function under the hood.


# ezpickr 1.0.1

* New function `picko()` has been added to assist Korean R users in importing Korean-included `path/to/file` as an alternative of `pick()` function; other non-Korean R users can still employ the existing `pick()` function.
* A more robust mechanism has been applied to a file path that contains any Korean characters.
* `pick()` and `picko()` functions now automatically return an Excel file that contains more than one sheet as a list of each Work Sheet (Thanks hyun seung Lee for the suggestion via email).
* `view()` function now internally employs `writexl::write_xlsx()` function instead of `readr::write_csv()` to create Microsoft Excel file to provide users with a stable encoding consistency; since this change, `mode` option of the `view()` function has been removed.
* `table` class is now supported in `view()` function by automatically converting it into data.frame class.
* Startup message has been added to the package so that Korean R users can benefit from the newly developed `picko()` function when interacting with Korean-included dataset.


# ezpickr 1.0.0

* `mode` argument has been added to `pick()` function to accommodate Korean R users' needs in terms of R session locale and encoding to Korean. Available values include "ko1" for "CP949" and "ko2" for "UTF-8" while both change R locale into Korean.
* `view()` function has been newly added to provide R beginners with a convenient way to place their data in a spread sheet application.


# ezpickr 0.1.3

* Unused dependencies are moved to "suggest" from "import" field in the description file not to force unnecessary installation for users.
* `interactive()` condition is added to the `pick()` example to avoid any error when called in a non-interactive testing environment.


# ezpickr 0.1.2

* NEWS file is added to help HTML page.
* Authorship fixed for Soyoung Choi from contributor to author role for her considerable help for the `pick()` function.


# ezpickr 0.1.1

* Providing a sample test file `airquality.sav` for an example purpose.
* Now `pick()` function returns a JSON file into a tibble form.
* Returning a tibble form for RDA, RData, and RDS as well when `pick()` function is applied.

# ezpickr 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Initial release.
