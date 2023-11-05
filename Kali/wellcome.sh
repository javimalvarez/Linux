#!/bin/bash
date=$(date +"%a %e %b. %Y %R %Z")
amixer sset Master 40%
saludo=$(bash ~/bin/Kali/saludo.sh)
if [ -f $HOME/Música/Sounds/startup.wav ];
then
mplayer $HOME/Música/Sounds/startup.wav
else
if [ -d $HOME/Música/Sounds/ ];
then
cd $HOME/Música/Sounds/ 
wget -b https://www.dropbox.com/s/bhi4zcilo4iofsm/startup.wav
else
mkdir $HOME/Música/Sounds/
cd $HOME/Música/Sounds/
wget https://www.dropbox.com/s/cmxcy5ksq11qjqc/startup.wav
mplayer $HOME/Música/Sounds/startup.wav
fi
fi
if [ -f /usr/bin/espeak ];
then
espeak "$saludo $USER Bienvenido a Kali Linux" -v "mb/mb-es2" 2> /dev/null #2> omite la salida de errores por consola
else
echo "espeak no aparece instalado en el sistema\nIniciando instalación..."
sudo apt install speak espeak-data -y
espeak "$saludo $USER Bienvenido a Kali Linux" -v "mb/mb-es2" 2> /dev/null
fi
amixer sset Master 50%
zenity --info --text "$date\n\nBienvenido a Kali Linux $USER!\nHappy hacking!" --timeout="5"
