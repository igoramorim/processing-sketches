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
  
  translate(width/2, height/2);
  rotate(y/100);
  
  //PI * 2 = 1 circulo completo = 360 graus
  for(float angle = 0; angle < PI; angle += 0.2){
    
                                                    //sin(y/2)
    ellipse(angle * cos(y/2) * 40, sin(-angle) * sin(y) * 30, r, r);  
  }
 
  y += 0.2;
}