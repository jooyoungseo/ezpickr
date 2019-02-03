.onAttach<-function(...){
  if(interactive()) {
    packageStartupMessage("If your path/dataset contains any Korean characters, please use either mode='ko1' or mode='ko2' option when using pick() and view() functions.\n
    If you find this startup message annoying, please use `suppressPackageStartupMessages(library(ezpickr))` next time.")
  }
}
