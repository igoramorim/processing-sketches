float n = 0;
float cMin = 0;
float cMax = 360;

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
      float c = noise(i * 0.005, j * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(i, j);
      float cor = map(c, 0, 0.8, cMin, cMax);
      fill(cor, 100, 100);
      //println(c);
      rotate(sin(c) * 10);
      scale(c * 5);
      rect(0, 0, 20 * constrain(sin(n), 0.1, 1), 20 * constrain(cos(n), 0.1, 1));
      popMatrix();
    }
    n += 0.003;
  }
  
  if(frameCount % 100 == 0){
    cMin = 360 - cMin;
    cMax = 360 - cMax;
  }
  
}