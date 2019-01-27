int offset = 20;
int size = 15;
float theta = 0;
float speed = 0.08;

void setup() {
  size(400, 400);
  background(0);
  frameRate(30);
  stroke(100);
}

void draw() {
  //background(0);
  fill(0, 20);
  rect(0, 0, width, height);

  for(int i = 0; i < width; i += offset){
    for(int j = 0; j < height; j += offset){
      float c = noise(i * 0.005, j * 0.005, 0.5);
      stroke(map(c, 0, 0.5, 0, 100));
      println(c);
      line(i + sin(theta * c) * 10, j, i+size, j+size + cos(theta) * 10);  
    }
  }
  
  theta += speed;
}