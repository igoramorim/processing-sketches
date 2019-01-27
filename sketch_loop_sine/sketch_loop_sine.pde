float diameter = 100; 
float angle = 0;

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  stroke(100, 100, 100);
  strokeWeight(2);
  noFill();
}

void draw() {
  
  background(0);
  
  float d2 = 5 + (sin(angle + PI/2) * diameter) + diameter;
  float d3 = 5 + (sin(angle + PI/2) * diameter) - diameter;
  
  for(float x = diameter; x < width; x += diameter){  
    for(float y = diameter; y < height; y += diameter){
      ellipse(x, y, d2, d3);
    }
  }
  
  angle += 0.03;
  
  if(frameCount % 120 == 0){
    stroke(random(100), 100, 100);  
  }
  
}