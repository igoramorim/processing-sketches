int r = 30;
float y = 0;
float c = 0;

void setup() {
  size(400, 400);
  stroke(255, 0, 155);
  noFill();
  blendMode(ADD);
}

void draw() {
  
  background(30);
  
  translate(width/2, height/2);
  //rotate(sin(y));
  //rotate(sin(y) * 2);
  rotate(y / 2);
  
  //PI * 2 = 1 circulo completo = 360 graus
  for(float angle = 0; angle < PI * 2; angle += 0.2){
    ellipse(angle * sin(y) * 30, sin(angle) * sin(y) * 25, r, r);  
  }
  
  y += 0.1;
}