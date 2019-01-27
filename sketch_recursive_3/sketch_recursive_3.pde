

void setup(){
  size(600, 600);
  background(30);
  //noStroke();
  noFill();
  colorMode(HSB, 360, 100, 100);
  recursiveThing(width/2, height/2, 500);
}

void recursiveThing(float x, float y, float size){
  float angle, nx, ny, h, s, b;
  //stroke(map(size, 500, 100, 360, 0), 100, 100);
  //stroke(255, 100);
  ellipse(x, y, size, size);
  
  if(size > 100){
    for(float i = 0; i < TWO_PI; i+=QUARTER_PI){
      angle = i;
      nx = x + size/4 * cos(angle);
      ny = y + size/4 * sin(angle);
      println(sin(angle));
      h = map(sin(angle), -1, 1, 300, 360);
      s = 100;
      b = map(ny, 100, 500, 10, 100);
      stroke(h, s ,b);
      recursiveThing(nx, ny, size/2);
    }
  }
}