#' Extrae equipo y fuerza desde un bloque multilinea
#' @keywords internal
parse_fila <- function(texto){
  p <- trimws(unlist(strsplit(texto, "\n")))
  p <- p[p != ""]
  p <- gsub("\\s+", " ", p)
  
  data.frame(
    Local     = p[1],
    FL        = gsub("[()]", "", p[2]),
    Visitante = p[4],
    FV        = gsub("[()]", "", p[5]),
    stringsAsFactors = FALSE
  )
}
