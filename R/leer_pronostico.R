#' Lee la jornada que está por jugarse
#' @param jornada Número de jornada
#' @export
#' @import rvest
#' @import xml2
leer_pronostico <- function(jornada){
  
  url <- paste0("https://www.quiniela15.com/resultados-quiniela/", jornada)
  tmp <- read_html(url)
  tmp2 <- html_nodes(tmp, "table")
  tabla1 <- html_table(tmp2[[1]], fill = TRUE)
  
  # Selección de columnas relevantes
  df <- tabla1[, c(1, 2, 3, 8, 9)]
  names(df) <- c("num", "Local", "Visitante", "sistema", "users")
  
  # Limpieza básica de textos
  df$Local     <- stringr::str_squish(df$Local)
  df$Visitante <- stringr::str_squish(df$Visitante)
  
  # Extraer probabilidades Q1, QX, Q2 del bloque users
  probs <- stringr::str_extract_all(df$users, "\\d+%")
  
  # Convertir a matriz numérica
  probs <- lapply(probs, function(x){
    x <- gsub("%", "", x)
    x <- as.numeric(x)
    # Nos quedamos con las 3 primeras (Q1, QX, Q2)
    x[1:3]
  })
  
  probs_mat <- do.call(rbind, probs)
  colnames(probs_mat) <- c("Q1", "QX", "Q2")
  
  # Añadir columnas limpias
  df$Q1 <- probs_mat[, "Q1"]
  df$QX <- probs_mat[, "QX"]
  df$Q2 <- probs_mat[, "Q2"]
  
  df$NumJornada <- jornada
  df$Temporada  <- 2025
  
  # Selección final de columnas limpias
  df_final <- df[, c("num", "Local", "Visitante", "Q1", "QX", "Q2", "NumJornada", "Temporada")]
  
  return(df_final)
}
