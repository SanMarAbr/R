#Un dataframe es un arreglo rectangular de variables(columnas) y obervaciones (filas)

library(ggplot2) # Carga de librerias para instalarlas es install.packages("nomrbeLibreria")
library(readxl)
library(tidyr)
library(dplyr)

setwd("C:\\Cursos\\Ciencia_Datos\\A2_Capacitacion\\R\\Capitulo_3\\BD") # Busqueda de BD
enoe <- read_xlsx("mu_enoe.xlsx") # Se busca y se carga a un objeto la base de datos
# Exploración de la base de datos
# Cuáles son las caractesísticas de la base de datos?
dim(enoe) # Funciona para poder descubrir el tamaño de la base de datos
colnames(enoe) # Ver cuales son los nombres de las variables que contiene

#Genera un diagrama de dispersion o diagrama de puntos
# "ggplot" =  Crea un sistema de coordenadas vacio
# "data" = estamos indicando que en el objeto enoe se cuentran los datos de interes
# "geom_function" = Se refiere al tipo de gráfica a realizarse
# "mappings" = se refiere a todos los componenetes específicos de la gráfica que deseeamos trabajar
# "X" = indica que deseamos observar los años de educación en el eje horizontal
# "Y" = indica que desamos ver el salario o ingreso mensual en el eje vertical

# Formato Básico
#Gráfica de puntos
# Esta gráfica indica la relación entre el ingreso mensual y los años de escolaridad
# Es posible apreciar que enter mas años de eduación existan, el valor de la coordenada en y es más alto
ggplot(data = enoe) + 
    geom_point(mapping = aes(x =anios_esc, y =ingreso_mensual), color= "Blue")

# Mapeos estéicos
# En esta gráfica se puede observar que en México hay una grana parte de personas que tienen un empleo con altos ingresos aún cuando no tienen un determinado nivel educativo, esto se debe al trabajo forma e informal
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual, color = tipo_empleo))

#Mismo analisís pero con iconos para identificar
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual, shape=tipo_empleo,color = tipo_empleo))

# Analisís relacionados con la edad uso de variable alpha
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = edad, alpha=ingreso_mensual,color = tipo_empleo))



