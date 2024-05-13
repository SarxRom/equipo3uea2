PImage[] images;//cargar imagenes
PImage personajeImg1; // Variable para almacenar la imagen del primer personaje
PImage personajeImg2; // Variable para almacenar la imagen del segundo personaje
PImage personajeImg3; // Variable para almacenar la imagen del tercer personaje
Personaje jugador1; // Variable para almacenar al primer personaje
Personaje jugador2; // Variable para almacenar al segundo personaje
Personaje jugador3; // Variable para almacenar al tercer personaje

void setup() {
  frameRate(15);
  fullScreen(); // Tamaño de la ventana
  //noCursor();
  images = new PImage[5];
  images[0] = loadImage("assets/1.png");
  images[1] = loadImage("assets/1.png");
  images[2] = loadImage("assets/2.png");
  images[3] = loadImage("assets/teddy_bear.png");
  images[4] = loadImage("assets/teddy_bear.png");
  // Establecer el tamaño de las imágenes
  for (int i = 0; i < images.length; i++) {
    images[i].resize(120, 0); // Ajustar el ancho a 100 pixeles, manteniendo la proporción
  }


  // Carga las imágenes de los personajes
  personajeImg1 = loadImage("assets/maynez.png");

  personajeImg2 = loadImage("assets/sheinbaum.png");

  personajeImg3 = loadImage("assets/xochuikl.png");

  // Crea los personajes en diferentes posiciones de la ventana
  jugador1 = new Personaje(width/2, height/2);
  jugador2 = new Personaje(width/3, height/3);
  jugador3 = new Personaje(2*width/3, 2*height/3);
}

void draw() {
  background(220); // Fondo gris claro
  // Mostrar las imágenes dispersas
  for (int i = 0; i < images.length; i++) {
    float x = random(width);
    float y = random(height);
    image(images[i], x, y);
  }

  // Muestra a todos los personajes
  jugador1.mostrar1();
  jugador2.mostrar2();
  jugador3.mostrar3();
}

void keyPressed() {
  // Controla el movimiento del primer personaje utilizando las teclas de flecha
  if (keyCode == UP) {
    jugador1.mover(0, -5); // Mueve hacia arriba
  } else if (keyCode == DOWN) {
    jugador1.mover(0, 5); // Mueve hacia abajo
  } else if (keyCode == LEFT) {
    jugador1.mover(-5, 0); // Mueve hacia la izquierda
  } else if (keyCode == RIGHT) {
    jugador1.mover(5, 0); // Mueve hacia la derecha
  }

  // Controla el movimiento del segundo personaje utilizando las teclas WASD
  if (key == 'w' || key == 'W') {
    jugador2.mover(0, -5); // Mueve hacia arriba
  } else if (key == 's' || key == 'S') {
    jugador2.mover(0, 5); // Mueve hacia abajo
  } else if (key == 'a' || key == 'A') {
    jugador2.mover(-5, 0); // Mueve hacia la izquierda
  } else if (key == 'd' || key == 'D') {
    jugador2.mover(5, 0); // Mueve hacia la derecha
  }

  // Controla el movimiento del tercer personaje utilizando las teclas IJKL
  if (key == 'i' || key == 'I') {
    jugador3.mover(0, -5); // Mueve hacia arriba
  } else if (key == 'k' || key == 'K') {
    jugador3.mover(0, 5); // Mueve hacia abajo
  } else if (key == 'j' || key == 'J') {
    jugador3.mover(-5, 0); // Mueve hacia la izquierda
  } else if (key == 'l' || key == 'L') {
    jugador3.mover(5, 0); // Mueve hacia la derecha
  }
}

// Clase para representar al personaje
class Personaje {
  float x, y; // Posición del personaje

  Personaje(float x_, float y_) {
    x = x_;
    y = y_;
  }

  // Método para mostrar al personaje en la pantalla
  void mostrar1() { //maynez
    // Cuerpo
    fill(255, 117, 26); // Color del cuerpo de claudia
    rectMode(CENTER);
    rect(x, y + 10, 60, 90);

    // Brazos
    stroke(0); // Color negro
    strokeWeight(9); // Grosor de línea
    line(x - 15, y + 10, x - 60, y + 40); // Brazo izquierdo
    line(x + 15, y + 10, x + 60, y + 40); // Brazo derecho

    // Piernas
    line(x - 20, y + 60, x - 30, y + 90); // Pierna izquierda
    line(x + 20, y + 60, x + 30, y + 90); // Pierna derecha

    // Cabeza
    imageMode(CENTER);
    image(personajeImg1, x, y - 80, 150, 150); // Muestra la imagen del personaje en su posición
  }
  void mostrar2() {//claudia
    // Cuerpo
    fill(153, 51, 51); // Color del cuerpo de claudia
    rectMode(CENTER);
    rect(x, y + 10, 60, 90);

    // Brazos
    stroke(0); // Color negro
    strokeWeight(9); // Grosor de línea
    line(x - 15, y + 10, x - 60, y + 40); // Brazo izquierdo
    line(x + 15, y + 10, x + 60, y + 40); // Brazo derecho

    // Piernas
    line(x - 20, y + 60, x - 30, y + 90); // Pierna izquierda
    line(x + 20, y + 60, x + 30, y + 90); // Pierna derecha

    // Cabeza
    imageMode(CENTER);
    image(personajeImg2, x, y-60, 150, 150);
  }
  void mostrar3() {//xochitl
    // Cuerpo
    fill(0, 102, 255); // Color del cuerpo de claudia
    rectMode(CENTER);
    rect(x, y + 10, 60, 90);

    // Brazos
    stroke(0); // Color negro
    strokeWeight(9); // Grosor de línea
    line(x - 15, y + 10, x - 60, y + 40); // Brazo izquierdo
    line(x + 15, y + 10, x + 60, y + 40); // Brazo derecho

    // Piernas
    line(x - 20, y + 60, x - 30, y + 90); // Pierna izquierda
    line(x + 20, y + 60, x + 30, y + 90); // Pierna derecha

    // Cabeza
    imageMode(CENTER);
    image(personajeImg3, x, y - 80, 150, 150); // Muestra la imagen del personaje en su posición
  }


  // Método para mover al personaje
  void mover(float dx, float dy) {
    x += dx; // Mueve en el eje x
    y += dy; // Mueve en el eje y
  }
}
