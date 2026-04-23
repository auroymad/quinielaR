#' Parseo simple para columnas tipo "Equipo (Fuerza)"
#' @param texto Cadena con formato "Equipo (1234.5)"
#' @return data.frame con columnas Equipo y Prob
#' @keywords internal
parse_fila_simple <- function(texto){
  partes <- trimws(unlist(strsplit(texto, "\\(")))
  
  equipo <- partes[1]
  prob   <- gsub("[()]", "", partes[2])
  
  data.frame(
    Equipo = equipo,
    Prob   = as.numeric(prob),
    stringsAsFactors = FALSE
  )
}
