# Un dataframe es un arreglo rectangular de variables(columnas) y obervaciones (filas)

library(ggplot2) # Carga de librerias para instalarlas es install.packages("nomrbeLibreria")
library(readxl)
library(tidyr)
library(dplyr)

# Ruta de acceso directo a la base de datos
setwd("C:\\Cursos\\Ciencia_Datos\\A2_Capacitacion\\R\\BD") # Busqueda de BD
enoe <- read_xlsx("mu_enoe.xlsx") # Se busca y se carga a un objeto la base de datos
# Exploración de la base de datos
# Cuáles son las caractesísticas de la base de datos?
dim(enoe) # Funciona para poder descubrir el tamaño de la base de datos
colnames(enoe) # Ver cuales son los nombres de las variables que contiene


# Genera un diagrama de dispersion o diagrama de puntos
# "ggplot" =  Crea un sistema de coordenadas vacio
# "data" = estamos indicando que en el objeto enoe se cuentran los datos de interes
# "geom_function" = Se refiere al tipo de gráfica a realizarse
# "mappings" = se refiere a todos los componenetes específicos de la gráfica que deseeamos trabajar
# "X" = indica que deseamos observar los años de educación en el eje horizontal
# "Y" = indica que desamos ver el salario o ingreso mensual en el eje vertical



# Formato Básico
# Gráfica de puntos
# Esta gráfica indica la relación entre el ingreso mensual y los años de escolaridad
# Es posible apreciar que enter mas años de eduación existan, el valor de la coordenada en y es más alto
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual), color = "Blue")



# Mapeos estéicos
# En esta gráfica se puede observar que en México hay una grana parte de personas que tienen un empleo con altos ingresos aún cuando no tienen un determinado nivel educativo, esto se debe al trabajo forma e informal
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual, color = tipo_empleo))



# Mismo analisís pero con iconos para identificar por medio de la función shape
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual, shape = tipo_empleo, color = tipo_empleo))


# Analisís relacionados con la edad uso de variable alpha
# Este tiene como objetivo la funcion alpha por lo que el analisís tiene la relación entre la eded, educación y el salario. Entre más obscuro es el color del punto, se trata de una observación mayor
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = edad, alpha = ingreso_mensual, color = ingreso_mensual))

# Separación de facetas
# La libreria ggplot2 permiteseparar variables categporicas dentro de una misma gráfica, lo cual genera sub-gráficas
# Este analisis se esta solicitando que separe la información por sexo sex indicando que la gráfica resultante la muestre en un panel de 1 columna y 2
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual)) +
    facet_wrap(~sex, nrow = 2, ncol = 1


# También es posible usar facet_grid para que se desagregue el sexo, el tipo de empleo
# Esta gráfica nospermite observar las diferencias en el salario de los hombres y las mujeres en tanto los dos sectores diferentes que tenemos informal y formal, mostrando que las formales son mayores+
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual)) +
    facet_grid(tipo_empleo ~ sex)

# Objetos geométricos
# Hay diferentes tipos de gráficas a continuacion se mostrara la diferencia entre una gráfica de puntos y una de linea

# Izquierda
ggplot(data = enoe) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual))
# Derecha
ggplot(data = enoe) +
    geom_smooth(mapping = aes(x = anios_esc, y = ingreso_mensual))

# Como diferenciar entre lineas
ggplot(data = enoe) +
    geom_smooth(mapping = aes(x = anios_esc, y = ingreso_mensual, linetype = sex)) +
    facet_wrap(~sex, nrow = 1, ncol = 2)

# Combinacion de gráficas
# En esta gráfica se concentra en una combinación de tablas
ggplot(data = enoe) +
    geom_smooth(mapping = aes(x = anios_esc, y = ingreso_mensual, linetype = tipo_empleo)) +
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual, color = tipo_empleo))

# Gráfica sin duplicidad de datos

ggplot(data = enoe, mapping = aes(x = anios_esc, y = ingreso_mensual)) +
    geom_smooth(mapping = aes(linetype = tipo_empleo)) +
    geom_point(mapping = aes(color = tipo_empleo))

# Gráfica combinada con diferentes conjuntos
ggplot(data = enoe, mapping = aes(x = anios_esc, y = ingreso_mensual)) +
    geom_point(mapping = aes(color = niv_edu), show.legend = FALSE) +
    geom_smooth(data = filter(enoe, estado == "Distrito Federal"), se = FALSE)

ggplot(data = enoe, mapping = aes(x = anios_esc, y = ingreso_mensual)) +
  geom_point(mapping = aes(color = niv_edu), show.legend = FALSE) +
  geom_smooth(data = filter(enoe, estado == "Distrito Federal"), method = 'loess', formula = 'y ~ x', se = FALSE)


# Transformaciones estadísticas
# Gráfica de barras
# La base de datos del ENOE tiene 8000 registros por lo que una gráfica de arras es la escencial para poder realizar el estudio de cuantas personas han participado
ggplot(data = enoe)+
    geom_bar(mapping = aes(x=sex))
# Stat_count
ggplot(data = enoe)+
    stat_count(mapping = aes(x=sex))
# Barras con porcentaje
ggplot(data = enoe)+
    geom_bar(mapping = aes(x=sex,y = after_stat(prop),group = 1))
# Barras con numero de observaciones con un nuevo dataframe
prueba <- data.frame(
    sex = c("hombres", "mujeres"),
    observaciones = c(6100, 4100)
)
ggplot(data = prueba)+
    geom_bar(mapping = aes(x=sex, y=observaciones),stat = "identity")

#  Promedio del ingreso de cada grupo, así como los ingresos máximos y mínimos para cada grupo.
ggplot(data = enoe)+
    stat_summary(
        mapping = aes(x=sex, y=ingreso_mensual),
        fun.min=min,
        fun.max = max,
        fun = median
    )
# Ajustes de posición: 
ggplot(data = enoe)+
    geom_bar(mapping = aes(x = sex, fill = sex))
# Gráfica con separación por nivel de estudios
ggplot(data = enoe)+
    geom_bar(mapping = aes(x = sex, fill=niv_edu))

#Gráfica con diseño translucido
# En esta gráfica hace el conteo de hombres y mujeres que estan en el dataframe
# Este se tiene el conteo de las 10000 personas que se encuestaron

ggplot(data = enoe, mapping = aes(sex ,fill = niv_edu))+
    geom_bar(alpha = 1/5, position = "identity")

# Grafica en forma de esqueleto ayuda demasiado a revisar en que linea se separa totalmente
# La funcion fill es para rellenar la gráfica
# Position para el conteo de los datos
ggplot(data = enoe, mapping = aes(sex, color = niv_edu))+
    geom_bar(fill = NA, position = "identity")

# Grafica con position fill
# Esta gráfica representa el 100% de los datos y permite observar con mayor claridad la propocioción de cada categoría
ggplot(data = enoe, mapping = aes(sex, fill = niv_edu))+
    geom_bar(position = "fill")

#Grafica concentrada por nivel educativo
# Esta grafica representa la distribucion del nivel educativo
# lo que hace factor es hacer que los valores que se reunán sean todos los de la función fill
ggplot(data = enoe, mapping = aes(x = factor(1), fill = niv_edu))+
    geom_bar(position = "fill")

# Gráfica con agrupaciones separadas con la funcion dodge
# Nombres de los ejes con labs ()
ggplot(data = enoe, mapping =  aes (sex, fill = niv_edu))+
    geom_bar(position = "dodge")+
    labs (title = "Observaciones por sexo y nivel educativo", x ="Sexo", y ="Observaciones")

# Gráficas de puntos, position jitter
# Izquierda
ggplot(data = enoe)+
    geom_point(mapping = aes(anios_esc, ingreso_mensual, color = "red"))
# Derecha con position = "jitter"
# Jitter hace que los puntos tengan una posicion "Aleatorio"
ggplot(data = enoe) +
  geom_point(mapping = aes(anios_esc, ingreso_mensual), position = "jitter", color = "blue")

# 3.5.7 Sistema de corrodenadas
# La librería ggplot2 tiene un sistema de coordenadas catesianas (x, y)
# Coord_flip()
# Permite hacer cambio en las coordenadas que hacen que las graficas tengan cambios interesantes
# Superior
ggplot(data = enoe, mapping = aes (niv_edu, ingreso_mensual))+
    geom_boxplot()
# Inferior
ggplot(data = enoe, mapping = aes (niv_edu, ingreso_mensual))+
    geom_boxplot()+
    coord_flip()

# 3.5.2 coord_polar()
# coord_polar() permite el uso de coordenadas polares.



barra <- ggplot(data = enoe) +
  geom_bar(mapping = aes(x = niv_edu, fill = niv_edu),
           show.legend = FALSE, width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

barra + coord_flip()
barra + coord_polar()


# Gráfica de pastel por porcentajes
ggplot(data = enoe, mapping = aes(factor(1), fill= niv_edu))+
    geom_bar(position = "fill")+
    coord_polar(theta = "y")+
    labs(x = "", y = "")

# Grámatica de ggplot2
# * ggplot(data = DATOS) + GEOM_FUNCION(mapping = aes (MAPEOS),stat = ESTADÍSTICAS,position = posicion)+
#         FUNCION_COORDENADAS + FUNCION_FACETAS


ggplot(data = enoe, mapping = aes(sex, ing_salarios,color = sex))+
    geom_col()
