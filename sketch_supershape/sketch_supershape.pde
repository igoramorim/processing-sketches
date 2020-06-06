// http://paulbourke.net/geometry/supershape/
// https://en.wikipedia.org/wiki/Superellipse

void setup() {
  size(400, 400);  
}

void draw() {
  background(50);
  translate(width/2, height/2);
  stroke(255);
  noFill();
  
  float a = map(sin(frameCount*0.05), -1, 1, 20, 100);//100;
  float b = map(cos(frameCount*0.05), -1, 1, 20, 100);//100;
  float n = map(cos(frameCount*0.05), -1, 1, 0.5, 4);//map(mouseX, 0, width, 0, 4);
  
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += 0.1) {
    float na = 2/n;
    float x = pow(abs(cos(angle)), na) * a * sgn(cos(angle));
    float y = pow(abs(sin(angle)), na) * b * sgn(sin(angle));
    
    vertex(x, y);
  }
  endShape(CLOSE);
}

int sgn(float val) {
  if (val > 0) {
    return 1;
  } else if (val < 0) {
    return -1;
  } else {
    return 0;
  }
}
