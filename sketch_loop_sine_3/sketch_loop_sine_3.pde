int r = 30;
float y = 0;
float mult = 25;

void setup() {
  size(400, 400);
  stroke(255, 0, 155);
  noFill();
}

void draw() {
  
  background(30);
  
  translate(0, height/2);
  
  //PI * 2 = 1 circulo completo = 360 graus
  for(float angle = 0; angle < PI * 2; angle += 0.2){  
    
    ellipse(r/2 + angle * 60, sin(angle) * sin(y) * mult, r, r);  
  }
 
  y += 0.2;
}