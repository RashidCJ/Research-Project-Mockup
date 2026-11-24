# Tarea semanal n.º 4: Chile, 1988. El plebiscito y la regresión logística
# SOCI 4186-002 · 1.er Semestre 2026-2027
# Dr. Rashid C. J. Marcano Rivera
#
# Se asigna: lunes 23 de noviembre de 2026
# Entrega: miércoles 2 de diciembre de 2026, 23:59, por Moodle
# Puntuación: 100 puntos, más 20 de un reto opcional
#
# Archivos que entregará:
#   1. Apellido1-Apellido2-TareaSemanal04.R: correré su secuencia de comandos.
#   2. voto_educación.png: veré cómo le salió el gráfico.
#   3. reto_chile.png (solo si hace el reto): veré cómo le salió.
#
# Instrucciones generales:
# - Extraiga todo el ZIP y abra TS4_Chile.Rproj. Este script va en la
#   carpeta principal y los datos dentro de datos/; no cambie esa
#   organización.
# - Cambie el nombre del script a Apellido1-Apellido2-TareaSemanal04.R.
# - Complete cada espacio marcado «SU CÓDIGO AQUÍ» y conserve los comentarios.
# - Las respuestas y explicaciones se escriben como comentarios de R,
#   precedidas por #.
# - Use rutas relativas. El script debe correr de principio a fin en otra
#   computadora sin setwd() ni rutas que incluyan su nombre de usuario.
#   Antes de entregar, reinicie R (Session > Restart R) y corra todo el
#   script de una vez.
# - La última línea debe contener su declaración de uso de MEL, también como
#   comentario (con # al principio).
#
# Material de apoyo: la presentación del jueves 12 de noviembre y la
# secuencia secuencia_regresión_12nov.R (Laboratorio_Regresión_12nov.zip,
# Semana XIIIª). Lo que pide esta tarea se hace con las funciones de esa
# secuencia y con las que ya usó en la TS3: count(), group_by(), mutate(),
# geom_col(), labs() y ggsave(). El reto trae su propio código de ejemplo.


# Parte 0. Preparación (provista) ======================================

# Si le falta el paquete, corra una sola vez en la consola:
# install.packages("tidyverse")
set.seed(42)
library(tidyverse)

# Encuesta nacional de FLACSO/Chile, de abril y mayo de 1988: 2,700
# personas a quienes se preguntó cómo pensaban votar en el plebiscito
# sobre la continuidad de Augusto José Ramón Pinochet Ugarte. Cada fila
# es una persona.
# Lea datos/codebook_chile.md: explica cada variable.
chile_completo <- read_csv("datos/chile_1988.csv", show_col_types = FALSE)

# Compruebe la preparación antes de seguir:
glimpse(chile_completo)


# Parte 1. El contexto: Chile, 1973-1988 (20 puntos) ===================

# Antes de trabajar con los datos, investigue qué se votaba y por qué.
# Conteste cada pregunta en dos a cuatro oraciones, con sus palabras y
# como comentarios.
#
# 1.1 ¿Cómo llegó Augusto Pinochet al poder en 1973? ¿A qué gobierno
#     derrocó y quién lo presidía?

# SU RESPUESTA AQUÍ


# 1.2 ¿Qué caracterizó a la dictadura que siguió? Mencione al menos dos
#     rasgos documentados (por ejemplo, sobre los derechos humanos, los
#     partidos y el Congreso, o la política económica).

# SU RESPUESTA AQUÍ


# 1.3 ¿Por qué hubo un plebiscito el 5 de octubre de 1988? ¿Qué norma lo
#     exigía? ¿Qué significaba votar Sí y qué significaba votar No?

# SU RESPUESTA AQUÍ


# 1.4 ¿Cuál fue el resultado del plebiscito y qué ocurrió después?

# SU RESPUESTA AQUÍ


# 1.5 Fuentes. Anote al menos dos, cada una con autor o institución, año,
#     título y enlace. Al menos una debe ser académica o institucional;
#     puede buscar en Memoria Chilena (Biblioteca Nacional de Chile), en
#     la Biblioteca del Congreso Nacional de Chile o en libros y
#     artículos. Si se orientó con un MEL, compruebe cada dato en la
#     fuente antes de escribirlo.

# SUS FUENTES AQUÍ


# Parte 2. Conocer los datos (20 puntos) ===============================

# 2.1 Lea datos/codebook_chile.md y conteste como comentarios:
#     a. ¿Cuántos meses antes del plebiscito se hizo la encuesta?
#     b. ¿Qué categorías tiene la variable voto?
#     c. ¿Qué mide apoyo_statu_quo y qué quiere decir un valor alto?

# SU RESPUESTA AQUÍ


# 2.2 Con count() y mutate(), haga una tabla de la intención de voto de
#     las 2,700 personas, con el número de personas y la proporción de
#     cada categoría (incluya las que no contestaron). Guárdela como
#     tabla_voto y muéstrela.

# SU CÓDIGO AQUÍ


# 2.3 Lea su tabla y conteste como comentarios: ¿qué proporción pensaba
#     votar Sí y qué proporción No? ¿Qué proporción estaba indecisa?
#     Con esa diferencia entre el Sí y el No y esa proporción de
#     indecisos, ¿podía la encuesta anticipar quién ganaría?

# SU RESPUESTA AQUÍ


# 2.4 Intención de voto por nivel educativo.
#     a. Deje solo las filas con educación y voto conocidos, con
#        filter(!is.na(educación), !is.na(voto)).
#     b. Convierta educación en factor con los niveles en este orden:
#        Primaria, Secundaria, Postsecundaria.
#     c. Cuente las personas por educación y voto, y calcule la
#        proporción de cada intención de voto dentro de cada nivel
#        educativo (group_by(educación) antes del mutate()). Guarde la
#        tabla como tabla_educación.
#     d. Haga un gráfico de barras con geom_col(): educación en el eje
#        horizontal, la proporción en el vertical y el color de relleno
#        por voto. Póngale título, un subtítulo con el número de
#        personas, nombres claros en los ejes y la fuente
#        (labs(caption = ...)); el eje vertical, en porcentajes.
#     e. Guárdelo con ggsave() como voto_educación.png, de 16 × 10 cm y
#        300 ppp (units = "cm", dpi = 300).

# SU CÓDIGO AQUÍ


# 2.5 Describa en dos o tres comentarios qué muestra el gráfico: ¿en qué
#     nivel educativo era mayor la intención de votar Sí?, ¿y la de votar
#     No?, ¿dónde había más indecisos?

# SU RESPUESTA AQUÍ


# Parte 3. Un modelo para el voto por el Sí (25 puntos) ================

# 3.1 Prepare los datos del modelo y guárdelos como chile:
#     a. deje solo a quienes dijeron Sí o No;
#     b. quite las filas sin apoyo_statu_quo, con drop_na();
#     c. cree voto_sí, que vale 1 si la persona dijo Sí y 0 si dijo No.
#     Después muestre cuántas personas quedan y la proporción de Sí
#     (mean(chile$voto_sí)).

# SU CÓDIGO AQUÍ


# 3.2 Explique en uno o dos comentarios qué personas quedaron fuera y
#     qué implica eso para lo que el modelo puede decir.

# SU RESPUESTA AQUÍ


# 3.3 Ajuste una regresión logística de voto_sí según apoyo_statu_quo,
#     guárdela como logit y muestre sus coeficientes.

# SU CÓDIGO AQUÍ


# 3.4 Con predict() y type = "response", calcule la probabilidad de votar
#     Sí para tres personas: una con apoyo_statu_quo de -1, otra de 0 y
#     otra de 1.

# SU CÓDIGO AQUÍ


# 3.5 Interprete como comentarios:
#     a. ¿Qué indica el signo del coeficiente de apoyo_statu_quo?
#     b. Escriba una oración que use las tres probabilidades de 3.4.
#     c. ¿Por qué se usa aquí glm() con family = binomial y no lm()?

# SU RESPUESTA AQUÍ


# Parte 4. ¿Importan el sexo y la educación? (15 puntos) ===============

# 4.1 En chile, convierta educación en factor con Primaria como primer
#     nivel (el mismo orden de 2.4). Ajuste una regresión logística de
#     voto_sí según apoyo_statu_quo, sexo y educación, guárdela como
#     logit_2 y muestre su summary().

# SU CÓDIGO AQUÍ


# 4.2 Con tibble() y predict(), calcule la probabilidad de votar Sí de
#     cuatro personas con apoyo_statu_quo de 0:
#       una mujer con educación primaria;
#       un hombre con educación primaria;
#       una mujer con educación postsecundaria;
#       un hombre con educación postsecundaria.

# SU CÓDIGO AQUÍ


# 4.3 Conteste como comentarios:
#     a. Con el mismo apoyo al statu quo, ¿quién tenía más probabilidad
#        de votar Sí: las mujeres o los hombres?, ¿las personas con
#        educación primaria o con postsecundaria? Dé las cifras.
#     b. ¿Por qué hay que fijar apoyo_statu_quo en un mismo valor para
#        comparar a esas cuatro personas?

# SU RESPUESTA AQUÍ


# Parte 5. De la encuesta al plebiscito (10 puntos) ====================

# Conteste en tres o cuatro comentarios, uniendo lo que investigó en la
# Parte 1 con lo que encontró en los datos:
#   a. Compare la proporción de Sí entre quienes se habían decidido en
#      la encuesta (3.1) con el resultado del plebiscito (1.4). Dé dos
#      razones posibles de la diferencia; use su tabla de 2.2 y el
#      contexto político en que se hizo la encuesta.
#   b. apoyo_statu_quo predice muy bien el voto. ¿Por qué eso limita lo
#      que el modelo explica?
#   c. ¿Qué le añade el análisis de los datos a la lectura histórica, y
#      qué no puede decir?

# SU RESPUESTA AQUÍ


# Reto opcional (20 puntos adicionales) ================================

# Dibuje la curva en S: la probabilidad de votar Sí según el apoyo al
# statu quo, con una línea para las mujeres y otra para los hombres.
#   1. Ajuste logit_sexo, una regresión logística de voto_sí según
#      apoyo_statu_quo y sexo.
#   2. Cree la rejilla de valores (copie estas dos líneas sin el #):
#      rejilla <- expand_grid(apoyo_statu_quo = seq(-1.7, 1.7, by = 0.1),
#                             sexo = c("Mujer", "Hombre"))
#   3. Añada a la rejilla una columna probabilidad, con predict() y
#      type = "response".
#   4. Grafique con geom_line(): apoyo_statu_quo en el eje horizontal, la
#      probabilidad en el vertical y el color por sexo. Póngale título,
#      nombres en los ejes y fuente, y guárdelo como reto_chile.png, de
#      16 × 10 cm y 300 ppp.
#   5. Explique en tres a cinco oraciones: ¿dónde cambia más rápido la
#      probabilidad?, ¿dónde es mayor la diferencia entre mujeres y
#      hombres y dónde casi desaparece?, ¿por qué?

# SU CÓDIGO AQUÍ (RETO)


# Explicación del reto:


# Formalidades (10 puntos) =============================================
# - El script corre de principio a fin y usa rutas relativas: 5 puntos.
# - Los comentarios solicitados, las fuentes y la declaración de MEL
#   están completos: 5 puntos.


# Declaración de uso de MEL ============================================
# Sustituya la próxima línea por una de estas formas, siempre con # al
# principio:
# «# No usé MEL» o «# Usé [herramienta] para [qué]».

# SU DECLARACIÓN AQUÍ
