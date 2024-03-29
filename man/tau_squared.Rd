% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tau_squared.R
\name{tau_squared}
\alias{tau_squared}
\title{Tau-squared (between-studies variance for meta analysis)}
\usage{
tau_squared(effect_sizes = NULL, effect_size_variances = NULL)
}
\arguments{
\item{effect_sizes}{effect sizes (e.g., standardized mean differences)}

\item{effect_size_variances}{within-study variances}
}
\description{
Calculate tau-squared, the between-studies variance (the variance of the
effect size parameters across the population of studies), as illustrated
in Borenstein et al. (2009, pp. 72-73, ISBN: 978-0-470-05724-7).
}
\details{
Negative values of tau-squared are converted to 0 in the output (see
Cheung, 2013;
https://web.archive.org/web/20230512225539/https://openmx.ssri.psu.edu/thread/2432)
}
\examples{
\dontrun{
tau_squared(effect_sizes = c(1, 2), effect_size_variances = c(3, 4))
# a negative tau squared value is converted to 0:
tau_squared(effect_sizes = c(1.1, 1.4), effect_size_variances = c(1, 4))
}
}
