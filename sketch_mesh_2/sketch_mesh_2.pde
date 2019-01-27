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
  strokeWeight(2);
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
  
  float x = random(0, width);
  float y = random(0, height);
  PVector newPos = new PVector(x, y);
  
  for (PVector pos : positions) {
      line(newPos.x, newPos.y, pos.x, pos.y);
  }
  positions.add(newPos);
  
  theta += speed;
}