
void setup(){
  size(400, 400);
  background(0);
  noStroke();
  fill(200);
  rectMode(CENTER);
  frameRate(30);
}

void draw(){
  //fill(0, 50);
  //rect(0, 0, width, height);
  background(0);
 
  for(int i = 20; i < width; i += 20){
    for(int j = 20; j < height; j += 20){
      float n = noise(i * 0.005, j * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(i, j);
      fill(255, map(n, 0, 0.5, 50, 200));
      println(n);
      //rotate(TWO_PI * n);
      scale(n * 30);
      rect(0, 0, 1, 1);
      popMatrix();
    }
  }
  
}