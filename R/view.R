#' view
#' @title Seamlessly manipulate any rectangular data file between an Excel window and R session.

#' @aliases view
#' @keywords internal

#' @description view function is deprecated to avoid any collision with \link[tibble]{view} function. Please use \link[ezpickr]{viewxl} instead.

#' @export view
#' @param x An object of class data.frame, matrix, table or vector.
#' @param ... Any additional arguments available for \link[writexl]{write_xlsx}.

#' @details
#' See example below.

#' @return Data object opened in a preferable spreadsheet application window which will in turn be called on your R session again.
#' @seealso \link[ezpickr]{viewxl}.
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
    deprecate_message_once("view()", "viewxl()")

    viewxl(x = x, ...)
# Function ends.
}
