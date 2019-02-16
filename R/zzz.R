.onAttach<-function(...){
  if(interactive()) {
    packageStartupMessage("If your path/dataset contains any Korean characters, please use `picko()` instead of `pick()` function.\n
    For those using UTF-8-based languages please keep employing `pick()`.\n
    If you find this startup message annoying, please use `suppressPackageStartupMessages(library(ezpickr))` next time.")
  }
}
