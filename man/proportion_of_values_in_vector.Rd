% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proportion_of_values_in_vector.R
\name{proportion_of_values_in_vector}
\alias{proportion_of_values_in_vector}
\title{Proportion of given values in a vector}
\usage{
proportion_of_values_in_vector(
  values = NULL,
  vector = NULL,
  na.exclude = TRUE,
  output_type = "proportion",
  silent = FALSE,
  conf.level = 0.95,
  correct_yates = TRUE
)
}
\arguments{
\item{values}{a set of values that will count as successes (hits)}

\item{vector}{a numeric or character vector containing
successes (hits) and failures (misses)}

\item{na.exclude}{if \code{TRUE}, NA values will be removed both from
\code{vector} and \code{values} before calculation (default = TRUE).}

\item{output_type}{By default, \code{output_type = "proportion"}.
If \code{output_type = "proportion"}, the function will return
the calculated proportion; if \code{output_type = "se"}, the function
will return the standard error of the sample proportion;
if \code{output_type = "dt"}, the function will return the
the data table of proportion and confidence intervals.}

\item{silent}{If \code{silent = TRUE}, no message will be printed
regarding number of NA values or confidence interval. (default = FALSE)}

\item{conf.level}{confidence level of the returned confidence interval.
Input to this argument will be passed onto the conf.level argument
in the \code{prop.test} function from the default stats package.}

\item{correct_yates}{a logical indicating whether Yates' continuity
correction should be applied where possible (default = TRUE).
Input to this argument will be passed onto the \code{correct} argument
in the \code{prop.test} function from the default stats package.}
}
\description{
Proportion of given values in a vector
}
\examples{
proportion_of_values_in_vector(
  values = 2:3, vector = c(rep(1:3, each = 10), rep(NA, 10))
)
proportion_of_values_in_vector(
  values = 2:3, vector = c(rep(1:3, each = 10), rep(NA, 10)),
  output_type = "se"
)
proportion_of_values_in_vector(
  values = 2:3, vector = c(rep(1:3, each = 10), rep(NA, 10)),
  conf.level = 0.99
)
proportion_of_values_in_vector(
  values = c(2:3, NA), vector = c(rep(1:3, each = 10), rep(NA, 10)),
  na.exclude = FALSE
)
}
