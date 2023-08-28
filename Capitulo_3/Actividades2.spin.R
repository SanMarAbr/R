library(ggplot2) # Carga de librerias para instalarlas es install.packages("nomrbeLibreria")
library(readxl)
library(tidyr)
library(dplyr)
library(gridExtra)
library(rmarkdown)
setwd("C:\\Cursos\\Ciencia_Datos\\A2_Capacitacion\\R\\Capitulo_3\\BD") # Busqueda de BD
enoe <- read_xlsx("mu_enoe.xlsx")

View(enoe)
# 1. Elabora una gráfica de dispersión que permita observar la relación entre el salario mensual y la edad. Donde todos los puntos sean rojos.
ggplot(data = enoe, mapping = aes(edad, ingreso_mensual))+
    geom_point(color ="red")

# 2. Elabora una gráfica que permita observar la relación entre el ingreso entre el salario mensual y la edad. Además que los puntos permitan identificar el nivel de escolaridad.
ggplot(data = enoe, mapping = aes (edad, ingreso_mensual, color = niv_edu))+
    geom_point()

# 3. Intenta efectuar una gráfica de puntos, donde en el eje x se observen los años de educación, en el eje y, el ingreso mensual y ademas usando la estética de alpha sobre la variable nivel de educación.
# ¿Cuál es el warning que emite R? 
# El Warning que presenta es: 
# Warning message:
# Using alpha for a discrete variable is not advised.
#¿Porqué crees que sucede esto?
# Esta advertencia sale debido a que estamos utilizando en niv_edu datos categoricos y no numericos 

ggplot(data = enoe, mapping = aes (anios_esc, ingreso_mensual, alpha = niv_edu))+
    geom_point()

# 4. Elabora una gráfica que permita ver la relación del ingreso mensual con los años de educación diferenciada por sexo, de manera que cambie no sólo el color del punto, sino ademas la forma. ¿Qué información relevante aporta esa gráfica?
ggplot(data = enoe, mapping = aes(anios_esc, ingreso_mensual, shape = sex, color = sex))+
    geom_point()
# 5. Construye las siguientes gráficas, analiza detenidamente las diferencias entre ellas y responde las preguntas.
#   • ggplot(data = enoe) + geom_point(mapping = aes(x =anios_esc, y =ingreso_mensual), shape=3, size=3, color=“red”)
ggplot(data = enoe)+ 
    geom_point(mapping = aes(x = anios_esc, y = ingreso_mensual),shape = 3, size =3, color = "red")
#   • ggplot(data = enoe) + geom_point(mapping = aes(x =anios_esc, y =ingreso_mensual), shape=5, size=1, color=“blue”)
ggplot(data = enoe)+
    geom_point(mapping = aes(anios_esc, ingreso_mensual,),shape = 25, size = 1, color = " blue")
#   • ¿Qué impacto tiene sobre la gráfica la opción shape, size y color cuando éstas se incluyen fuera de la función aes? 
# Estas influyen en la forma de los puntos y el tamaño de estos, esto sirve para darle mejor identificación a las gráficas
#6. Elabora una gráfica que permita observar la relación la edad y el ingreso mensual, diferenciando por estados usando primero color y después shape. ¿Observas alguna inconsistencia?
#Diferenciado por color
ggplot(data = enoe, mapping = aes(edad, ingreso_mensual,color = estado))+
    geom_point()
#Diferenciado por forma shape
ggplot(data = enoe, mapping = aes(edad, ingreso_mensual,shape = estado))+
    geom_point()
#7. ¿Qué gráficas generan los siguientes códigos?
#   • ggplot(data=enoe)+ geom_point(mapping = aes(x =anios_esc, y =ingreso_mensual))+ facet_grid(sex~.)
ggplot(data = enoe, mapping = aes(anios_esc, ingreso_mensual))+
    geom_point()+
    facet_grid(sex~.)
#   • ggplot(data=enoe)+ geom_point(mapping = aes(x =anios_esc, y =ingreso_mensual))+ facet_grid(. ~ tipo_empleo)
ggplot(data = enoe, mapping = aes(anios_esc,ingreso_mensual))+
    geom_point()+
    facet_grid( tipo_empleo~.)
#   • ¿Que función tiene “.” dentro de código?
# El punto hace cambio de posición de las gráficas una la pone de forma superior e inferior y la otra de izquierda a derecha

#8. Replica la gráfica para separa Jalisco, pero elimina la opción se. ¿Que función tiene se?
ggplot(data=enoe, mapping = aes(x =anios_esc, y =ingreso_mensual))+ 
    geom_point(mapping = aes(color=niv_edu), show.legend = FALSE)+ 
    geom_smooth( data=filter(enoe, estado=="Hidalgo"), se=FALSE)

ggplot(data = enoe, mapping = aes(x = anios_esc, y = ingreso_mensual)) +
    geom_point(mapping = aes(color = niv_edu), show.legend = FALSE) +
    geom_smooth(data = filter(enoe, estado == "Distrito Federal"), 
                mapping = aes(x = anios_esc, y = ingreso_mensual), 
                method = "auto") +
    labs(title = "Relationship between Years of Education and Monthly Income",
         x = "Years of Education",
         y = "Monthly Income")
# La fucnión SE ayuda a quitar el margen de error que tienen en la gráfica que muestra el Distrito Federal y en las demás
#9. ¿Cuál sería el código necesario para construir cada una de las siguientes gráficas?
g1 <- ggplot(data =enoe, mapping = aes(anios_esc,ingreso_mensual))+
        geom_point(size = .25) +  
        geom_smooth(se = FALSE)

g2 <- ggplot(data =enoe, mapping = aes(anios_esc,ingreso_mensual,linetype = sex))+
        geom_point(size = .25) +  
        geom_smooth(mapping = aes(linetype = sex),se = FALSE, show.legend = FALSE)

g3 <- ggplot(data = enoe, mapping = aes(anios_esc, ingreso_mensual)) +
  geom_point(mapping = aes(color = sex), size = 0.25) +
  geom_smooth(mapping = aes(linetype = sex, color = sex), se = FALSE)

g4 <- ggplot(data = enoe, mapping = aes(anios_esc, ingreso_mensual))+
        geom_point(mapping = aes(color = sex),size = .25)+
        geom_smooth(se =  FALSE)
 
g5 <- ggplot(data = enoe, mapping = aes( anios_esc, ingreso_mensual))+
        geom_smooth(mapping = aes(linetype = sex),color = "blue", se = FALSE)

g6 <- ggplot(data = enoe, mapping = aes(anios_esc, ingreso_mensual))+
        geom_point(mapping = aes(color = sex), size = 0.25)

grid.arrange(g1,g2,g3,g4,g5, g6)

#10. ¿Cuál es la diferencia entre geom_col y geom_bar?
p1 <- ggplot(data = enoe, mapping = aes(asiste, ingreso_mensual))+
    geom_col()

p2 <-ggplot(data = enoe, mapping = aes(estado)) +
    geom_bar()
#geom_bar
# Esta gráfica se utliza para realizar un conteo de un solo elemento de la gráfica
# Geom_col
# Esta grafica se le puede asignar lo que es el eje X y Y por lo que se puede dar un analisis de ambas cosas
grid.arrange(p1, p2)
#11. Una de las geometrias en ggplot2 es geom_jitter, la cual crea el mismo efecto que position=“jitter” ¿Cómo sería el código para construir la misma gráfica usando geom_jitter en lugar de position=“jitter”
ggplot( data = enoe, mapping = aes(anios_esc, ingreso_mensual))+
    geom_jitter()







rmarkdown::render("C:\\Cursos\\Ciencia_Datos\\A2_Capacitacion\\R\\Capitulo_3\\Actividades2.r", output_format = "pdf_document")

