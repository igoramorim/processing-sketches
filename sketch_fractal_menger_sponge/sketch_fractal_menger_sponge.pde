float a = 0;
Box b;
ArrayList<Box> sponge;

void setup() {
  size(400, 400, P3D);
  
  Box b = new Box(0, 0, 0, 200);
  sponge = new ArrayList<Box>();
  sponge.add(b);
}

void mousePressed() {
   ArrayList<Box> next = new ArrayList<Box>();
   for (Box b : sponge) {
     ArrayList<Box> newBoxes = b.generate();
     next.addAll(newBoxes);
   }
   sponge = next;
}

void draw() {
  background(51);
  //stroke(255);
  noFill();
  lights();
  
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.5);
  rotateZ(a*0.5);
  
  for (Box b : sponge) {
    b.show();
  }
  
  a += 0.01;
}

class Box {
  PVector pos;
  float r;
  
  Box(float x, float y, float z, float r) {
     pos = new PVector(x, y, z);
     this.r = r;
  }
  
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float newR = r/3;
          if (sum > 1) {
            Box b = new Box(pos.x + x * newR,
                            pos.y + y * newR,
                            pos.z + z * newR,
                            newR
            );
            boxes.add(b);  
          }
        }
      }  
    }
    return boxes;
  }
  
  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(200);
    box(r);
    popMatrix();
  }
}
