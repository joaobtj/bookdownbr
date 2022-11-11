#' Bookdownbr Download
#'
#' @importFrom here here
#' @importFrom utils unzip
#' @importFrom utils download.file

bookdownbr_download <- function(){

# apagar o diretório resources

unlink(here::here("inst", "rstudio", "templates", "project", "resources"),
  recursive = TRUE,
  force = TRUE
)

# download do arquivo até a pasta project
url <- "https://github.com/joaobtj/curso-bookdownbr/archive/refs/heads/main.zip"
utils::download.file(url, destfile = "bookdownbr.zip")
utils::unzip("bookdownbr.zip",
  exdir = here::here("inst", "rstudio", "templates", "project")
)

# remover alguns arquivos
file.remove(paste0(
  here::here("inst", "rstudio", "templates", "project", "curso-bookdownbr-main"),
  "/",
  c("renv.lock", ".Rbuildignore", ".Rprofile", "curso-bookdownbr.Rproj")
))
unlink(
  paste0(
    here::here("inst", "rstudio", "templates", "project", "curso-bookdownbr-main"),
    "/",
    c("renv", ".github")
  ),
  recursive = TRUE,
  force = TRUE
)

# mover o conteúdo da pasta curso-bookdownbr-main para resources

## function to move files
move_files <- function(x) {
  file.rename(
    from = file.path(here::here("inst", "rstudio", "templates", "project", "curso-bookdownbr-main"), x),
    to = file.path(here::here("inst", "rstudio", "templates", "project", "resources"), x)
  )
}

# apply the function to all files
dir.create(here::here("inst", "rstudio", "templates", "project", "resources"))
dir.create(paste0(here::here("inst", "rstudio", "templates", "project", "resources"),
           "/",
           list.dirs(here::here("inst", "rstudio", "templates", "project", "curso-bookdownbr-main"),
                     full.names = FALSE)[-1]))

names <- list.files(here::here("inst", "rstudio", "templates", "project", "curso-bookdownbr-main"),
  recursive = TRUE
)
lapply(names, move_files)


# apagar a pasta curso-bookdownbr-main

unlink(here::here("inst", "rstudio", "templates", "project", "curso-bookdownbr-main"),
       recursive = TRUE,
       force = TRUE
)

# apagar o arquivo bookdownbr.zip
file.remove("bookdownbr.zip")



}
