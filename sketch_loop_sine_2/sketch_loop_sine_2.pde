float diameter = 100; 
float angle = 0;

void setup() {
  size(400, 400);
  colorMode(HSB, 360);
  stroke(0, 0, 255);
  strokeWeight(3);
  noFill();
  frameRate(30);
}

void draw() {
  
  background(0);
  
  float d2 = (sin(angle + PI/2) * diameter) - diameter;
  float d3 = (sin(angle + PI/2) * diameter) + diameter;
  
  if(frameCount % 53 == 0){
    stroke(random(360), 360, 360);
  }
  
  for(float x = diameter; x < width; x += diameter){  
    ellipse(x, diameter, d2, d3);
  }
  
  for(float x = diameter; x < width; x += diameter){  
    ellipse(x, diameter*2, d3, d2);
  }
  
  for(float x = diameter; x < width; x += diameter){  
    ellipse(x, diameter*3, d2, d3);
  }
  
  angle += 0.06;
  
  //saveFrame("frame-####.tif"); 
  
  if(frameCount > 530){
    noLoop();
  }
  
}