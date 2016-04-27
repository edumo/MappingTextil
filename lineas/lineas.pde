
import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus
void setup() {
  size(1024, 768, P2D);
  smooth();

  MidiBus.list(); 

  myBus = new MidiBus(this, 0, 0);
}

float separacionLineasParam = 1;
float grosorLineasParam = 1;
float rotacionParam = 1;

float separacionLineasValue = 1;
float grosorLineasValue = 1;
float rotacionValue = 1;



void draw() {

  grosorLineasValue = grosorLineasValue + (grosorLineasParam - grosorLineasValue)*0.05;
  separacionLineasValue = separacionLineasValue + (separacionLineasParam - separacionLineasValue)*0.05;
  rotacionValue = rotacionValue + (rotacionParam - rotacionValue)*0.01;

//grosorLineasValue = grosorLineasParam;
//separacionLineasValue = separacionLineasParam;
//rotacionValue = rotacionParam ;
  //movemos el lapiz al centro, rotamos, y volvemos al corner
  translate(width/2, height/2);
  rotate(rotacionValue/10f);
  translate(-width/2, -height/2);

  //limpiamos pantalla y ponemos tamaño de linea+color
  background(0);
  stroke(255);
  strokeWeight(grosorLineasValue); 

  //la separación entre lineas
  float separacionLineas = (separacionLineasValue);

  //este translate mueve las lineas
  //lo que hacemos es mover el lapiz
  //primero sacamos el lapiz un poco de la pantalla
  translate(-200, 0);
  //y ahora movemos el lapiz para el efecto de movimiento
  translate(frameCount%separacionLineas, 0);

  pushMatrix();

  for (int i = 0; i<150; i++) {
    translate(separacionLineas, 0);
    line(0, -height, 0, height*2);
  }

  popMatrix();
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);

  if (number == 71) {
    grosorLineasParam = value;
  }

  if (number == 74) {
    separacionLineasParam = value*3;
  }

  if (number == 84) {
    rotacionParam = value;
  }
}