#' skeleton_bookdownbr
#'
#' Arquivos basicos para bookdown em portugues
#'
#' @param path local em que sera criado o bookdown
#' @param ... more
#' @export
#' @importFrom here here
#' @examples
#' bookdownbr::skeleton_bookdownbr(path = "c:/bookbr/brazil")
skeleton_bookdownbr <- function(path, ...) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy the files from
  where <- here::here("inst", "rstudio", "templates", "project", "resources")
  files <- list.files(where, recursive = TRUE)
  source <- file.path(where, files)

  # copy the files to
  target <- file.path(path, files)

  # create new dir
  lapply(unique(dirname(target)), dir_create)

  # copy all files
  file.copy(source, target)
}

# create non-existing directories
dir_create <- function(path) {
  if (!dir.exists(path)) dir.create(path)
}
