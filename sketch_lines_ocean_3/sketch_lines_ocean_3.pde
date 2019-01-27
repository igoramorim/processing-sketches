float time = 0;
float offSet = 10;
int totalFrames = 300;
int c = 0;

void setup() {
  size(400, 400);
  stroke(255);
  frameRate(25);
}

void draw() {
  background(0);
  
  float x = 10;
  
  while (x < width) {
    //stroke(c);
    line(x, offSet + 80 * noise(x / 100, time), x, height);
    x = x + 10;
    //c = 255 - c;
  }
  
  time = time + 0.02;
  
  if(frameCount >= 350){
    offSet -= 5;
  }else{
    offSet += 1;
  }
  
  //saveFrame("frame-####.tif");
  
  if(frameCount > 430){
    noLoop();
    println("ok");
  }
  
  //println("frames: " + frameCount + " | seconds: " + frameCount/frameRate);
}