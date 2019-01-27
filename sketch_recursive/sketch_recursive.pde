void setup(){
  size(600, 600);
  background(30);
  noStroke();
  recursiveThing(width/2, height/2, 300);
}

void recursiveThing(float x, float y, float size){
  float angle, nx, ny;
  fill(lerpColor(#000000, #FFFFFF, random(1)), 100);
  ellipse(x, y, size, size);
  
  if(size > 5){
    for(int i = 0; i < 3; i++){
      angle = random(TWO_PI);
      nx = x + size/2 * cos(angle);
      ny = y + size/2 * sin(angle);
      recursiveThing(nx, ny, size/2);
    }
  }
}