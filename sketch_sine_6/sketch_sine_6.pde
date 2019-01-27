float time = 0;

void setup(){
  size(400, 400);
  background(0);
  //noStroke();
  stroke(255);
  strokeWeight(4);
  fill(255);
}

void draw(){
  background(30);
  
  translate(0, 100);
  for(float i = 0; i < width; i += 0.1){
    point(i * 50, sin(i) * sin(time * i) * 5);
  }
  
  translate(0, 100);
  for(float i = 0; i < width; i += 0.1){
    point(i * 50, sin(i) * sin(time/2 * i) * 15);
  }
  
  translate(0, 100);
  for(float i = 0; i < width; i += 0.1){
    point(i * 50, sin(i) * sin(time * i) * 10);
  }

  time += 0.1;
}