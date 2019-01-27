// ffmpeg -r 60 -f image2 -s 400x400 -i frame-%04d.tif -vcodec libx264 -crf 5  -pix_fmt yuv420p sine_cos_3.mp4

int r = 30;
float y = 0;
float mult = 25;

void setup() {
  size(400, 400);
  stroke(255, 0, 155);
  //noFill();
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw() {

  background(30);

  translate(width/2 - 5*r, height/2);

  //PI * 2 = 1 circulo completo = 360 graus
  for (float t = 0; t < 10; t++) {
    for (float angle = 0; angle < PI; angle += 0.5) {
      fill(360 / 5 * angle, 100, 100, 100);    
      ellipse(r*t + angle * cos(y) * 10, sin(-angle - y) * 50, r, r);
    }
  }
  y += 0.1;
  println(frameRate);
  //saveFrame("frame-####.tif"); 
  
  if(frameCount > 300){
    noLoop();
  }
}