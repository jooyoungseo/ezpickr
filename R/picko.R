#' picko
#' @title Choosing any rectangular Korean data file using interactive GUI dialog box.

#' @aliases picko
#' @keywords picko

#' @description The basic functionality is exactly the same as \link[ezpickr]{pick}, but optimized for Korean R users.

#' @export picko
#' @param file Either a path to a file, a connection, or literal data (either a single string or a raw vector). The default is NULL, which pops up an interactive GUI file choose dialogue box for users unless an explicit path/to/filename is given.
#' Each corresponding function depending upon a file extension will be automatically matched and applied once you pick up your file using either the GUI-file-chooser dialog box or explicit path/to/filename.
#' @param ... Any additional arguments available for each file type and extension:
#' \link[readr]{read_csv} for CSV (Comma-Separated Values) files; \link[readr]{read_csv2} for CSV2 (Semicolon-Separated Values) files; 
#' \link[readr]{read_tsv} for 'TSV' (Tab-Separated Values) files; \link[readr]{read_file} for 'txt' (plain text) files; 
#' \link[readxl]{read_excel} for 'Excel' files; \link[haven]{read_spss} for 'SPSS' files; \link[haven]{read_stata} for 'Stata' files; 
#' \link[haven]{read_sas} for 'SAS' files; \link[textreadr]{read_document} for 'Microsoft Word', 'PDF', 'RTF', 'HTML', 'HTM', and 'PHP' files; 
#' \link[jsonlite]{fromJSON} for 'JSON' files; \link[base]{readRDS} for 'RDS' files; \link[base]{load} for 'RDA' and 'RDATA' files.

#' @details
#' See example below.

#' @return tibble (table data.frame) object of the chosen rectangular data file will be returned.
#' @seealso \link[ezpickr]{pick} for more details on basic functionality.
#' @examples
#' # Choosing file and saving it into a variable
#' ## Scenario 1: Picking up a file using interactive GUI dialog box:
#' if(interactive()) {
#'   library(ezpickr)
#'   data <- picko()
#' }
#' 
#' ## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below;
#' ## however, you can feed other files through this function
#' ## such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt,
#' ## *.html, webpage URL, *doc, *.docx, *.pdf, *.rtf, *.json, *.Rda, *.Rdata, and more):
#' if(interactive()) {
#' library(ezpickr)
#' test <- system.file("extdata", "airquality.sav", package = "ezpickr")
#' data <- picko(test)
#' 
#' # Now you can use the imported file as a tibble.
#' str(data)
#' }

#' @author JooYoung Seo, \email{jooyoung@psu.edu}
#' @author Soyoung Choi, \email{sxc940@psu.edu}

picko <-
function(file = NULL, ...) {   # Function starts:

	if (is.null(file)) {
		fullFile <- file.choose()
	} else {
		fullFile <- file
	}

	if(.Platform$OS.type == "windows") {
		Sys.setlocale("LC_ALL", "Korean")
		options(encoding="CP949")
		fullFile <- iconv(fullFile, from="UTF-8", to="CP949")
	} else {
		Sys.setlocale("LC_ALL", "Korean")
		options(encoding="UTF-8")
		fullFile <- iconv(fullFile, from="UTF-8", to="CP949")
	}

	fileExt <- tools::file_ext(fullFile)

	switch(fileExt, 
		"csv" = readr::read_csv(file = fullFile, ...), 
		"csv2" = readr::read_csv2(file = fullFile, ...), 
		"tsv" = readr::read_tsv(file = fullFile, ...), 
		"txt" = tibble::rowid_to_column(tibble::tibble(text = readr::read_file(fullFile, ...)), "paragraph"), 
		"xlsx" = if(length(readxl::excel_sheets(path=fullFile)) > 1) {purrr::map(purrr::set_names(readxl::excel_sheets(path = fullFile)), readxl::read_excel, path = fullFile, ...)} else {readxl::read_excel(fullFile, ...)}, 
		"xls" = if(length(readxl::excel_sheets(path=fullFile)) > 1) {purrr::map(purrr::set_names(readxl::excel_sheets(path = fullFile)), readxl::read_excel, path = fullFile, ...)} else {readxl::read_excel(fullFile, ...)}, 
		"json" = tibble::tibble(jsonlite::fromJSON(fullFile, ...)), 
		"rdata" = load(file = fullFile, ...), 
		"rda" = tibble::tibble(load(file = fullFile, ...)), 
		"rds" = tibble::tibble(readRDS(file = fullFile, ...)), 
		"sav" = haven::read_sav(fullFile, ...), 
		"sas7bdat" = haven::read_sas(fullFile, ...), 
		"sas7bcat" = haven::read_sas(fullFile, ...), 
		"por" = haven::read_por(fullFile, ...), 
		"dta" = haven::read_dta(fullFile, ...), 
		"html" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_html(fullFile, ...)), "paragraph"), 
		"htm" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_html(fullFile, ...)), "paragraph"), 
		"php" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_html(fullFile, ...)), "paragraph"), 
		"pdf" = tibble::tibble(textreadr::read_pdf(fullFile, ...)), 
		"rtf" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_rtf(fullFile, ...)), "paragraph"), 
		"doc" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_doc(fullFile, ...)), "paragraph"), 
		"docx" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_docx(fullFile, ...)), "paragraph"), 
		stop("Sorry, but the file you have just chosen is not supported in this function. Report on this issue to the author (JooYoung Seo) at \n
		https://github.com/jooyoungseo/ezpickr/issues. :)")
	)
}   # Function ends.

