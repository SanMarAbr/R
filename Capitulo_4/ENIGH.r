library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(readr)

# Establece la ubicación de las base de datos que se estan utilizando
setwd("C:\\Cursos\\Ciencia_Datos\\A2_Capacitacion\\R\\BD") # Busqueda de BD

# Nombra el objeto enigh para acceder a la dataframe
enigh <- read_csv("hogares_enigh.csv")

# Desactiva la notación cientifica de los datos que se estan manejnado.
options(scipen = 999)

# Muestra descripcion del dataframe, nombres variables las variables que se utilizan
enigh
# Muestra como esta compuesta el dataframe
dim(enigh)
# Capitulo 4 | Trasnsormación y exploración de datos
# 4.1 En este capitulo veremos la visualizacion de los datos, esto sirve para que la informacion sea mas intuitiva.
# Estas libreria contiene las herramientas
# nota se debe de tener encenta los siguientes operadores matemáticos
# * Aritmeticos
#  - Suma +
#  - Resta -
#  - Multiplicación *
#  - División /
# * Comparación
#  - Menor que <
#  - Mayor que >
#  - Menor o igual que <=
#  - Mayor o igual que >=
#  - Igual ==
#  -Diferente que !=
# * Lógicos
#  -y lógico &
#  -o lógico |
# * Asignación
#  - <-
#  - =
# filter()
# filter permite hacer un subconjunto de obsercaciones basado en los valores de interés-
library(dplyr)
# Se va a filtrar los hogares de tipo nuclear, cuya clasificación 2.
# Filtar hogares de tipo nuclear
hogares_nucleares <- filter(enigh, clase_hog == 2)
view(hogares_nucleares)
# Jefa de familia femenino
hogares_nucleares_jfem <- filter(enigh, clase_hog == 2, sexo_jefe == 2)
view(hogares_nucleares_jfem)
# Hogares uniculturales y nucleares con jefe de familia femenino
hogares_jfem <- filter(enigh, (clase_hog == 1 | clase_hog == 2), sexo_jefe == 2)
view(hogares_jfem)
# arrange()
# select()
# mutate
# summarize()




arrange(data_frame, Apellido_paterno, Apellido_manterno, Nombre)
