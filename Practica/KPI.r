library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(readr)


setwd("C:\\Cursos\\Ciencia_Datos\\A2_Capacitacion\\R\\BD") # Busqueda de BD
comandero <- read_csv("cine_comandero.csv",locale = locale(encoding = "UTF-8"))
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")
comandero <- comandero %>%
  mutate(Usuario = iconv(Usuario, from = "UTF-8", to = "ISO-8859-1"))


library(dplyr)
library(ggplot2)

# Filtrar los datos para el usuario "Abraham Sanchez"
usuarios <- filter(comandero, Usuario == "Abraham Sanchez")
f_usuario <- filter(comandero, Fecha == "7/28/2022")

# Graficar n_Trans contra usuario
ggplot(data = usuarios, mapping = aes(Usuario, n_Trans, color = Fecha)) +
    geom_point()

# Visualizar los datos filtrados
View(usuarios)
view(f_usuario)

