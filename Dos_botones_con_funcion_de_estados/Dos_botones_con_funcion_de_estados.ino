int buttonPin1 = 2;                  // Pin donde está conectado el primer botón
int buttonPin2 = 3;                  // Pin donde está conectado el segundo botón
int buttonState1;                    // Estado actual del primer botón
int buttonState2;                    // Estado actual del segundo botón
int lastButtonState1 = LOW;          // Estado anterior del primer botón
int lastButtonState2 = LOW;          // Estado anterior del segundo botón
unsigned long lastDebounceTime1 = 0; // Tiempo de última lectura estable del primer botón
unsigned long lastDebounceTime2 = 0; // Tiempo de última lectura estable del segundo botón
unsigned long debounceDelay = 50;    // Tiempo de debounce

void setup() {
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  Serial.begin(9600);  // Iniciar la comunicación serial a 9600 bps
}

void loop() {
  // Leer el estado del primer botón
  int reading1 = digitalRead(buttonPin1);

  // Comprueba si hay cambios en la lectura del primer botón
  if (reading1 != lastButtonState1) {
    // Reinicia el temporizador de debounce
    lastDebounceTime1 = millis();
  }

  // Si el tiempo de debounce ha pasado para el primer botón
  if ((millis() - lastDebounceTime1) > debounceDelay) {
    // Si el estado de la lectura ha cambiado
    if (reading1 != buttonState1) {
      buttonState1 = reading1;

      // Solo enviar el mensaje cuando el primer botón esté presionado
      if (buttonState1 == HIGH) {
        Serial.println("BUTTON1_PRESSED");
      }
    }
  }

  // Guardar el estado de la lectura actual del primer botón
  lastButtonState1 = reading1;

  // Leer el estado del segundo botón
  int reading2 = digitalRead(buttonPin2);

  // Comprueba si hay cambios en la lectura del segundo botón
  if (reading2 != lastButtonState2) {
    // Reinicia el temporizador de debounce
    lastDebounceTime2 = millis();
  }

  // Si el tiempo de debounce ha pasado para el segundo botón
  if ((millis() - lastDebounceTime2) > debounceDelay) {
    // Si el estado de la lectura ha cambiado
    if (reading2 != buttonState2) {
      buttonState2 = reading2;

      // Solo enviar el mensaje cuando el segundo botón esté presionado
      if (buttonState2 == HIGH) {
        Serial.println("BUTTON2_PRESSED");
      }
    }
  }

  // Guardar el estado de la lectura actual del segundo botón
  lastButtonState2 = reading2;
}
