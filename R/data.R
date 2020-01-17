#' Net Generation of Electricity for the New York Region
#'
#' The total hourly generation of electricity in the New York region since July 2015
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
#'         y = ~ y,
#'         type = "scatter",
#'         mode = "lines")
#'

"ny_elec"

#' The New York Natural Gas Residential Monthly Consumption (1997-2019)
#'
#' Units: Million Cubic Feet
#'
#' Time zone: UTC
#'
#'
#' @format A tsibble object with monthly intervals
#' @source US Energy Information Administration (Jan 2020) \href{https://www.eia.gov/}{website}
#' @keywords datasets time-series new-york natural gas
#' @details The dataset contains the monthly consumption of natural gas in the New York in million cubic feet.
#' The series index is in year-month format
#' @examples
#'
#' data(ny_gas)
#'
#' library(plotly)
#'
#' plot_ly(data = ny_gas,
#'         x = ~ date,
#'         y = ~ y,
#'         type = "scatter",
#'         mode = "lines")
#'

"ny_gas"
