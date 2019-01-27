int amount = 200;
float[] x = new float[amount];
float[] y = new float[amount];
float[] z = new float[amount];
float theta = 0;
float speed = 0.1;


void setup() {
  size(500, 500, P3D);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i<amount; i++) {
    x[i] = int(random(-30, 30));
    y[i] = (i * -2) + int(random(-30, 30));
    z[i] = i * 2;
  }
}

void draw() {
  //background(0);
  fill(0, 10);
  rect(0, 0, width, height);
  
  translate(width/2, height - 20);
  
  rotateY(frameCount / 40.0);
  
  //box(300);
  for(int i = 0; i < amount; i++) {
    float s = sin(theta) * 3;
    float c = cos(theta) * 5;
    point(x[i], y[i] + s, z[i]);
  }
  
  theta += speed;
}