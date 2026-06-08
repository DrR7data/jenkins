# plantilla-docker para trababar con docker


Nota: para Poder trabajar con el archivo Makefile, debes instalar make en subsistema de linux  en windows `sudo apt install make ` o brew en mac `brew install make`. 


## 1. Make build
    ```bash
    make build #Veras en la pantalla la construción de la imagen con de alpine e instalación de git.
    docker image ls #. verás en la pantalla la imagen construida en docker, sus caracteristicas, y su tamaño 
    ```
## 2. Make run 
    ```bash
    make run  
    ```
Se montará la imagen en un contenedor empezará a correr en ese instante entrarás a la terminal del contenedor, como realizamos `COPY` en el archivo Dockerfile, al momento de crear la imagen se copiarons los archivos que tenías en la carpeta y además verás en la terminal el directorio de trabajo `pantilla-docker ` que especificamo con el comando `WORKDIR`

### Dentro del contenedor

 ```bash
    ls # verás lo archivos que copiamos al crear la imagen.

    ```

# El archivo make ayuda bastante cuando son tarea repetitivas.