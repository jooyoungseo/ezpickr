## Test environments
* local OS X install, R 3.5.1
* ubuntu 14.04 (on travis-ci), R 3.5.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* `mode` argument has been added to `pick()` function to accommodate Korean R users' needs in terms of R session locale and encoding to Korean. Available values include "ko1" for "CP949" and "ko2" for "UTF-8" while both change R locale into Korean.
* `view()` function has been newly added to provide R beginners with a convenient way to place their data in a spread sheet application.

