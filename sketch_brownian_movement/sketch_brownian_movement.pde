float range = 30;
float prevX = width/2;
float prevY = height/2;
float nextX;
float nextY;
float time = 0;
float h = 0;

void setup(){
  size(320, 320);
  background(30);
  colorMode(HSB, 360);
  frameRate(30);
  strokeWeight(1);
}

void draw(){
   nextX = constrain(prevX + random(-range, range), 0, width);
   nextY = constrain(prevY + random(-range, range), 0, height);
   
   stroke(h, 360, 360);
   line(prevX, prevY, nextX, nextY);
   
   prevX = nextX;
   prevY = nextY;
   time += 0.001;
   h += 0.5;
   
   println(h);
   
   if (h > 360){
    noLoop();
    println(frameCount);
    println(frameCount / frameRate);
   }
}