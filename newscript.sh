#!/bin/bash
cd ~/
#Preguntamos donde quiere guardar el archivo
read -p "¿Indica la carpeta donde quieres guardar el archivo? " file
if [ -d ~/$file ];
then
echo "el directorio ya existe"
else
#Crea el directorio si no existe
mkdir $file
fi
read -p "indica el nombre con quieres crear el archivo: " name
cd $file
#Crea el fichero
touch $name.sh
echo "#!/bin/bash" >> $name.sh
chmod 750 $name.sh
#Comenzamos a editar el script
nano $name.sh
