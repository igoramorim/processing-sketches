float a = 0;
float b = 0;
//float[] angles = {0, 180, 90};

void setup() {
  size(600, 600);
  noFill();
  //smooth(8);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(30);
  translate(width/2, height/2);
  recursiveFunction(100 * cos(a), 100 * sin(a), 100, 30);
  a += 0.005;
  b += 0.05;
}

void recursiveFunction(float x, float y, float radius, int level) {
  float angle, nx, ny, nr;
  //stroke(255, 10*level, 0);
  stroke(360/30*level, 100, 100);
  ellipse(x, y, radius, radius);
  
  if(level > 1) {
    //angle = random(TWO_PI);
    //nx = x + radius/2 * cos(a);
    //ny = y + radius/2 * sin(a);
    //nr = radius/2 * sin(b);
    //recursiveFunction(nx, ny, nr, level-1);
    
    //angle = random(TWO_PI);
    //nx = x + radius/2 * cos(TWO_PI);
    //ny = y + radius/2 * sin(TWO_PI);
    //nr = radius/2 * sin(b);
    //recursiveFunction(nx, ny, nr, level-1);
    
    
    angle = 0;
    nx = x + radius/10 * cos(a);
    ny = y + radius/2 * sin(angle);
    nr = radius-50 * sin(a);
    recursiveFunction(nx, ny, nr, level-1);
    
    
    //nx = width/2 * cos(a);
    //ny = height/2;
    //nr = radius/2 * sin(a);
    //recursiveFunction(nx, ny, nr, level-1);
    
  }
}