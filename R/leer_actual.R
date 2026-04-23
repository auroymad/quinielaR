#' Lee varias jornadas de la temporada actual
#' @param desde Jornada inicial
#' @param hasta Jornada final
#' @export
#' @import rvest
#' @import xml2
leer_actual <- function(desde, hasta){
  tablas <- lapply(desde:hasta, leer_jornada)
  do.call(rbind, tablas)
}
