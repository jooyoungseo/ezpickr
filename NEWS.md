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
