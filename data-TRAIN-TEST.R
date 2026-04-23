#' Datos de entrenamiento para quinielas
#'
#' @format Un data.frame con X filas y Y columnas:
#' \describe{
#'   \item{num}{Número de partido}
#'   \item{Local}{Equipo local}
#'   \item{Visitante}{Equipo visitante}
#'   \item{FL}{Fuerza local}
#'   \item{FV}{Fuerza visitante}
#'   \item{sistema}{Sistema de apuesta}
#'   \item{USER}{Usuario o estrategia}
#'   \item{Q1}{Cuota 1}
#'   \item{QX}{Cuota X}
#'   \item{Q2}{Cuota 2}
#'   \item{Temporada}{Temporada}
#'   \item{NumJornada}{Número de jornada}
#'   \item{dificultadS}{Dificultad histórica (S)}
#'   \item{dificultadU}{Dificultad histórica (U)}
#'   \item{cluster3}{Cluster del partido}
#' }
"TRAIN"

#' Datos de test para quinielas
#'
#' @format Igual estructura que \code{TRAIN}.
"TEST"
