#' Lee varias jornadas de la temporada actual
#' @param desde Jornada inicial
#' @param hasta Jornada final
#' @export
leer_actual <- function(desde, hasta){
  tablas <- lapply(desde:hasta, leer_jornada)
  do.call(rbind, tablas)
}
