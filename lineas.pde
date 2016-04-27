
void setup() {
  size(1024, 768, P2D);
  smooth();
}

void draw() {

  //movemos el lapiz al centro, rotamos, y volvemos al corner
  translate(width/2, height/2);
  rotate(mouseY/100f);
  translate(-width/2, -height/2);

  //limpiamos pantalla y ponemos tamaño de linea+color
  background(0);
  stroke(255);
  strokeWeight(4); 

  //la separación entre lineas
  float separacionLineas = (mouseX/10f);

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