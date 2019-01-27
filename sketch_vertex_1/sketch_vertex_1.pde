float time = 0;
float s = 30;
float x = 30;
float y = 20;
float cBackground = 255;
float cShape = 0;

void setup(){
 size(400, 400);
 noStroke();
 fill(cShape);
}

void draw(){
  background(cBackground);
  
  float sx = cos(time) * s;
  
  for(int i = 0; i < width; i+=100){
    for(int j = 0; j < height; j += 80){
      beginShape();
        vertex(x + i + sx, y+j); 
        vertex(x*2 + i, y+j);    
        vertex(x*2 + i + sx, y*3+j); 
        vertex(x + i, y*3+j);        
      endShape(CLOSE);
    }
  } 
  time += 0.05;
  
  if(frameCount % 63 == 0){
    cBackground = 255 - cBackground;
    cShape = 255 - cShape;
    fill(cShape);
  }
}