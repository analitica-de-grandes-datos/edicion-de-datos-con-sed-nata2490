#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
# Agregar 0 inicial al día

sed 's/\,/\./g' data.csv > data-1.csv
sed 's/\;/\,/g' data-1.csv > data-2.csv
sed -r -e 'sx([^0-9]|^)([0-9]/)x\10\2xg' -e 'sx/([0-9]/)x/0\1xg' data-2.csv > data-3.csv
sed '1, 11 s/\//\/20/2' data-3.csv > data-4.csv
sed 's|\([0-2][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9][0-9][0-9]\)|\3-\2-\1|g' data-4.csv > data-5.csv
sed 'y/acn/ACN/' data-5.csv > data-6.csv
sed 's/\,\N/\,\\N/g' data-6.csv > data-7.csv
sed '5,6 s/\,/\,\\N/2' data-7.csv > data-8.csv
sed '5 s/\,/\,\\N/3' data-8.csv > data-9.csv
sed '7 s/\,/\,\\N/3' data-9.csv > output.csv



