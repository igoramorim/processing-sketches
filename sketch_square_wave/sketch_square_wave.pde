float rot = 0;
float lines = 15;
float col = 15;
float square_size = 15;
float offset = 25;
float x = 0;
float y = 0;
float reverse = 1;

void setup(){
  size(400, 400);
  background(0);
  noStroke();
  fill(200);
  //rectMode(CENTER);
  //frameRate(30);
  colorMode(HSB, 360, 100, 100);
}

void draw_square(float x, float y, float size, float rot, float r, float g, float b){
  translate(x, y);
  rotate(rot);
  fill(r, g, b);
  rect(0, 0, size, size);
  resetMatrix();
}

void draw(){
  background(30);
 
  x = 0;
  while(x < col){
    y = 0;
    while(y < lines){ 
      float c = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      float h = map(c, 0, 0.8, 0, 360);
      println(square_size + c);
      draw_square(25 + x * offset, 25 + y * offset, square_size * sin(rot/5), rot + x - y, 0, 100, 100);
      y += 1;
    }
    x += 1;
  }
  rot += 0.05;
  
  if(frameCount % 100 == 0){
    reverse *= -1;
  }
}