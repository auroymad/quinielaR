
# INSTALACIÓN DIRECTA DESDE GITHUB
# En una sesión limpia de R:

# install.packages("remotes")   # solo la primera vez
remotes::install_github("auroymad/quinielaR")
library(quinielaR)


data("TRAIN")
head(TRAIN)

jornada_59<-quinielaR::leer_pronostico(59)


remotes::install_github("auroymad/quinielaR", force = TRUE)
library(quinielaR)
leer_pronostico(59)

jornadas_56_58<-quinielaR::leer_actual(56,58)
