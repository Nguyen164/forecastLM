#-------------- Data Pull --------------
`%>%` <- magrittr::`%>%`
#---------------------------------------
# Pulling the net generation of electricity for the New York region
command <- paste("curl 'http://api.eia.gov/series/?api_key=",
                 eia_key,
             "&series_id=EBA.NY-ALL.NG.H&out=json&end=20191231' | jq -r '.series[].data[] | @tsv'",
             sep = "")

ny_elec <- utils::read.table(text = system(command = command, intern = TRUE), sep = "\t") %>%
  stats::setNames(c("timestamp", "y")) %>%
  dplyr::mutate(date_time = lubridate::ymd_h(timestamp, tz = "UTC")) %>%
  dplyr::select(date_time, y) %>%
  dplyr::arrange(date_time) %>%
  tsibble::as_tsibble(index = "date_time")

tail(ny_elec)

table(is.na(ny_elec))

usethis::use_data(ny_elec, overwrite = TRUE)
#---------------------------------------
# Pulling the New York natural gas residential consumption
command <- paste("curl 'http://api.eia.gov/series/?api_key=",
                 eia_key,
                 "&series_id=NG.N3010NY2.M&out=json&start=19970101&end=20191201' | jq -r '.series[].data[] | @tsv'",
                 sep = "")

ny_gas <- utils::read.table(text = system(command = command, intern = TRUE), sep = "\t") %>%
  stats::setNames(c("date_temp", "y")) %>%
  dplyr::mutate(date = zoo::as.yearmon(lubridate::ymd(paste(date_temp, "01", sep = "/")))) %>%
  dplyr::select(date, y) %>%
  dplyr::arrange(date) %>%
  tsibble::as_tsibble(index = "date")

tail(ny_gas)

table(is.na(ny_gas))

usethis::use_data(ny_gas, overwrite = TRUE)
#---------------------------------------
