#' pick
#' @title Choosing any rectangular data file using interactive GUI dialog box.

#' @aliases pick
#' @keywords pick

#' @description You can alternatively use this function for choosing *.csv, *.csv2, *.tsv, *.txt, *.xls, *.xlsx, *.json, *.html, *.htm, *.php, *.pdf, *.doc, *.docx, *.rtf, *.RData, *.Rda, *.RDS, *.sav (SPSS), *.por, *.sas7bdat, *.sas7bcat, *.dta, *.xpt, *.mbox, and *.Rmd files in an interactive GUI mode A file choose dialog box will be prompted.

#' @export pick
#' @param file Either a path to a file, a connection, or literal data (either a single string or a raw vector). The default is NULL, which pops up an interactive GUI file choose dialogue box for users unless an explicit path/to/filename is given.
#' Each corresponding function depending upon a file extension will be automatically matched and applied once you pick up your file using either the GUI-file-chooser dialog box or explicit path/to/filename.
#' @param mode Character value for session locale and encoding; available values are: "ko1" for "CP949"; "ko2" for "UTF-8" while both change R locale into Korean (default is the current locale and encoding of your R session).
#' @param ... Any additional arguments available for each file type and extension:
#' \link[readr]{read_csv} for CSV (Comma-Separated Values) files; \link[readr]{read_csv2} for CSV2 (Semicolon-Separated Values) files; 
#' \link[readr]{read_tsv} for 'TSV' (Tab-Separated Values) files; \link[readr]{read_file} for 'txt' (plain text) files; 
#' \link[readxl]{read_excel} for 'Excel' files; \link[haven]{read_spss} for 'SPSS' files; \link[haven]{read_stata} for 'Stata' files; 
#' \link[haven]{read_sas} for 'SAS' files; \link[textreadr]{read_document} for 'Microsoft Word', 'PDF', 'RTF', 'HTML', 'HTM', and 'PHP' files; 
#' \link[jsonlite]{fromJSON} for 'JSON' files; \link[mboxr]{read_mbox} for 'mbox' files; \link[rmarkdown]{render} for 'Rmd' files; \link[base]{readRDS} for 'RDS' files; \link[base]{load} for 'RDA' and 'RDATA' files.

#' @details
#' See example below.

#' @return tibble (table data.frame) object of the chosen rectangular data file will be returned.
#' @seealso \link[ezpickr]{picko} for Korean users.
#' @examples
#' # Choosing file and saving it into a variable
#' ## Scenario 1: Picking up a file using interactive GUI dialog box:
#' if(interactive()) {
#'   library(ezpickr)
#' ## Use either `pick(mode="ko1")` or `pick(mode="ko2")` for Korean R users.
#'   data <- pick() 
#' }
#' 
#' ## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below;
#' ## however, you can feed other files through this function
#' ## such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt,
#' ## *.html, webpage URL, *doc, *.docx, *.pdf, *.rtf, *.json, *.Rda, *.Rdata, and more):
#' library(ezpickr)
#' test <- system.file("extdata", "airquality.sav", package = "ezpickr")
#' ## Use either `pick(test, mode="ko1")` or `pick(test, mode="ko2")` for Korean R users.
#' data <- pick(test)
#' 
#' # Now you can use the imported file as a tibble.
#' str(data)

#' @author JooYoung Seo, \email{jooyoung@psu.edu}
#' @author Soyoung Choi, \email{sxc940@psu.edu}

pick <-
function(file = NULL, mode = NULL, ...) {   # Function starts:

	elipsis <- list(...)

	if(!is.null(mode)) {
		if(mode == "ko1") {
			Sys.setlocale("LC_ALL", "Korean")
			options(encoding="CP949")
#			if(is.null(file)) {
#				fullFile <- enc2native(fullFile)
#			}
		} else if(mode == "ko2") {
			Sys.setlocale("LC_ALL", "Korean")
			options(encoding="UTF-8")
#			if(is.null(file)) {
#				fullFile <- enc2native(fullFile)
#			}
		}
	}

	if (is.null(file)) {
		fullFile <- enc2native(file.choose())
	} else {
		fullFile <- file
	}

	fileExt <- tolower(tools::file_ext(fullFile))

	switch(fileExt, 
		"csv" = if("delim" %in% names(elipsis)) {readr::read_delim(file = fullFile, ...)} else {readr::read_csv(file = fullFile, ...)}, 
		"csv2" = if("delim" %in% names(elipsis)) {readr::read_delim(file = fullFile, ...)} else {readr::read_csv2(file = fullFile, ...)}, 
		"tsv" = if("delim" %in% names(elipsis)) {readr::read_delim(file = fullFile, ...)} else {readr::read_tsv(file = fullFile, ...)}, 
		"txt" = tibble::rowid_to_column(tibble::tibble(text = readr::read_file(fullFile, ...)), "paragraph"), 
		"xlsx" = if(!length(elipsis)) { if(length(readxl::excel_sheets(path=fullFile)) > 1) {purrr::map(purrr::set_names(readxl::excel_sheets(path = fullFile)), readxl::read_excel, path = fullFile, ...)} else {readxl::read_excel(fullFile, ...)} } else {readxl::read_excel(fullFile, ...)}, 
		"xls" = if(!length(elipsis)) { if(length(readxl::excel_sheets(path=fullFile)) > 1) {purrr::map(purrr::set_names(readxl::excel_sheets(path = fullFile)), readxl::read_excel, path = fullFile, ...)} else {readxl::read_excel(fullFile, ...)} } else {readxl::read_excel(fullFile, ...)}, 
		"json" = tibble::tibble(jsonlite::fromJSON(fullFile, ...)), 
		"rdata" = load(file = fullFile, ...), 
		"rda" = load(file = fullFile, ...), 
		"rds" = readRDS(file = fullFile, ...), 
		"sav" = haven::read_sav(fullFile, ...), 
		"sas7bdat" = haven::read_sas(fullFile, ...), 
		"sas7bcat" = haven::read_sas(fullFile, ...), 
		"por" = haven::read_por(fullFile, ...), 
		"dta" = haven::read_dta(fullFile, ...), 
		"xpt" = haven::read_xpt(fullFile, ...), 
		"html" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_html(fullFile, ...)), "paragraph"), 
		"htm" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_html(fullFile, ...)), "paragraph"), 
		"php" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_html(fullFile, ...)), "paragraph"), 
		"pdf" = tibble::tibble(textreadr::read_pdf(fullFile, ...)), 
		"rtf" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_rtf(fullFile, ...)), "paragraph"), 
		"doc" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_doc(fullFile, ...)), "paragraph"), 
		"docx" = tibble::rowid_to_column(tibble::tibble(text = textreadr::read_docx(fullFile, ...)), "paragraph"), 
		"mbox" = mboxr::read_mbox(fullFile, ...), 
		"rmd" = lapply(rmarkdown::render(fullFile, output_format='all'), utils::browseURL), 
		stop("Sorry, but the file you have just chosen is not supported in this function. Report on this issue to the author (JooYoung Seo) at \n
		https://github.com/jooyoungseo/ezpickr/issues. :)")
	)
}   # Function ends.

