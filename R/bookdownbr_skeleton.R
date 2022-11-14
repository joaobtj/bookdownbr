#' bookdownbr_skeleton
#'
#' @param path path
#'
#' @importFrom xfun normalize_path
#' @importFrom xfun relative_path
#'
#' @export
#'
#' @examples
#' bookdownbr_skeleton(path = "c:/bookbr/brazil")
bookdownbr_skeleton <- function(path) {
  # ensure directory exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  path <- xfun::normalize_path(path)

  # Get common resources
  files <- skeleton_get_files()
  # files_format = skeleton_get_files(output_format)
  # copy them to path
  source <- file.path(skeleton_get_dir(), c(files))
  # common resource are copied without folder
  target <- file.path(path, xfun::relative_path(files))

  lapply(unique(dirname(target)), dir_create)
  file.copy(source, target)

  invisible(TRUE)
}

bookdownbr_file <- function(...) {
  system.file(..., package = "bookdownbr", mustWork = TRUE)
}

skeleton_get_dir <- function(...) {
  bookdownbr_file("rstudio", "templates", "project", "resources", ...)
}

`%n%` <- knitr:::`%n%`

skeleton_get_files <- function(subdir = NULL, relative = TRUE) {
  resources <- skeleton_get_dir()
  subdir <- file.path(resources, subdir %n% "")
  if (!dir.exists(subdir)) {
    return(NULL)
  }
  files <- list.files(subdir, recursive = TRUE, include.dirs = FALSE, full.names = TRUE)
  if (relative) xfun::relative_path(files, resources) else files
}

#' @importFrom xfun dir_exists
dir_create <- function(path) {
  xfun::dir_exists(path) || dir.create(path, recursive = TRUE)
}
