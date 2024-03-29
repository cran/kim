#' Start kim
#'
#' Start kim (update kim; attach default packages; set working directory, etc.)
#' This function requires installing Package 'remotes' v2.4.2
#' (or possibly a higher version) by Csardi et al. (2021),
#' <https://cran.r-project.org/package=remotes>
#'
#' @param update If \code{update = "force"}, force updating the package
#' 'kim'. If \code{update = TRUE}, compares the currently installed package
#' 'kim' with the most recent version on GitHub and, if the version on GitHub
#' is more recent, ask the user to confirm the update. If confirmed,
#' then update the package. If \code{update = FALSE}, skip updating
#' the package. By default, \code{update = "force"}
#' @param upgrade_other_pkg input for the \code{upgrade} argument to
#' be passed on to \code{remotes::install_github}.
#' One of "default", "ask", "always", "never", TRUE, or FALSE.
#' "default" respects the value of the R_REMOTES_UPGRADE environment
#' variable if set, and falls back to "ask" if unset.
#' "ask" prompts the user for which out of date packages to upgrade.
#' For non-interactive sessions "ask" is equivalent to "always".
#' TRUE and FALSE correspond to "always" and "never" respectively.
#' By default, \code{upgrade_other_pkg = FALSE}.
#' @param setup_r_env logical. If \code{update = TRUE}, runs the function
#' setup_r_env in the package "kim". Type "?kim::setup_r_env" to learn more.
#' By default, \code{setup_r_env = TRUE}
#' @param default_packages a vector of names of packages to load and attach.
#' By default, \code{default_packages = c("data.table", "ggplot2")}
#' @param silent_load_pkgs a character vector indicating names of
#' packages to load silently (i.e., suppress messages that get printed
#' when loading the packages).
#' By default, \code{silent_load_pkgs = c("data.table", "ggplot2")}
#'
#' @examples
#' \dontrun{
#' start_kim()
#' start_kim(default_packages = c("dplyr", "ggplot2"))
#' start_kim(update = TRUE, setup_r_env = FALSE)
#' }
#' @export
start_kim <- function(
  update = TRUE,
  upgrade_other_pkg = FALSE,
  setup_r_env = TRUE,
  default_packages = c("data.table", "ggplot2"),
  silent_load_pkgs = c("data.table", "ggplot2")) {
  # update the package
  if (update == "force") {
    kim::update_kim(force = TRUE, upgrade_other_pkg = upgrade_other_pkg)
  } else if (update == TRUE) {
    kim::update_kim(force = FALSE, upgrade_other_pkg = upgrade_other_pkg)
  }
  # set up r env
  if (setup_r_env == TRUE) {
    kim::setup_r_env()
  }
  # default packages to attach
  if (length(default_packages) > 0) {
    kim::prep(
      default_packages,
      pkg_names_as_object = TRUE,
      silent_load_pkgs = silent_load_pkgs)
  }
}
