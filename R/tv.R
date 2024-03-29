#' Tabulate vector
#'
#' Shows frequency and proportion of unique values in a table format.
#' This function is a copy of the earlier function, tabulate_vector,
#' in Package 'kim'
#'
#' @param vector a character or numeric vector
#' @param na.rm if \code{TRUE}, NA values will be removed before calculating
#' frequencies and proportions. By default, \code{FALSE}.
#' @param sort_by_decreasing_count if \code{TRUE}, the output table will
#' be sorted in the order of decreasing frequency.
#' @param sort_by_increasing_count if \code{TRUE}, the output table will
#' be sorted in the order of increasing frequency.
#' @param sort_by_decreasing_value if \code{TRUE}, the output table will
#' be sorted in the order of decreasing value.
#' @param sort_by_increasing_value if \code{TRUE}, the output table will
#' be sorted in the order of increasing value.
#' @param total_included if \code{TRUE}, the output table will include
#' a row for total counts.
#' @param sigfigs number of significant digits to round to
#' @param round_digits_after_decimal round to nth digit after decimal
#' (alternative to \code{sigfigs})
#' @param output_type if \code{output_type = "df"}, return a data.frame.
#' By default, \code{output_type = "dt"}, which will return a data.table.
#' @return if \code{output_type = "dt"}, which is the default, the output
#' will be a data.table showing the count and proportion (percent) of each
#' element in the given vector; if \code{output_type = "df"}, the output will
#' be a data.frame showing the count and proportion (percent) of each value
#' in the given vector.
#' @examples
#' tv(c("a", "b", "b", "c", "c", "c", NA))
#' tv(c("a", "b", "b", "c", "c", "c", NA),
#'   sort_by_increasing_count = TRUE
#' )
#' tv(c("a", "b", "b", "c", "c", "c", NA),
#'   sort_by_decreasing_value = TRUE
#' )
#' tv(c("a", "b", "b", "c", "c", "c", NA),
#'   sort_by_increasing_value = TRUE
#' )
#' tv(c("a", "b", "b", "c", "c", "c", NA),
#'   sigfigs = 4
#' )
#' tv(c("a", "b", "b", "c", "c", "c", NA),
#'   round_digits_after_decimal = 1
#' )
#' tv(c("a", "b", "b", "c", "c", "c", NA),
#'   output_type = "df"
#' )
#' @export
# tabulate vector frequency table
tv <- function(
  vector = NULL,
  na.rm = FALSE,
  sort_by_decreasing_count = NULL,
  sort_by_increasing_count = NULL,
  sort_by_decreasing_value = NULL,
  sort_by_increasing_value = NULL,
  total_included = TRUE,
  sigfigs = NULL,
  round_digits_after_decimal = NULL,
  output_type = "dt") {
  # deal with NA values
  if (na.rm == TRUE) {
    temp_1 <- vector[!is.na(vector)]
  } else if (na.rm == FALSE) {
    temp_1 <- vector
  } else {
    stop("Unrecognized value for the argument, na.rm")
  }
  # unique values
  value <- sort(unique(temp_1), na.last = TRUE)
  # count
  count <- vapply(value, function(x) {
    if (is.na(x)) {
      count_for_given_value <- sum(is.na(temp_1))
    } else {
      count_for_given_value <- sum(sum(temp_1 == x, na.rm = TRUE))
    }
    return(count_for_given_value)
  }, FUN.VALUE = numeric(1L))
  # total count
  total_count <- sum(count)
  # percent
  percent <- vapply(value, function(x) {
    if (is.na(x)) {
      percent_for_given_value <-
        sum(is.na(temp_1)) / total_count * 100
    } else {
      percent_for_given_value <-
        sum(temp_1 == x, na.rm = TRUE) / total_count * 100
    }
    return(percent_for_given_value)
  }, FUN.VALUE = numeric(1L))
  # data table without totals
  dt_1 <- data.table::data.table(
    value, count, percent
  )
  # set the default sorting method
  if (sum(c(
    is.null(sort_by_decreasing_count),
    is.null(sort_by_increasing_count),
    is.null(sort_by_decreasing_value),
    is.null(sort_by_increasing_value)
  )) == 4) {
    sort_by_decreasing_count <- TRUE
  }
  # check the argument inputs for sorting
  unique_values_in_sort_args <- unique(c(
    sort_by_decreasing_count,
    sort_by_increasing_count,
    sort_by_decreasing_value,
    sort_by_increasing_value
  ))
  # sort based on argument inputs
  if (identical(unique_values_in_sort_args, TRUE)) {
    if (sum(c(
      sort_by_decreasing_count,
      sort_by_increasing_count,
      sort_by_decreasing_value,
      sort_by_increasing_value
    )) == 1) {
      if (!is.null(sort_by_decreasing_count)) {
        data.table::setorder(dt_1, -count)
      } else if (!is.null(sort_by_increasing_count)) {
        data.table::setorder(dt_1, count)
      } else if (!is.null(sort_by_decreasing_value)) {
        data.table::setorder(dt_1, -value)
      } else if (!is.null(sort_by_increasing_value)) {
        data.table::setorder(dt_1, value)
      }
    } else {
      stop(paste0(
        "Please make sure that only 1 of the 4 arguments for sorting",
        " is set as TRUE and that 3 other arguments take the ",
        "default value of NULL."
      ))
    }
  } else {
    stop(paste0(
      "Please make sure that only 1 of the 4 arguments for sorting",
      " is set as TRUE and that 3 other arguments take the ",
      "default value of NULL."
    ))
  }
  # include totals
  if (total_included == TRUE) {
    # convert the value column to a character column to accommodate
    # the last row showing the total
    dt_1[["value"]] <- as.character(dt_1[["value"]])
    dt_1[["count"]] <- as.numeric(dt_1[["count"]])
    dt_1[["percent"]] <- as.numeric(dt_1[["percent"]])
    dt_2 <- data.table::data.table(
      value = "..Total:",
      count = total_count,
      percent = sum(dt_1[["percent"]])
    )
    dt_1 <- data.table::rbindlist(list(dt_1, dt_2))
  }
  # set the default rounding method
  if (sum(c(
    is.null(sigfigs),
    is.null(round_digits_after_decimal)
  )) == 2) {
    sigfigs <- 2
  }
  # round percentages
  if (is.numeric(sigfigs)) {
    dt_1[["percent"]] <- kim::round_flexibly(dt_1[["percent"]], sigfigs)
    if (is.numeric(round_digits_after_decimal)) {
      message(paste0(
        "Only the sigfigs argument was used.\n",
        "Your input for round_digits_after_decimal ",
        "argument was ignored."
      ))
    }
  } else if (is.numeric(round_digits_after_decimal)) {
    dt_1[["percent"]] <- round(
      dt_1[["percent"]], round_digits_after_decimal
    )
  }
  # set output_type
  if (output_type == "df") {
    dt_1 <- as.data.frame(dt_1)
  }
  return(dt_1)
}
