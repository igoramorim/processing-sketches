// https://en.wikipedia.org/wiki/Lorenz_system

import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 2.5;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  
  float dt = 0.01;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector(x, y, z));
  
  //translate(width/2, height/2);
  translate(0, 0, -80);
  scale(5);
  stroke(255);
  noFill();
  
  beginShape();
  for (PVector v : points) {
    vertex(v.x, v.y, v.z);  
  }
  endShape();
  
  //println(x, y, z);
}
