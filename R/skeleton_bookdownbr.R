#' skeleton_bookdownbr
#'
#' Arquivos basicos para bookdown em portugues
#'
#' @param path local em que sera criado o bookdown
#' @export
#' @importFrom here here

skeleton_bookdownbr <- function(path) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  onde <- here::here("inst", "rstudio", "templates", "project", "resources")

  files <- list.files(onde)
  from <- file.path(onde, files)

  file.copy(from, path)

}



