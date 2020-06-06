float yoff = 0.0;
float totalVertices = 200;

void setup() {
  size(600, 600);
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  float radius = 150;
  
  beginShape();
  float xoff = 0;
  for (float angle = 0; angle < TWO_PI; angle += 0.1) {
    float offset = map(noise(xoff, yoff), 0, 1, -25, 25);
    float r = radius + offset;
    float x = r * cos(angle);
    float y = r * sin(angle);
    vertex(x, y);
    xoff += 0.1;
  }
  endShape();
  yoff += 0.01;
}
