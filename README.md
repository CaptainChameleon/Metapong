# Pongcessing
Creando Interfaces de Usuario - Práctica 1

## Introducción
Se pide, como toma de contacto, recrear en Processing uno de los primeros videojuegos de la historia: Pong. 

## Implementación
La implementación ha de incluir al menos rebote, marcador, sonido y movimiento inicial aleatorio.

### Modelos
El juego implica 3 elementos bien diferenciados: la bola, las paletas de los jugadores y el marcador.

Tanto la bola como las paletas son fácilmente representables con rectángulos. Cada uno tendrá asociada una posición y una velocidad, 
la cual se utilizará para actualizar su posición en cada iteración. En el caso de la Bola, se incluye además la capacidad de generar una velocidad de dirección aleatoria.

El marcador es aún más sencillo de representar, pus únicamente implica guardar ambas puntuaciones en el objeto representativo y dibujarlas en la región adecuada.

### Controles
A cada jugador se le asocian los controles típicamente utilizados en videojuegos:

Jugador 1: W para subir y S para bajar la paleta

Jugador 2: Flecha arriba para subir y Flecha abajo para bajar la paleta

Para evitar bloqueos entre los jugadores, cuando se detecta que se ha presionado alguna de esas teclas esto se registra en una variable, a la que se liga el 
movimiento de cada paleta.

### Colisiones
Existen 2 tipos de colisiones en el juego: colisión de la bola con una pared, o colisión con algún jugador. En ambos casos simplemente se analiza la posición de la bola
y se modifica la componente de su velocidad adecuada, en caso de detectar que se encuentra en contacto con alguno de estos elementos.

Para el caso de la colisión con un jugador, es necesario tomar una precaución más. En ocasiones es posible que la bola llegue a la paleta con una trayectoria casi vertical,
por lo que puede producirse que, al modificar su velocidad y por ende su posición, en la siguiente iteración la bola no consiga dejar de estar en contacto con la paleta y 
se detecte nuevamente la colisión. Esto provocaría que se disparen las colisiones y se reproduzca múltiples veces el efecto de sonido asociado.

Para evitar esto, simplemente se ha de comprobar que una vez la bola rebota en un jugador, no se puede volver a efectuar dicho rebote de nuevo hasta haber rebotado en 
alguna pared o en el jugador contrario.

### Resultado
![The result](https://github.com/CaptainChameleon/Pongcessing/blob/9b418db8b3cd304a25a94b5bef7bd6c555218c5d/pong-teaser.gif)
