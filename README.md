
# quinielaR <img src="https://www.r-project.org/logo/Rlogo.png" align="right" height="60" />

<!-- Badges -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub
version](https://img.shields.io/badge/version-0.1.0-blue.svg)]()

Paquete para **descargar, limpiar y estructurar datos de La Quiniela**
de forma reproducible. Incluye funciones para obtener temporadas
históricas, jornadas de la temporada actual y el pronóstico de la
jornada en curso.

------------------------------------------------------------------------

## Funciones principales

### `leer_temporada(temporada, max_jornada)`

Descarga una temporada histórica completa desde la jornada 1 hasta
`max_jornada`.

### `leer_jornada(jornada)`

Descarga una jornada concreta de la temporada actual.

### `leer_actual(desde, hasta)`

Descarga varias jornadas consecutivas de la temporada actual.

### `leer_pronostico(jornada)`

Descarga la jornada que está por jugarse (pronóstico oficial).

------------------------------------------------------------------------

## Instalación

Para instalar el paquete desde GitHub:

``` r
install.packages("remotes")   # solo la primera vez
remotes::install_github("auroymad/quinielaR")
library(quinielaR)
```

------------------------------------------------------------------------

## Ejemplo de uso

``` r
library(quinielaR)

# Datos históricos para entrenar modelos
train <- leer_temporada(2020, 63)

# Datos de la temporada actual
test  <- leer_actual(1, 55)

# Validación
valid <- leer_actual(56, 58)

# Pronóstico de la jornada en curso
pred  <- leer_pronostico(59)
```

------------------------------------------------------------------------

## Datos incluidos en el paquete

El paquete incorpora datasets listos para usar:

- `TRAIN`: datos históricos ya procesados  
- `TEST`: datos de la temporada actual

Ejemplo:

``` r
data("TRAIN")
head(TRAIN)
```

------------------------------------------------------------------------

## Estructura del paquete

    quinielaR/
    ├── R/               # Funciones del paquete
    ├── man/             # Documentación generada con roxygen2
    ├── data/            # Datos .rda
    ├── DESCRIPTION      # Metadatos del paquete
    ├── NAMESPACE        # Exportaciones/importaciones
    ├── README.Rmd       # Este archivo
    └── README.md        # Generado automáticamente

------------------------------------------------------------------------

## Desarrollo y contribución

1.  Haz un fork del repositorio  
2.  Crea una rama nueva  
3.  Realiza tus cambios  
4.  Envía un pull request

------------------------------------------------------------------------

## Licencia

Este paquete se distribuye bajo licencia **MIT**.

------------------------------------------------------------------------

## Autor

**Miguel Ángel Daza**  
Universidad Carlos III de Madrid \`\`\`
