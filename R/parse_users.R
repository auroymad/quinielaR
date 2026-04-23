#' Extrae Q1, QX y Q2 del bloque Q15
#' @keywords internal
parse_users <- function(texto){
  p <- trimws(unlist(strsplit(texto, "\n")))
  p <- p[p != ""]
  
  idx <- grep("^Q15:", p)
  if(length(idx) == 0) return(data.frame(Q1=NA, QX=NA, Q2=NA))
  
  posteriores <- p[(idx+1):length(p)]
  porcent <- posteriores[grepl("%", posteriores)]
  
  if(length(porcent) < 3) return(data.frame(Q1=NA, QX=NA, Q2=NA))
  
  valores <- gsub("%","", porcent[1:3])
  
  data.frame(
    Q1 = as.numeric(valores[1]),
    QX = as.numeric(valores[2]),
    Q2 = as.numeric(valores[3])
  )
}
