int offset = 25;
int size = 5;
float theta = 0;
float speed = 0.05;

ArrayList<PVector> positions;

void setup() {
  size(400, 400);
  background(0);
  frameRate(30);
  noFill();
  stroke(255, 100);
  strokeWeight(5);
  ellipseMode(CENTER);
  positions = new ArrayList<PVector>();
}

void draw() {
  background(0);
  
  //for(PVector pos : positions) {
  //    println(pos);
  //    line(newPos.x, newPos.y, pos.x, pos.y);
  //}
  //positions.add(newPos);
  
  for (int i = offset; i < width; i += offset) {
      for (int j = offset; j < height; j += offset) {
          float s = sin(theta);
          float x = i;
          float y = j;
          PVector newPos = new PVector(x, y);
          println(newPos);
          point(newPos.x, newPos.y);
      }
  }
  
  theta += speed;
}