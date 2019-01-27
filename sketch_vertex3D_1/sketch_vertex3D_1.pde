float time = 0;


void setup(){
 size(400, 400, P3D);
 noFill();
 stroke(255);
}

void draw() {
  
  background(30);
  
  translate(width/2, height/2, 0);
  
  rotateX(PI/2);
  rotateZ(-PI/6);
  
  beginShape();
    vertex(-100, -100, -100);
    vertex( 100, -100, -100);
    vertex(   0,    0,  100);
    
    vertex( 100, -100, -100);
    vertex( 100,  100, -100);
    vertex(   0,    0,  100);
    
    vertex( 100, 100, -100);
    vertex(-100, 100, -100);
    vertex(   0,   0,  100);
    
    vertex(-100,  100, -100);
    vertex(-100, -100, -100);
    vertex(   0,    0,  100);
  endShape();
  
}