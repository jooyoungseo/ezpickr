#' view
#' @title Convenient function for viewing any rectangular data file in an Excel window.

#' @aliases view
#' @keywords view

#' @description You can use this function for loading any data.frame, data_frame, tbl_df, matrix, table, vector objects into your system-default spreadsheet software (e.g., Excel). This function has been inspired by \code{\link[BrailleR]{DataViewer}} and has implemented \code{\link[writexl]{write_xlsx}} instead of the default \code{\link[utils]{write.csv}} for a better performance.

#' @export view
#' @param x An object of class data.frame, matrix, table or vector.
#' @param ... Any additional arguments available for \link[writexl]{write_xlsx}.

#' @details
#' See example below.

#' @return Data object opened in a preferable spreadsheet application window.

#' @examples
#' if(interactive()) {
#' library(ezpickr)
#' data(airquality)
#' str(airquality)

#' ## View your data object in your spreadsheet software:
#' view(airquality)
#' # Then, when necessary, you can modify the opened data in the spreadsheet and save it as a new data.
#' 
#' # You can pass a list object to the `view()` function like below:
#' l <- list(iris = iris, mtcars = mtcars, chickwts = chickwts, quakes = quakes)
#' view(l)
#' # Then, each list item will appear in your Excel window sheet by sheet.
#' }

#' @author JooYoung Seo, \email{jooyoung@psu.edu}
#' @author Soyoung Choi, \email{sxc940@psu.edu}

# Function starts:
view <- 
function(x, ...) {

      # only for interactive sessions
  if (interactive()) {

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
    }

    return(if(length(readxl::excel_sheets(path=tmp)) > 1) {purrr::map(purrr::set_names(readxl::excel_sheets(path=tmp)), readxl::read_excel, path=tmp)} else {readxl::read_excel(tmp)})
    file.remove(tmp)
}  # end interactive
  else {
    warning("This function is only useful in interactive sessions.")
}  # end not interactive
      invisible(NULL)
# Function ends.
}
