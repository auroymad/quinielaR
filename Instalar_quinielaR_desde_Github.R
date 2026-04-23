
# INSTALACIÓN DIRECTA DESDE GITHUB
# En una sesión limpia de R:

# install.packages("remotes")   # solo la primera vez
remotes::install_github("auroymad/quinielaR")
library(quinielaR)


data("TRAIN")
head(TRAIN)

jornada_59<-quinielaR::leer_pronostico(59)
