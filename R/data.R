#' Net Generation of Electricity for the New York Region
#'
#' @description  The total hourly generation of electricity in the New York region since July 2015
#'
#' Units: megawatthours
#'
#' Time zone: UTC
#'
#'
#' @format A tsibble object with hourly intervals
#' @source US Energy Information Administration (Jan 2020) \href{https://www.eia.gov/}{website}
#' @keywords datasets time-series new-york electricity
#' @details The dataset contains the hourly generation of electricity in the New York region in megawatthours.
#' The series index is in UTC time zone
#' @examples
#'
#' data(ny_elec)
#'
#' library(plotly)
#'
#' plot_ly(data = ny_elec,
#'         x = ~ date_time,
#'         y = ~ series,
#'         type = "scatter",
#'         mode = "lines")
#'

"ny_elec"
