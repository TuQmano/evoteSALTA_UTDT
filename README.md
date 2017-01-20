# evoteSALTA_UTDT
Data y código - paper Maestría UTDT

#Scripts. 
1º Data Managment (a partir de dbase en archivo .csv)https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/Script%20R%20-%20Data%20Managment

2º Modelos (con un stop en punto 3º para Input Totales) https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/Modelos%20en%20R

3ºInput totales (y de vuelta al 2º) https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/Input%20TOTALES

#dBase
.csv con resultados electorales de 2007 y 2011 para la totalidad de los circuitos de la provincia de Salta. 
Observaciones (cantidad de votos) desagregadas por categoría (GOBERNADOR, LEGISLADOR -Diputado & Senador), partido político (LISTA) y CIRCUITO electoral (la base incluye mesas, pero estas varían entre elecciones).
https://raw.githubusercontent.com/TuQmano/evoteSALTA_UTDT/master/11SEPT_Salta_Completo_2007_2011.csv

#VARIABLES (y transformaciones - data managment- a partir de scripts)
1) Variable "Year"(año de elección). Recodificada "0" (si se trata de elección 2007) y "1" (si se trata de elección 2011)
2) Variable "VE" (asignación de "tratamiento" - circuitos que votaron con Voto Electrónico (VE) en 2011). Toma valo "O" si corresponde a circuitos que mantuvieron sistema tradicional ("control") y "1"si en 2011 votaron con el nuevo sistema ("tratamiento"). 
3) Variable "Circuito". Código alfanumérico dado por autoridades electorales. A diferencia de la numeración de las mesas y los centros de votación, estos son equivalente entre elecciones (con algunas pequeñas diferencias, anotadas en el script dataManagment).
4) Variable "Listas". Recodificada en script dataMangament a partir de información de alianzas y adhesiones provistas por las autoiradades electorales, asignandole un número a cada Lista_Año. Se tomó el nombre de la lista que presentó candidato a GOBERNADOR, se le asigó un número y se computó el mismo número a todas las listas legislativas (Senador y Diputado provincial) que adhirieron a ese candidato a Gobernador. 
5) Variable "Cargo". La base de datos original incluye resultados para las candidaturas a GOBERNADOR, DIPUTADO y SENADOR. En el script dataManagment transofrmamos esta variable asimilando los resultados para cargos legislativos (DIPUTADO & SENADOR) como equivalentes. 
6) Variable "Municpio". Variable que sirve para identificar rapidamente distritos en los que se asigó tratamiento y control en algunos de los modelos. Recodificada con un número por orden alfabético. 

#CARTOGRAFIA
Google Fusion Tables (SALTA - Municipios)
https://www.google.com/fusiontables/DataSource?docid=1mSQ-EUh3_PK_C3C448TGmBpNbMGtnfAPlRqsTBwy
Google Maps (Escuelas Treatment & Control) - Salta CAPITAL
https://www.google.com/maps/d/edit?mid=119aqN9xB6kIGgNmr79qqz5JvuOo&ll=-24.780574048772323%2C-65.45555558055639&z=11
