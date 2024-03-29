% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/und.R
\name{und}
\alias{und}
\title{Undocumented functions}
\usage{
und(fn, ...)
}
\arguments{
\item{fn}{name of the function}

\item{...}{arguments for the function}
}
\value{
the output will vary by function
}
\description{
A collection of miscellaneous functions lacking documentations
}
\examples{
# correlation
und(corr_text, x = 1:5, y = c(1, 2, 2, 2, 3))
# mean center
und(mean_center, 1:10)
# compare results with base function
scale(1:10, scale = TRUE)
# find the modes
und(mode, c(3, 3, 3, 1, 2, 2))
# return values that are not outliers
und(outlier_rm, c(12:18, 100))
kim::outlier(c(1:10, 100))
}
