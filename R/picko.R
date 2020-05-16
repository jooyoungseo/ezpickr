#' picko
#' @title Choosing any rectangular Korean data file using interactive GUI dialog box.

#' @aliases picko
#' @keywords picko

#' @description The basic functionality is exactly the same as \link[ezpickr]{pick}, but optimized for Korean R users.

#' @export picko
#' @param file Either a path to a file, a connection, or literal data (either a single string or a raw vector). The default is NULL, which pops up an interactive GUI file choose dialogue box for users unless an explicit path/to/filename is given.
#' Each corresponding function depending upon a file extension will be automatically matched and applied once you pick up your file using either the GUI-file-chooser dialog box or explicit path/to/filename.
#' @param ... Any additional arguments available for each file type and extension:
#' \link[vroom]{vroom} for 'CSV' (Comma-Separated Values); 'CSV2' (Semicolon-Separated Values);
#' 'TSV' (Tab-Separated Values); 'txt' (plain text) files;
#' \link[readxl]{read_excel} for 'Excel' files; \link[haven]{read_spss} for 'SPSS' files; \link[haven]{read_stata} for 'Stata' files;
#' \link[haven]{read_sas} for 'SAS' files; \link[textreadr]{read_document} for 'Microsoft Word', 'PDF', 'RTF', 'HTML', 'HTM', and 'PHP' files;
#' \link[jsonlite]{fromJSON} for 'JSON' files; \link[mboxr]{read_mbox} for 'mbox' files; \link[rmarkdown]{render} for 'Rmd' files; \link[base]{source} for 'R' files; \link[base]{readRDS} for 'RDS' files; \link[base]{load} for 'RDA' and 'RDATA' files.

#' @details
#' See example below.

#' @return tibble (table data.frame) object of the chosen rectangular data file will be returned.
#' @seealso \link[ezpickr]{pick} for more details on basic functionality.
#' @examples
#' # Choosing file and saving it into a variable
#' ## Scenario 1: Picking up a file using interactive GUI dialog box:
#' if (interactive()) {
#'   library(ezpickr)
#'   data <- picko()
#' }
#'
#' ## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below;
#' ## however, you can feed other files through this function
#' ## such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt,
#' ## *.html, webpage URL, *doc, *.docx, *.pdf, *.rtf, *.json, *.Rda, *.Rdata, and more):
#' if (interactive()) {
#'   library(ezpickr)
#'   test <- system.file("extdata", "airquality.sav", package = "ezpickr")
#'   data <- picko(test)
#'
#'   # Now you can use the imported file as a tibble.
#'   str(data)
#' }
#' @author JooYoung Seo, \email{jooyoung@psu.edu}
#' @author Soyoung Choi, \email{sxc940@psu.edu}

picko <-
  function(file = NULL, ...) { # Function starts:

    if (.Platform$OS.type == "windows") {
      pick(file = file, mode = "ko1", ...)
    } else {
      pick(file = file, mode = "ko2", ...)
    }
  } # Function ends.
