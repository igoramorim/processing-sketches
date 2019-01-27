
void setup(){
  size(400, 400);
  background(0);
  noStroke();
  fill(200);
  rectMode(CENTER);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(30);
 
  for(int i = 20; i < width; i += 20){
    for(int j = 20; j < height; j += 20){
      float n = noise(i * 0.005, j * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(i, j);
      float c = map(n, 0, 0.8, 0, 360);
      fill(c, 100, 100);
      println(c);
      rotate(PI * n);
      scale(n * 30);
      rect(0, 0, 1, 1);
      popMatrix();
    }
  }
  
}