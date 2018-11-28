devtools::document()
usethis::use_version()
notepad NEWS.md
cp NEWS.md inst/NEWS

sink('log.txt')
devtools::check()
devtools::check_rhub()
devtools::check_win_devel()
devtools::build()
usethis::use_cran_comments()
sink()

git add *
git commit -m "CRAN Release"

devtools::release()
