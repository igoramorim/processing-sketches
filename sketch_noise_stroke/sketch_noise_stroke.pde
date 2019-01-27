//ffmpeg convert frames to video
// ffmpeg -r 30 -f image2 -s 400x400 -i frame-%04d.tif -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4

float sizeNoise = 0.0;
float stroke = 0.0;

void setup(){
  size(400, 400);
  noFill();
  colorMode(HSB, 360);
  frameRate(30);
}

void draw() {
  background(0);
  sizeNoise = sizeNoise + 0.01;
  stroke = stroke + 0.1;
  float n = noise(sizeNoise) * width;
  float w = noise(stroke) * random(90, 100);
  strokeWeight(w/2);
  //stroke(w, n, random(128, 255));              //colorMode normal
  stroke(n, 360, 360);
  ellipse(width/2, height/2, n, n);
  println(n);
  
  //saveFrame("frame-####.tif"); 
  
  if(frameCount > 500){
    noLoop();
  }
}