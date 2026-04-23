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
  
  ntabla <- tabla1[, c(1:3, 8, 9)]
  ntabla <- ntabla[!grepl("^Incluido en tu suscripción", ntabla$`#`), ]
  
  idx  <- match(1:14, ntabla$`#`)
  idx2 <- sort(c(idx, idx+1))
  ntabla <- ntabla[idx2, ]
  
  idx <- match(1:14, ntabla$`#`)
  mtabla <- ntabla[idx, ]
  
  names(mtabla) <- c("num","Local","Visitante","sistema","users")
  
  mtabla$USER <- substr(mtabla$users, 1, 1)
  
  local_df     <- do.call(rbind, lapply(mtabla$Local,     parse_fila))
  visitante_df <- do.call(rbind, lapply(mtabla$Visitante, parse_fila))
  
  mtabla <- cbind(mtabla, local_df, visitante_df)
  
  users_df <- do.call(rbind, lapply(mtabla$users, parse_users))
  mtabla <- cbind(mtabla, users_df)
  
  mtabla$NumJornada <- jornada
  mtabla$Temporada  <- 2025
  
  mtabla
}
