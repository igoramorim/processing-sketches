int amount = 500;
int[] x = new int[amount];
int[] y = new int[amount];
int[] z = new int[amount];
float theta = 0;
float speed = 0.1;

void setup() {
  size(500, 400, P3D);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(1);
  colorMode(HSB, 360, 100, 100);
  for(int i = 0; i<amount; i++) {
    x[i] = int(random(-150, 150));
    y[i] = int(random(-150, 150));
    z[i] = int(random(-150, 150));
  }
}

void draw() {
  //background(0);
  fill(0, 10);
  rect(0, 0, width, height);
  
  translate(width/2, height/2);
  
  float r = frameCount / 50.0;
  rotateY(r);
  //rotateX(frameCount / 100.0);
  //rotateZ(frameCount / 100.0);
  
  //box(300);
  for(int i = 0; i<amount; i++) {
      float n = noise(i * 0.005, frameCount * 0.05);
      //println(n);
      float s = sin(theta);
      float c = cos(theta);
      float m = map(s, -1, 1, 1, 3);
      strokeWeight(m);
      float col = map(n, 0, 0.8, 0, 360);
      stroke(col, 100, 100);
      point(x[i] + c * 10, y[i] + s * 2, z[i]);
  }
  
  theta += speed;
  
    // saveFrame("frame-####.tif");
    println(frameCount/frameRate);
    
    if(frameCount/frameRate > 15){
        noLoop();
    }
  
}