

# devtools::install_local("~/UC3M/UC3m_en_casa/Curso_25_26/2_BigData/R_Big_Data/QUINIELA/quinielaR")

library(quinielaR)


train <- leer_temporada(2020, 63)
test  <- leer_actual(1, 55)
valid <- leer_actual(56, 58)
pred  <- leer_pronostico(59)
