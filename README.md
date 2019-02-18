
# ezpickr: Convenient Package/Function for Choosing Any Rectangular Data File Using Interactive GUI Dialog Box, and Seamlessly Manipulating Tidy Data between an Excel Window and R Session

[![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
[![CRAN
status](https://www.r-pkg.org/badges/version/ezpickr)](https://cran.r-project.org/package=ezpickr)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis build
status](https://travis-ci.org/jooyoungseo/ezpickr.svg?branch=master)](https://travis-ci.org/jooyoungseo/ezpickr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/jooyoungseo/ezpickr?branch=master&svg=true)](https://ci.appveyor.com/project/jooyoungseo/ezpickr)
[![Codecov test
coverage](https://codecov.io/gh/jooyoungseo/ezpickr/branch/master/graph/badge.svg)](https://codecov.io/gh/jooyoungseo/ezpickr?branch=master)

The goal of ezpickr is to provide R beginners with a convenient way to
pick up their data files and to easily import it as a tidy tibble form
into an R environment using GUI file-picker dialogue box (through
`ezpickr::pick()`), and to provide R users with a convenient way to open
and manipulate their data objects using Excel application for a seamless
data communication between an Excel window and R session through
`ezpickr::viewxl()`).

You can alternatively use `ezpickr::pick()` function for choosing *.csv,
*.csv2, *.tsv, *.txt, *.xls, *.xlsx, *.json, *.html, *.htm, *.php,
*.pdf, *.doc, *.docx, *.rtf, *.RData, *.Rda, *.RDS, *.sav (SPSS), *.por,
*.sas7bdat, *.sas7bcat, and *.dta files in an interactive GUI mode A
file choose dialog box will be prompted.

Any additional arguments available for each file type and extension:
`readr::read_csv()` for CSV (Comma-Separated Values) files;
`readr::read_csv2()` for CSV2 (Semicolon-Separated Values) files;
`readr::read_tsv()` for ‘TSV’ (Tab-Separated Values) files;
`readr::read_file()` for ‘txt’ (plain text) files;
`readxl::read_excel()` for ‘Excel’ files; `haven::read_spss()` for
‘SPSS’ files; `haven::read_stata()` for ‘Stata’ files;
`haven::read_sas()` for ‘SAS’ files; `textreadr::read_document()` for
‘Microsoft Word’, ‘PDF’, ‘RTF’, ‘HTML’, ‘HTM’, and ‘PHP’ files;
`jsonlite::fromJSON()` for ‘JSON’ files; `base::readRDS()` for ‘RDS’
files; `base::load()` for ‘RDA’ and ‘RDATA’ files.

Each corresponding function depending upon a file extension will be
automatically matched and applied once you pick up your file using
either the GUI-file-chooser dialog box or explicit path/to/filename.

## Installation

### Development Version

You can install the latest development version as follows:

``` r
if(!require(devtools)) {
install.packages("devtools")
}

devtools::install_github('jooyoungseo/ezpickr')
```

### Stable Version

You can install the released version of ezpickr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ezpickr")
```

## Example

### Usage of the `pick()` Function

This is a basic example which shows you how to import data files:

``` r
library(ezpickr)

# Choosing file and saving it into a variable
## Scenario 1: Picking up a file using interactive GUI dialog box:
data <- pick() ## Please use `picko()` instead if your path/file contains any Korean characters.

## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below; however, you can feed other files through this function such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt, *.html, webpage URL containing table, *.json, *.Rda, *.Rdata, and more):
data <- pick("test.sav") ## Please use `picko("test.sav")` instead if your path/file contains any Korean characters.

# Now you can use the imported file as a tibble data frame.
str(data)
```

### Usage of the `viewxl()` Function

You can open any data.frame, tibble, matrix, table or vector from an R
session into your default-set spreadsheet application window as follows:

``` r
library(ezpickr)

data(airquality)
str(airquality)

# Use `viewxl()` function to open your data object in your spreadsheet:
viewxl(airquality)

# Then, when necessary, you can modify the opened data in the spreadsheet and save it as a new data.

# You can pass a list object to the `viewxl()` function like below:
l <- list(iris = iris, mtcars = mtcars, chickwts = chickwts, quakes = quakes)
viewxl(l)
# Then, each list item will appear in your Excel window sheet by sheet.
```
