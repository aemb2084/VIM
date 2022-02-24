# VIM

## Modos

Existen dos modos:

1. Navegación: se activa cuando presionamos la tecla **ESC**
2. Edición: se activa cuando presionamos la tecla **i**, esta nos posiciona al inicio del caraccter que se encuetre marcado.

## Comandos generales para el uso de VIM

|Tecla|Combinación|Función
|:-|:-|:-
|:|w|Guarda cambios
|:|wq|Guarda cambios y cierra
|:|x|Guarda y cierra
|:|q!|Cierrra sin guardar.
|i||Entra en modo **INSERT**, ubica el cursor antes del caracter seleccionado.
|a||Entra en modo **INCERT**, ubica el cursor despues del caracter seleccionado. 
|A||Entra en modo **INCERT**, ubica el cursor al final de la línea.
|x||Elimina los caracteres que se encuentran al lado derecho del cursor.
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