#' view
#' @title Convenient function for viewing any rectangular data file in an Excel window.

#' @aliases view
#' @keywords view

#' @description You can use this function for loading any data.frame, data_frame, tbl_df, matrix, table, vector objects into your system-default spreadsheet software (e.g., Excel). This function has been inspired by \code{\link[BrailleR]{DataViewer}} and has implemented \code{\link[writexl]{write_xlsx}} instead of the default \code{\link[utils]{write.csv}} for a better performance.

#' @export view
#' @param x An object of class data.frame, matrix, table or vector.
#' @param mode Character value for session locale and encoding; available values are: "ko1" for "CP949"; "ko2" for "UTF-8" while both change R locale into Korean (default is the current locale and encoding of your R session).
#' @param ... Any additional arguments available for \link[readr]{write_csv}.

#' @details
#' See example below.

#' @return Data object opened in a preferable spreadsheet application window.

#' @examples
#' if(interactive()) {
#' library(ezpickr)
#' data(airquality)
#' str(airquality)

#' ## View your data object in your spreadsheet software:
#' # Please use additional argument: either `mode="ko1"` or `mode="ko2"` for Korean dataset.
#' view(airquality)
#' # Then, when necessary, you can modify the opened data in the spreadsheet and save it as a new data.
#' }

#' @author JooYoung Seo, \email{jooyoung@psu.edu}
#' @author Soyoung Choi, \email{sxc940@psu.edu}

# Function starts:
view <- 
function(x, mode = NULL, ...) {

      # only for interactive sessions
  if (interactive()) {
	if(!is.null(mode)) {
		if(mode == "ko1") {
			Sys.setlocale("LC_ALL", "Korean")
			options(encoding="CP949")
		} else if(mode == "ko2") {
			Sys.setlocale("LC_ALL", "Korean")
			options(encoding="UTF-8")
		}
	}

    if(is.matrix(x) || is.table(x)) {
      x <- data.frame(x)
    }

    tmp <- tempfile(fileext = ".xlsx")
    writexl::write_xlsx(x, tmp, ...)
    utils::browseURL(tmp)

    Sys.sleep(5)
    file <- readline("Enter the file name you want to save as (press enter to skip): ")

    if(file != "") {
      if(!stringr::str_detect(file, "(.xlsx)$")) {
        new_file <- paste0(file, ".xlsx")
      } else {
        new_file <- file
      }

      file.copy(from=tmp, to=paste0(getwd(), "/", new_file))
    return(readxl::read_excel(new_file))
  }

    file.remove(tmp)
}  # end interactive
  else {
    warning("This function is only useful in interactive sessions.")
}  # end not interactive
      invisible(NULL)
# Function ends.
}
