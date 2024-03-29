% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare_dependent_rs.R
\name{compare_dependent_rs}
\alias{compare_dependent_rs}
\title{Compare dependent correlations}
\usage{
compare_dependent_rs(
  data = NULL,
  var_1_name = NULL,
  var_2_name = NULL,
  var_3_name = NULL,
  one_tailed = FALSE,
  round_r = 3,
  round_p = 3,
  round_t = 2,
  print_summary = TRUE,
  return_dt = FALSE
)
}
\arguments{
\item{data}{a data object (a data frame or a data.table)}

\item{var_1_name}{name of the variable whose correlations with two other
variables will be compared.}

\item{var_2_name}{name of the first of the two variables whose
correlations with \code{var_1_name} will be compared.}

\item{var_3_name}{name of the second of the two variables whose
correlations with \code{var_1_name} will be compared.}

\item{one_tailed}{logical. Should the p value based on a one-tailed
t-test? (default = FALSE)}

\item{round_r}{number of decimal places to which to round
correlation coefficients (default = 2)}

\item{round_p}{number of decimal places to which to round
p-values (default = 3)}

\item{round_t}{number of decimal places to which to round the
t-statistic (default = 2)}

\item{print_summary}{logical. Should the summary be printed?
(default = TRUE)}

\item{return_dt}{logical. Should the function return a summary table
as an output, as opposed to returning the output through the
"invisible" function? (default = FALSE)}
}
\value{
the output will be a summary of the test comparing two dependent
correlations
}
\description{
Compares whether two dependent correlations from the same sample are
significantly different each other.
}
\details{
Suppose that Variables A, B, and C are measured from a group of subjects.
This function tests whether A is related to B differently than to C.
Put differently, this function tests H0: r(A, B) = r(A, C)

For more information on formulas used in this function, please refer to
Steiger (1980) \doi{10.1037/0033-2909.87.2.245}
and Chen & Popovich (2002) \doi{10.4135/9781412983808}
}
\examples{
compare_dependent_rs(
data = mtcars, var_1_name = "mpg", var_2_name = "hp", var_3_name = "wt")
}
