## Test environments
* local R installation, R 4.0.3
* ubuntu 16.04 (on travis-ci), R 4.0.3
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* To follow the CRAN policy, removed the GitHub `subtools` dependency that was experimentally supporting subtitle files (e.g., "*.srt"; "*.vtt"; "*.sub"; "*.ass") in `pick()` function.
* Nested data.frame objects alike are unnested in `viewxl()` function.
* Cleaned up source code indents for better readability.
