float diameter = 100; 
float angle = 0;
float offset = diameter/2;
float r = 0;

void setup() {
  size(400, 400);
  blendMode(ADD);
  //frameRate(30);
}

void draw(){
 background(0);
 translate(width/2, height/2);
 
 float d = 20 + (sin(angle + PI/2) * diameter) + diameter;
 rotate(r);
 
 fill(255, 0, 0);
 ellipse(0 - offset, 0, d, d);
 
 fill(0, 255, 0);
 ellipse(0 + offset, 0, d, d);
 
 fill(0, 0, 255);
 ellipse(0, 0 + offset, d, d);
 
 angle += 0.03;
 r += 0.02;
}