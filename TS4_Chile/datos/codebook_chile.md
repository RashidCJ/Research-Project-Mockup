# Libro de códigos: intención de voto en el plebiscito de Chile, 1988

Archivo: `chile_1988.csv`. 2,700 filas; cada fila es una persona encuestada.

Fuente: conjunto `Chile` del paquete `carData` de R (Fox y Weisberg, 2019): encuesta nacional de FLACSO/Chile de abril y mayo de 1988, antes del plebiscito sobre la continuidad de Augusto José Ramón Pinochet Ugarte. Hay datos faltantes. Las columnas y las categorías se tradujeron al español.

| Variable | Descripción | Valores |
|---|---|---|
| `región` | Región de residencia | Central, Metropolitana (área de Santiago), Norte, Sur, Ciudad de Santiago |
| `población` | Población de la comunidad de residencia | Habitantes |
| `sexo` | Sexo | Mujer, Hombre |
| `edad` | Edad | Años |
| `educación` | Nivel educativo | Primaria, Secundaria, Postsecundaria |
| `ingreso` | Ingreso mensual | Pesos chilenos |
| `apoyo_statu_quo` | Escala de apoyo al statu quo | Mayor = más apoyo al régimen |
| `voto` | Intención de voto | Sí (por Pinochet), No (contra Pinochet), Abstención, Indeciso |

Referencias: Fox, J. (2016). *Applied Regression Analysis and Generalized Linear Models* (3.ª ed.). Sage. Fox, J. y Weisberg, S. (2019). *An R Companion to Applied Regression* (3.ª ed.). Sage.
