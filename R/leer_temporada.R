#' Lee una temporada completa (histórica)
#' @param temporada Año de la temporada (2020 = 2020/21)
#' @param max_jornada Número total de jornadas de esa temporada
#' @export
#' @import rvest
#' @import xml2

leer_temporada <- function(temporada, max_jornada){
  
  tablas <- list()
  
  for(j in 1:max_jornada){
    
    cat("Temporada:", temporada, " - Jornada -> ", j, "\n")
    
    url <- paste0("https://www.quiniela15.com/resultados-quiniela/", j, "?season=", temporada)
    tmp <- read_html(url)
    tmp2 <- html_nodes(tmp, "table")
    tabla1 <- html_table(tmp2[[1]], fill = TRUE)
    
    ntabla <- tabla1[, 1:17]
    ntabla <- ntabla[, -c(7:13)]
    ntabla <- ntabla[!grepl("^Incluido en tu suscripción", ntabla$`#`), ]
    
    idx  <- match(1:14, ntabla$`#`)
    idx2 <- sort(c(idx, idx+1))
    ntabla <- ntabla[idx2, ]
    
    idx <- match(1:14, ntabla$`#`)
    mtabla <- cbind(ntabla[idx, 1:6], ntabla[idx+1, 7:ncol(ntabla)])
    
    v1 <- c("Q")
    v2 <- c("1","X","2")
    result <- paste0(v1, v2)
    
    mtabla <- mtabla[, -7]
    names(mtabla) <- c("num","Fuerza","Goles","real","sistema","users", result)
    
    mtabla$USER <- substr(mtabla$users, 1, 1)
    
    local_df     <- do.call(rbind, lapply(mtabla$Local,     parse_fila))
    visitante_df <- do.call(rbind, lapply(mtabla$Visitante, parse_fila))
    
    mtabla <- cbind(mtabla, local_df, visitante_df)
    
    mtabla$aciertoU <- 1*(mtabla$real == mtabla$USER)
    mtabla$aciertoS <- 1*(mtabla$real == mtabla$sistema)
    
    mtabla$NumJornada <- j
    mtabla$Temporada  <- temporada
    
    tablas[[j]] <- mtabla
  }
  
  do.call(rbind, tablas)
}
