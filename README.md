Replication data for Ruiz Nicolini, J. P. (2017). [El impacto de enchufar los votos. Evaluación del voto cruzado entrecategorías en las elecciones de la provincia de Salta](https://www.researchgate.net/publication/317236729). *Tesis de Master*, Universidad TorcuatoDi Tella. 


# SCRIPTS *R*

*`data_managment.R` [Código de R para limpiar y preparar la *base de datos*](https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/data_managment.r) 

*`analysis.R` [Código de R para el análisis de los datos](https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/analysis.r)

*`data_managment_totals`[Cdigo auxiliar para imputación de totales - viene del script `analysis.r`](
 https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/auxiliar_script.totals.r)



# DATOS
*`data.csv` [Resultados electorales de Salta de 2007 y 2011](https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/data.csv) para la totalidad de los circuitos de la provincia. Las observaciones (cantidad de votos) estás desagregadas por categoría (GOBERNADOR, LEGISLADOR -Diputado & Senador); partido político (LISTA) y CIRCUITO electoral (la base incluye mesas, pero estas varían entre elecciones).

*`covariates`es una [base de datos para *PRISMA*](https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/covariates.pzfx): software de Windows utilizado para hacer los gráficos de test de hipótesis (t). 

# LIBRO DE CÓDIGOS Y ANOTACIONES

#VARIABLES (y transformaciones - data managment- a partir de scripts)
1) Variable "Year"(año de elección). Recodificada "0" (si se trata de elección 2007) y "1" (si se trata de elección 2011)
2) Variable "VE" (asignación de "tratamiento" - circuitos que votaron con Voto Electrónico (VE) en 2011). Toma valo "O" si corresponde a circuitos que mantuvieron sistema tradicional ("control") y "1"si en 2011 votaron con el nuevo sistema ("tratamiento"). 
3) Variable "Circuito". Código alfanumérico dado por autoridades electorales. A diferencia de la numeración de las mesas y los centros de votación, estos son equivalente entre elecciones (con algunas pequeñas diferencias, anotadas en el script dataManagment).
4) Variable "Listas". Recodificada en script dataMangament a partir de información de alianzas y adhesiones provistas por las autoiradades electorales, asignandole un número a cada Lista_Año. Se tomó el nombre de la lista que presentó candidato a GOBERNADOR, se le asigó un número y se computó el mismo número a todas las listas legislativas (Senador y Diputado provincial) que adhirieron a ese candidato a Gobernador. 
5) Variable "Cargo". La base de datos original incluye resultados para las candidaturas a GOBERNADOR, DIPUTADO y SENADOR. En el script dataManagment transofrmamos esta variable asimilando los resultados para cargos legislativos (DIPUTADO & SENADOR) como equivalentes. 
6) Variable "Municpio". Variable que sirve para identificar rapidamente distritos en los que se asigó tratamiento y control en algunos de los modelos. Recodificada con un número por orden alfabético. 

# CARTOGRAFIA
* `muncipios` de Salta con [*Google Fusion Tables*](https://www.google.com/fusiontables/DataSource?docid=1mSQ-EUh3_PK_C3C448TGmBpNbMGtnfAPlRqsTBwy), con la colaboración de [@andy_tow](http://www.twitter.com/andy_tow))]

*`Salta (Capital): Escuelas *Treatment & Control*` con  [Google Maps]( https://www.google.com/maps/d/edit?mid=119aqN9xB6kIGgNmr79qqz5JvuOo&ll=-24.780574048772323%2C-65.45555558055639&z=11)
