void setup(){
  size(600, 600);
  background(30);
  noStroke();
  //colorMode(HSB, 360, 100, 100, 100);
  recursiveThing(width/2, height/2, 300);
}

void recursiveThing(float x, float y, float size){
  float angle, nx, ny;
  //fill(map(size, 300, 0, 360, 0), 100, 100, 50);
  fill(map(size, 300, 20, 0, 255), 0, 0, constrain(size, 10, 200));
  ellipse(x, y, size, size);
  
  if(size > 20){
    for(float i = 0; i < 4; i++){
      angle = i * HALF_PI;
      nx = x + size/2 * cos(angle);
      ny = y + size/2 * sin(angle);
      recursiveThing(nx, ny, size/2);
    }
  }
}