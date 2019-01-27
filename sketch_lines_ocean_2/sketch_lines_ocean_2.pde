float time = 0;
float offSet = 10;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  float x = 0;

  while (x < width) {
    line(x, offSet + 80 * noise(x / 100, time), x, height);
    x = x + 1;
  }
  
  time = time + 0.02;
  
  if(time >= 23){
    offSet -= 0.3;
  }else{
    offSet += 0.3;
  }
  
  println(time);
}