% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/histogram_by_group.R
\name{histogram_by_group}
\alias{histogram_by_group}
\title{Histogram by group}
\usage{
histogram_by_group(
  data = NULL,
  iv_name = NULL,
  dv_name = NULL,
  order_of_groups_top_to_bot = NULL,
  number_of_bins = 40,
  space_between_histograms = 0.15,
  draw_baseline = FALSE,
  xlab = NULL,
  ylab = NULL,
  x_limits = NULL,
  x_breaks = NULL,
  x_labels = NULL,
  sigfigs = 3,
  convert_dv_to_numeric = TRUE
)
}
\arguments{
\item{data}{a data object (a data frame or a data.table)}

\item{iv_name}{name of the independent variable}

\item{dv_name}{name of the dependent variable}

\item{order_of_groups_top_to_bot}{a character vector indicating
the desired presentation order of levels in the independent variable
(from the top to bottom). Omitting a group in this argument will
remove the group in the set of histograms.}

\item{number_of_bins}{number of bins for the histograms (default = 40)}

\item{space_between_histograms}{space between histograms
(minimum = 0, maximum = 1, default = 0.15)}

\item{draw_baseline}{logical. Should the baseline and the trailing
lines to either side of the histogram be drawn? (default = FALSE)}

\item{xlab}{title of the x-axis for the histogram by group.
If \code{xlab = FALSE}, the title will be removed. By default
(i.e., if no input is given), \code{dv_name} will be used as
the title.}

\item{ylab}{title of the y-axis for the histogram by group.
If \code{ylab = FALSE}, the title will be removed. By default
(i.e., if no input is given), \code{iv_name} will be used as
the title.}

\item{x_limits}{a numeric vector with values of the endpoints
of the x axis.}

\item{x_breaks}{a numeric vector indicating the points at which to
place tick marks on the x axis.}

\item{x_labels}{a vector containing labels for the place tick marks
on the x axis.}

\item{sigfigs}{number of significant digits to round to (default = 3)}

\item{convert_dv_to_numeric}{logical. Should the values in the
dependent variable be converted to numeric for plotting the
histograms? (default = TRUE)}
}
\value{
the output will be a set of vertically arranged histograms
(a ggplot object), i.e., one histogram for each level of the
independent variable.
}
\description{
Creates histograms by group to compare distributions.
}
\details{
The following package(s) must be installed prior to running this function:
Package 'ggridges' v0.5.3 (or possibly a higher version) by
Claus O. Wilke (2021),
\url{https://cran.r-project.org/package=ggridges}
}
\examples{
\donttest{
histogram_by_group(data = mtcars, iv_name = "cyl", dv_name = "mpg")
histogram_by_group(
  data = mtcars, iv_name = "cyl", dv_name = "mpg",
  order_of_groups_top_to_bot = c("8", "4"), number_of_bins = 10,
  space_between_histograms = 0.5
)
histogram_by_group(
data = iris, iv_name = "Species", dv_name = "Sepal.Length", x_breaks = 4:8,
x_limits = c(4, 8))
}
}
