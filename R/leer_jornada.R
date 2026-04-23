#' Lee una jornada de la temporada actual
#' @param jornada Número de jornada
#' @return Data frame con los 14 partidos
#' @export
leer_jornada <- function(jornada){
  
  url <- paste0("https://www.quiniela15.com/resultados-quiniela/", jornada)
  tmp <- read_html(url)
  tmp2 <- html_nodes(tmp, "table")
  tabla1 <- html_table(tmp2[[1]], fill = TRUE)
  
  ntabla <- tabla1[, c(1:6, 10:25)]
  ntabla <- ntabla[!grepl("^Incluido en tu suscripción", ntabla$`#`), ]
  
  idx  <- match(1:14, ntabla$`#`)
  idx2 <- sort(c(idx, idx+1))
  ntabla <- ntabla[idx2, ]
  
  idx <- match(1:14, ntabla$`#`)
  mtabla <- cbind(ntabla[idx, c(1:6)], ntabla[idx+1, c(7:22)])
  
  v1 <- c("Q","L","A")
  v2 <- c("1","X","2")
  result <- paste0(expand.grid(v2, v1)[,2], expand.grid(v2, v1)[,1])
  
  mtabla <- mtabla[, -c(7:10, 11, 15, 19)]
  names(mtabla) <- c("num","Fuerza","Goles","real","sistema","users", result)
  
  tabla3 <- mtabla
  tabla3$USER <- substr(tabla3$users, 1, 1)
  
  local_df     <- do.call(rbind, lapply(tabla3$Local,     parse_fila))
  visitante_df <- do.call(rbind, lapply(tabla3$Visitante, parse_fila))
  
  tabla3 <- cbind(tabla3, local_df, visitante_df)
  
  users_df <- do.call(rbind, lapply(tabla3$users, parse_users))
  tabla3 <- cbind(tabla3, users_df)
  
  tabla3$aciertoU <- 1*(tabla3$real == tabla3$USER)
  tabla3$aciertoS <- 1*(tabla3$real == tabla3$sistema)
  
  tabla3$NumJornada <- jornada
  tabla3$Temporada  <- 2025
  
  tabla3
}
