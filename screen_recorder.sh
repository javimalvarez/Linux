#!/bin/bash
if [ -f /usr/bin/ffmpeg ];
then
echo "Iniciando grabación pantalla (para salir o parar la grabación pulsa ctrl+c)..."
else
echo "ffmpeg no consta instalado en el sistema\nIniciando instalación..."
sudo apt install ffmpeg -y
echo "Iniciando grabación pantalla (para salir o parar la grabación  pulsa ctrl+c)..."
fi
read -p "indica nombre de archivo: " filename
echo "Obteniendo resolución de pantalla..."
#echo "$(xdpyinfo | grep 'dimensions:')"
#read -p "indica la resolución de tu monitor: " resolution
#ffmpeg -f x11grab -r 25 -s $resolucion -i :0.0 -vcodec huffyuv 
ffmpeg -f x11grab -s hd1080 -r 60 -i :0.0 -f alsa -i pulse $HOME/Videos/$filename.mp4
