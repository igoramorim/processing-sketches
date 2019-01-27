float time = 0;
float t = 50;

void setup(){
 size(400, 400);
 noFill();
 stroke(255, 0, 150);
}

void draw(){
  background(30);
  
  float sx = cos(time) * t;
  float sy = sin(time) * t;
  
  translate(width/2, height/2);

  beginShape();
    vertex(-30 + sx, -100);
    vertex(30, 100 + sy);
    vertex(-30 + sx, 100);
    vertex(30, 175 + sy);
  endShape(CLOSE);

  
  time += 0.05;
}