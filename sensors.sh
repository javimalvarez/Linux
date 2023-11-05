#!/bin/bash

#Borra el fichero de log anterior en caso de existir
deletelog () {
if [ -a ~/Documentos/Logs/sensor.log ];
then
rm -r ~/Documentos/Logs/sensor.log
fi
}

#Función para sacar información del sistema y volcarla en un archivo de log
sensor () {
if [ -d ~/Documentos/Logs/ ];
then
deletelog       
else
mkdir ~/Documentos/Logs/
fi

#Devuelve información del sistema y componentes como procesador, RAM y disco duro
inxi > ~/Documentos/Logs/sensor.log
#Devuelve información del procesador
sensors >> ~/Documentos/Logs/sensor.log 
# Devuuelve información del disco duro
inxi -xD >> ~/Documentos/Logs/sensor.log 
}

sensor > /dev/null #Anula cualquier salida de texto por consola

#Consulta del log generado con cat o batcat
if [ -a /usr/bin/batcat ];
then
batcat ~/Documentos/Logs/sensor.log
else
cat ~/Documentos/Logs/sensor.log
fi
