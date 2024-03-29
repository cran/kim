% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unload_user_installed_pkgs.R
\name{unload_user_installed_pkgs}
\alias{unload_user_installed_pkgs}
\title{Unload all user-installed packages}
\usage{
unload_user_installed_pkgs(exceptions = NULL, force = FALSE, keep_kim = TRUE)
}
\arguments{
\item{exceptions}{a character vector of names of packages to keep loaded}

\item{force}{logical. Should a package be unloaded even though other
attached packages depend on it? By default, \code{force = FALSE}}

\item{keep_kim}{logical. If \code{keep_kim = FALSE}, Package 'kim'
will be detached along with all other user-installed packages.
If \code{keep_kim = TRUE}, Package 'kim' will not be detached.
By default, \code{keep_kim = FALSE}}
}
\description{
Unload all user-installed packages
}
\examples{
\dontrun{
unload_user_installed_pkgs()
}
}
