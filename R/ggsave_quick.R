#' ggsave quick
#'
#' quickly save the current plot with a timestamp
#'
#' @param name a character string of the png file name.
#' By default, if no input is given (\code{name = NULL}),
#' the file name will begin with "ggplot".
#' If the desired output file name is "myplot.png",
#' enter \code{name = "myplot", timestamp = FALSE}
#' @param file_name_extension file name extension (default = "png").
#' If \code{file_name_extension = "svg"}, Package svglite needs to
#' be installed.
#' @param timestamp if \code{timestamp = TRUE}, a timestamp of the
#' current time will be appended to the file name.
#' The timestamp will be in the format, jan_01_2021_1300_10_000001,
#' where "jan_01_2021" would indicate January 01, 2021;
#' 1300 would indicate 13:00 (i.e., 1 PM); and 10_000001 would
#' indicate 10.000001 seconds after the hour.
#' By default, \code{timestamp} will be set as TRUE, if no input
#' is given for the \code{name} argument, and as FALSE, if an input
#' is given for the \code{name} argument.
#' @param width width of the plot to be saved. This argument will be
#' directly entered as the \code{width} argument for the \code{ggsave}
#' function within \code{ggplot2} package (default = 16)
#' @param height height of the plot to be saved. This argument will be
#' directly entered as the \code{height} argument for the \code{ggsave}
#' function within \code{ggplot2} package (default = 9)
#' @return the output will be a .png image file in the working directory.
#' @examples
#' \dontrun{
#' kim::histogram(rep(1:30, 3))
#' ggsave_quick()
#' }
#' @export
ggsave_quick <- function(
  name = NULL,
  file_name_extension = "png",
  timestamp = NULL,
  width = 16,
  height = 9) {
  # check if Package 'ggplot2' is installed
  if (!"ggplot2" %in% rownames(utils::installed.packages())) {
    message(paste0(
      "This function requires the installation of Package 'ggplot2'.",
      "\nTo install Package 'ggplot2', type ",
      "'kim::prep(ggplot2)'",
      "\n\nAlternatively, to install all packages (dependencies) required ",
      "for all\nfunctions in Package 'kim', type ",
      "'kim::install_all_dependencies()'"))
    return()
  }
  if (file_name_extension == "svg") {
    if (!"svglite" %in% rownames(utils::installed.packages())) {
      message(paste0(
        'Setting the argument file_name_extension = "svg" requires\n',
        "the installation of Package 'svglite'.",
        "\nTo install Package 'svglite', type ",
        "'kim::prep(svglite)'",
        "\n\nAlternatively, to install all packages (dependencies) required ",
        "for all\nfunctions in Package 'kim', type ",
        "'kim::install_all_dependencies()'"))
      return()
    }
  }

  # check default values
  if (file_name_extension %in% c("png", "svg") == FALSE) {
    stop(paste0(
      "The current version of the function accepts only the following\n",
      "inputs for the `file_name_extension` argument: ",
      paste0(c("png", "svg"), collapse = ", "),
      "."))
  }
  # set default values
  if (is.null(name) & is.null(timestamp)) {
    timestamp <- TRUE
    name <- "ggplot"
  } else if (!is.null(name) & is.null(timestamp)) {
    timestamp <- FALSE
  }
  # create a timestamp
  if (timestamp == TRUE) {
    ts <- tolower(
      gsub("\\.", "_", format(Sys.time(), "_%b_%d_%Y_%H%M_%OS6")))
  } else {
    ts <- ""
  }
  # set file name
  file_name <- paste0(name, ts, ".", file_name_extension)
  # save
  ggplot2::ggsave(
    filename = file_name, width = width, height = height)
}
