library(rmarkdown)

knit_to_netlify <- function(day, rmd_file) {

  tryCatch(setwd(paste0("slides/", day)),
           error = function(e) NA)

  render(rmd_file)

  html_file <- gsub(".Rmd", ".html", rmd_file)

  #file.copy(from = html_file,
  #          to = paste0("../netlify/", day, "/", html_file),
  #          overwrite = TRUE)

  setwd("../../")
}


rmds <- list(c("day1", "01-1-Welcome.Rmd"),
             c("day1", "01-2-R-tour.Rmd"),
             c("day1", "01-3-R-bakery.Rmd"),
             c("day1", "01-4-Tables-and-dataframes.Rmd"),

             c("day2", "02-1-Data_wrangling.Rmd"))

sapply(rmds, function(x) knit_to_netlify(x[1], x[2]))
