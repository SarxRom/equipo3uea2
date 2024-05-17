import com.hamoid.*;

import processing.video.*;
Movie video;
boolean isVideoPlaying = false;
boolean movimientoActivo = false;
PImage[] images;//cargar imagenes
PImage[] fondoImages = new PImage[4]; // Array para almacenar las imágenes de fondo
int fondoIndex = 0; // Índice para la imagen de fondo actual
int lastTime = 0; // Variable para controlar el tiempo
int changeInterval = 10000; // Intervalo de cambio de fondo en milisegundos (1 segundo)
PImage personajeImg1; // Variable para almacenar la imagen del primer personaje
PImage personajeImg2; // Variable para almacenar la imagen del segundo personaje
PImage personajeImg3; // Variable para almacenar la imagen del tercer personaje
Personaje jugador1; // Variable para almacenar al primer personaje
Personaje jugador2; // Variable para almacenar al segundo personaje
Personaje jugador3; // Variable para almacenar al tercer personaje

void setup() {
  frameRate(10);
  fullScreen(); // Tamaño de la ventana
  //noCursor();
  //fondoImages = new PImage[4]; // Inicializar el array de imágenes de fondo
  fondoImages[0] = loadImage("assets/collage_1.png");
  fondoImages[1] = loadImage("assets/collage_2.png");
  fondoImages[2] = loadImage("assets/collage_3.png");
  fondoImages[3] = loadImage("assets/collage_4.png");

  images = new PImage[5];
  images[0] = loadImage("assets/1.png");
  images[1] = loadImage("assets/1.png");
  images[2] = loadImage("assets/2.png");
  images[3] = loadImage("assets/teddy_bear.png");
  images[4] = loadImage("assets/teddy_bear.png");
  // Establecer el tamaño de las imágenes
  for (int i = 0; i < images.length; i++) {
    images[i].resize(250, 0); // Ajustar el ancho a 100 pixeles, manteniendo la proporción
     video = new Movie(this, "assets/explosion.mp4");
  video.loop();
  }


  //Carga las imágenes de los personajes
  personajeImg1 = loadImage("assets/maynez.png");

  personajeImg2 = loadImage("assets/sheinbaum.png");

  personajeImg3 = loadImage("assets/xochuikl.png");

  //Crea los personajes en diferentes posiciones de la ventana
  jugador1 = new Personaje(width/2, height/2);
  jugador2 = new Personaje(width/3, height/3);
  jugador3 = new Personaje(2*width/3, 2*height/3);
}

void draw() {
  background(fondoImages[fondoIndex]); // Establecer el fondo actual


  //Mostrar las imágenes dispersas
  if (movimientoActivo) {
  for (int i = 0; i < images.length; i++) {
    float x = random(width);
    float y = random(height);
    image(images[i], x, y);
  }
  if (isVideoPlaying) {
    image(video, 0, 0, width, height);
  } else {
    background(0);
  }
  }

  // Muestra a todos los personajes
  jugador1.mostrar1();
  jugador2.mostrar2();
  jugador3.mostrar3();
}

void keyPressed() {

  if (key == 'C') {
    fondoIndex = 0;
  } else if (key == 'V') {
    fondoIndex = 1;
  } else if (key == 'B') {
    fondoIndex = 2;
  } else if (key == 'N') {
    fondoIndex = 3;
  }
  
  if (key == 'Y') { // Tecla Y
    movimientoActivo = !movimientoActivo; // Cambia el estado del movimiento
  }
  
  //Controla el movimiento del primer personaje utilizando las teclas de flecha
  if (keyCode == UP) {
    jugador1.mover(0, -5); // Mueve hacia arriba
  } else if (keyCode == DOWN) {
    jugador1.mover(0, 5); // Mueve hacia abajo
  } else if (keyCode == LEFT) {
    jugador1.mover(-5, 0); // Mueve hacia la izquierda
  } else if (keyCode == RIGHT) {
    jugador1.mover(5, 0); // Mueve hacia la derecha
  }

  //Controla el movimiento del segundo personaje utilizando las teclas WASD
  if (key == 'w' || key == 'W') {
    jugador2.mover(0, -5); // Mueve hacia arriba
  } else if (key == 's' || key == 'S') {
    jugador2.mover(0, 5); // Mueve hacia abajo
  } else if (key == 'a' || key == 'A') {
    jugador2.mover(-5, 0); // Mueve hacia la izquierda
  } else if (key == 'd' || key == 'D') {
    jugador2.mover(5, 0); // Mueve hacia la derecha
  }

  //Controla el movimiento del tercer personaje utilizando las teclas IJKL
  if (key == 'i' || key == 'I') {
    jugador3.mover(0, -5); // Mueve hacia arriba
  } else if (key == 'k' || key == 'K') {
    jugador3.mover(0, 5); // Mueve hacia abajo
  } else if (key == 'j' || key == 'J') {
    jugador3.mover(-5, 0); // Mueve hacia la izquierda
  } else if (key == 'l' || key == 'L') {
    jugador3.mover(5, 0); // Mueve hacia la derecha
  }
  // Presiona la tecla 'p' para reproducir/pausar el video
  if (key == 'p' || key == ' ') { //ESPACIO
    if (isVideoPlaying) {
      video.pause();
    } else {
      video.play();
    }
    isVideoPlaying = !isVideoPlaying;
  }
}

//Clase para representar al personaje
class Personaje {
  float x, y; // Posición del personaje

  Personaje(float x_, float y_) {
    x = x_;
    y = y_;
  }

  // Método para mostrar al personaje en la pantalla
  void mostrar1() { //maynez
    // Cuerpo
    fill(255, 117, 26); // Color del cuerpo de maynez
    rectMode(CENTER);
    rect(x, y + 30, 90, 120);

    // Brazos
    stroke(0); // Color negro
    strokeWeight(11); // Grosor de línea
    line(x - 35, y + 30, x - 80, y + 60); // Brazo izquierdo
    line(x + 35, y + 30, x + 80, y + 60); // Brazo derecho

    // Piernas
    line(x - 40, y + 80, x - 60, y + 110); // Pierna izquierda
    line(x + 40, y + 80, x + 60, y + 110); // Pierna derecha

    // Cabeza
    imageMode(CENTER);
    image(personajeImg1, x, y - 80, 170, 170); // Muestra la imagen del personaje en su posición
  }
  void mostrar2() {//claudia
    // Cuerpo
    fill(153, 51, 51); // Color del cuerpo de claudia
    rectMode(CENTER);
    rect(x, y + 30, 80, 110);

    // Brazos
    stroke(0); // Color negro
    strokeWeight(11); // Grosor de línea
    line(x - 35, y + 30, x - 80, y + 60); // Brazo izquierdo
    line(x + 35, y + 30, x + 80, y + 60); // Brazo derecho

    // Piernas
    line(x - 40, y + 80, x - 50, y + 110); // Pierna izquierda
    line(x + 40, y + 80, x + 50, y + 110); // Pierna derecha

    // Cabeza
    imageMode(CENTER);
    image(personajeImg2, x, y-80, 170, 170);
  }
  void mostrar3() {//xochitl
    //Cuerpo
    fill(0, 102, 255); // Color del cuerpo de xochitl
    rectMode(CENTER);
    rect(x, y + 30, 80, 110);

    // Brazos
    stroke(0); // Color negro
    strokeWeight(11); // Grosor de línea
    line(x - 35, y + 30, x - 80, y + 60); // Brazo izquierdo
    line(x + 35, y + 30, x + 80, y + 60); // Brazo derecho

    // Piernas
    line(x - 40, y + 80, x - 50, y + 110); // Pierna izquierda
    line(x + 40, y + 80, x + 50, y + 110); // Pierna derecha

    // Cabeza
    imageMode(CENTER);
    image(personajeImg3, x, y - 90, 170, 170); // Muestra la imagen del personaje en su posición
  }


  // Método para mover al personaje
  void mover(float dx, float dy) {
    x += dx; // Mueve en el eje x
    y += dy; // Mueve en el eje y
  }
}
