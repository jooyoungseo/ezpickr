#' pick
#' @title Choosing any rectangular data file using interactive GUI dialog box.

#' @aliases pick
#' @keywords pick

#' @description You can alternatively use this function for choosing *.csv, *.csv2, *.tsv, *.txt, *.xls, *.xlsx, *.json, *.html, *.htm, *.php, *.pdf, *.doc, *.docx, *.rtf, *.RData, *.Rda, *.RDS, *.sav (SPSS), *.por, *.sas7bdat, *.sas7bcat, and *.dta files in an interactive GUI mode A file choose dialog box will be prompted.

#' @export pick
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

#' @examples

#'\dontrun{
#' library(ezpickR)
#' # Choosing file and saving it into a variable
#' ## Scenario 1: Picking up a file using interactive GUI dialog box:
#' data <- pick()
#' 
#' ## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below;
#' ## however, you can feed other files through this function
#' ## such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt,
#' ## *.html, webpage URL, *doc, *.docx, *.pdf, *.rtf, *.json, *.Rda, *.Rdata, and more):
#' data <- pick("test.sav")
#' 
#' # Now you can use the imported file as a data frame.
#' str(data)
#'}

#' @author JooYoung Seo (jooyoung@psu.edu)

pick <-
function(file = NULL, ...) {   # Function starts:

	if (is.null(file)) {
		fullFile <- file.choose()
	} else {
		fullFile <- file
	}

	fileExt <- tools::file_ext(fullFile)

	switch(fileExt, 
		"csv" = readr::read_csv(file = fullFile, ...), 
		"csv2" = readr::read_csv2(file = fullFile, ...), 
		"tsv" = readr::read_tsv(file = fullFile, ...), 
		"txt" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = readr::read_file(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)), 
		"xlsx" = readxl::read_excel(fullFile, ...), 
		"xls" = readxl::read_excel(fullFile, ...), 
		"json" = jsonlite::fromJSON(fullFile, ...), 
		"rdata" = load(file = fullFile, ...), 
		"rda" = load(file = fullFile, ...), 
		"rds" = readRDS(file = fullFile, ...), 
		"sav" = haven::read_sav(fullFile, ...), 
		"sas7bdat" = haven::read_sas(fullFile, ...), 
		"sas7bcat" = haven::read_sas(fullFile, ...), 
		"por" = haven::read_por(fullFile, ...), 
		"dta" = haven::read_dta(fullFile, ...), 
		"html" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = textreadr::read_html(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)), 
		"htm" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = textreadr::read_html(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)), 
		"php" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = textreadr::read_document(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)), 
		"pdf" = textreadr::read_pdf(fullFile, ...), 
		"rtf" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = textreadr::read_rtf(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)), 
		"doc" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = textreadr::read_doc(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)),
		"docx" = tibble::as_tibble(dplyr::select(dplyr::mutate(data.frame(text = textreadr::read_docx(fullFile, ...)), paragraph = dplyr::row_number()), paragraph, text)), 
		stop("Sorry, but the file you have just chosen is not supported in this function. Report on this issue to the author (JooYoung Seo) at https://github.com/jooyoungseo/ezpickR/issues. :)")
	)
}   # Function ends.

