# VIM

## Modos

Existen dos modos:

1. Navegación: se activa cuando presionamos la tecla **ESC**
2. Edición: se activa cuando presionamos la tecla **i**, esta nos posiciona al inicio del caraccter que se encuetre marcado.

## Comandos generales para el uso de VIM

**General**

|Tecla|Combinación|Función
|:-|:-|:-
|:|w|Guarda cambios
|:|wq|Guarda cambios y cierra
|:|x|Guarda y cierra
|:|q!|Cierra sin guardar.
|i||Entra en modo **INSERT**, ubica el cursor antes del caracter seleccionado.
|a||Entra en modo **INCERT**, ubica el cursor despues del caracter seleccionado. 
|A||Entra en modo **INCERT**, ubica el cursor al final de la línea.

**Navegación**

|Tecla|Combinación|Función
|:-|:-|:-
|h||Mueve cursor hacia la izquierda
|j||Mueve cursor hacia abajo
|k||Mueve cursor hacia la arriva
|l||Muve cursor hacia la derecha
|w||Mueve el cursor hacia la derecha saltando palabras y posiciona al inicio de la palabra.
|e||Mueve el cursor hacia la derecha saltando palabras y lo posiciona al final de la palabra
|b||Mueve cursor hacia la izquierda saltando palabras y lo posiciona al inicio de la palabra 
|g|d|Me coloco sobre una variable y al ejecutar la combinación me guiará hacia su definición. También funciaona para guiarnos hacia la declaración de funciones.
|g|f|Me coloco sobre un llamado a funsión y con la combinación me guiará hacia su declaración
|Ctrl|o|Regresa un paso atras desde el llamado realizado en el punto anterior a su llamado.
|Ctrl|i|Regresa un paso adelante desde el punto funal en el que se encontraba el cursor.
|g|g|Salta el inicio del documento
|G||Salta al final del documento.
|***n***|G|Salta a una línea determinada donde ***n*** es el número de línea al que se desea saltar.
|***n***|k|Salta ***n*** líneas hacia arriba.
|***n***|j|Salta ***n*** líneas hacia abajo.
|/ o ?||busca conincidencias en texto, nos permite ingresar la palabra que deseamos buscar. Debemos presionar la tecla ***enter*** para confirmar la palabra que se esta buscando, para saltar entre todas las coincidencias lo hacemos presionando la letra ***n***. Para regresar a la bùsqueda de la palabra lo hacemos con le letra ***N***
|}||Salta al siguiente bloque de código
|{||Regresa al anterior bloque de código

**Edición**

|Tecla|Combinación|Función
|:-|:-|:-
|x||Elimina los caracteres que se encuentran delante del cursor.
|d|w|Elimina toda una palabra incluyendo su espacio seguido.
|d|e|Elimina toda una palabra.
|d|b|Elimina la palabra que se encuentra detras del cursor.
|a|$|Elimina desde la posición en la que se encuentra el cursor hasta el final de la línea.
|d|***n*** w|Elimina una determinada cantidad de caracteres donde ***n*** es la cantidad de palabras que se desea eliminar
|u||Deshacer
|Ctrl|r| Re-hacer
|dd||Corta/Elimina toda la línea
|yy||Copia una línea completa
|p||Pega lo que contiene el clipboard en la línea siguiente en la que se encuentra el cursor.
|P||Pega lo que contiene el clipboard en la línea anterior a la que se encuentra el cursor.
|r||Sirve para reemplazar un caracter colocando el cursor sobre la letra que se desea cambiar.
|R||Entra en modo insert lo que nos permite ir reemplazando de los caracteres de una palabra en contínuo a diferencia de *r* que solo reemplaza un solo caracter.
|c|w|Cambiara una palabrac ompleta colocandonos sobre su primera letra, la función elimina la palabra.
|/ o ?||busca conincidencias en texto, nos permite ingresar la palabra que deseamos buscar. Debemos presionar la tecla ***enter*** para confirmar la palabra que se esta buscando, para saltar entre todas las coincidencias lo hacemos presionando la letra ***n***. Para regresar a la bùsqueda de la palabra lo hacemos con le letra ***N***
|:|%s/***palabra***/***nueva palabra***/gc|Comando reemplaza la *palabra* por una *nueva palabra*. Nos preguntara cada vez que se vaya a reemplazar una palabra.
|o||Inserta una lína debajo de la línea en la que se encuentra el cursor.
|O||Inserta una lína arriba de la línea en la que se encuentra el cursor.
|v||Ingresamos en modo visual lo que nos permite seleccionar una cadena de caracteres para así poderla eliminar, cortar, copiar, etc.
|y||En combinación con el comando *v*, una vez seleccionado un texto podemos utilizar el comando *y* para comiar la cadena de caracteres seleccionada.
|cc||Cambia una línea completa
|cw||Cambia una palabra del cursor hacia adelante.
|ciw||Cambia una palabra completa
|~||Cambia de caso: mayúscula/minúscula



Con esto hemos acabado de utilizar los comandos útiles para el uso de vim.

Ahora vamos a configurar diferentes funcionalidades en base a plugins.

Una de las recomendaciones es utilizar las interfaces gráficas provistas por nvim para su uso, algunas opciones las podrás encontrar en los siguientes links:
1. [Neovim-QT](https://github.com/equalsraf/neovim-qt)
2. [FVim](https://github.com/yatli/fvim)

Instalamos el gestor de plugins:

Para Windows:
```sh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force

...

    Directory: C:\Users\angel\vimfiles\autoload                                                                                                                                                                                                                                                                                                                                                                               Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         25/2/2022      9:34          82854 plug.vim

```

Vemos que el archivo de configuración ha sido creado en el directorio `Directory: C:\Users\angel\vimfiles\autoload` el documento se llama `plug.vim`


Para iniciar la edición del archivo de configuraciones accedemos a el de la siguiente manera:

```sh
vim ~/.vimrc
```

Nos crea un archivo de configuraciones nuevo en el que ingresaremos la siguiente configuración como ejemplo:

```vim
 " Habilita los nemeros de fila
 0 set number
 " Habilita el uso del mouse en consola
 1 set mouse=a
 " Setea el ancho de lo número en el lateral izquierdo
 2 set numberwidth=1
 " Habilita el clipboard entre PC y consola vim
 3 set clipboard=unnamed
 " Habilita colores en UI
 4 syntax enable
 " Habilita visualización de línea de comandos extendida
 5 set showcmd
 " Habilita regla
 6 set ruler
 7 set encoding=utf-8
 8 set showmatch
 " Configura TAB con dos espacios
 9 set sw=2
 " Habilita ubicación relativa en numeración en el lateral izquierdo
10 set relativenumber
11 set laststatus=2
```

Para que los cambios surtan efecto se deberá salir y guardar (:x)

Ahora vamos a intalar plugins para lo que ingresamos nuevamente al documento y abrimos y cerramos el modo de configuración:

```sh
vim ~/.vimrc
```

Ingresamos los plugins que deseamos instalar en el mismo documento:

```vim
   " Inicia instalación de plugins
14 call plug#begin('~/.vim/plugged')
15
   " cargo algunos plugins de ejemplo
16 Plug 'morhetz/gruvbox'
17 Plug 'fatih/vim-go'
18 Plug 'nsf/gocode'
19
   " Cierro la carga de plugins
20 call plug#end()
21
   " Configuro el plugin gruvbox
22 colorscheme gruvbox
23 let g:gruvbox_contrast_dark = "hard"
```

# PENDIENTE DESCRIBIR LOS PLUGINS QUE ESTOY UTILIZANDO


## Comandos utilizados con librerías

### Faith/vim-go

[LINK](https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt) para información de uso de la librería.

### NERDTree

Hemos configurado ya el atajo `" "nt` el cual nos permite ahblitar la segunda pantalla de navegación de documentos de la siguiente manera:

![img](img/Captura%20de%20pantalla%202022-02-25%20153957.png)

Como se puede observar en la imagen la pantalla se ha dividido en dos, en el panel del lado izquierdo podemos ver todoslos documentos del directorio en el que nos encontramos trabajando mientras que en el panel del lado dereche se mantiene el documento en el que nos encontramos trabajando al momento.

Para salta de un panel a otro podemos utilizar las sigueintes combinaciones:

- Ctrl + l, Salta al panel del lado derecha.
- Ctrl + h, salta al panel del lado izquierdo.