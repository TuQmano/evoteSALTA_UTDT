# evoteSALTA_UTDT
Data y código - paper Maestría UTDT

#Scripts. 
1º Data Managment (a partir de dbase en archivo .csv)
2º Modelos (con un stop en punto 3º para Input Totales)
3ºInput totales (y de vuelta al 2º)

#dBase
.csv con resultados electorales de 2007 y 2011 para la totalidad de los circuitos de la provincia de Salta. 
Observaciones (cantidad de votos) desagregadas por categoría (GOBERNADOR, LEGISLADOR -Diputado & Senador), partido político (LISTA) y CIRCUITO electoral (la base incluye mesas, pero estas varían entre elecciones). 

#VARIABLES (y transformaciones - data managment- a partir de scripts)
1) Variable "Year"(año de elección). Recodificada "0" (si se trata de elección 2007) y "1" (si se trata de elección 2011)
2) Variable "VE" (asignación de "tratamiento" - circuitos que votaron con Voto Electrónico (VE) en 2011). Toma valo "O" si corresponde a circuitos que mantuvieron sistema tradicional ("control") y "1"si en 2011 votaron con el nuevo sistema ("tratamiento"). 
3) Variable "Circuito". Código alfanumérico dado por autoridades electorales. A diferencia de la numeración de las mesas y los centros de votación, estos son equivalente entre elecciones (con algunas pequeñas diferencias, anotadas en el script dataManagment).
4) Variable "Listas". Recodificada en script dataMangament a partir de información de alianzas y adhesiones provistas por las autoiradades electorales, asignandole un número a cada Lista_Año. Se tomó el nombre de la lista que presentó candidato a GOBERNADOR, se le asigó un número y se computó el mismo número a todas las listas legislativas (Senador y Diputado provincial) que adhirieron a ese candidato a Gobernador. 
5) Variable "Cargo". La base de datos original incluye resultados para las candidaturas a GOBERNADOR, DIPUTADO y SENADOR. En el script dataManagment transofrmamos esta variable asimilando los resultados para cargos legislativos (DIPUTADO & SENADOR) como equivalentes. 
6) Variable "Municpio". Variable que sirve para identificar rapidamente distritos en los que se asigó tratamiento y control en algunos de los modelos. Recodificada con un número por orden alfabético. 
