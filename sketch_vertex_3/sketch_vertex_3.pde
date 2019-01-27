float time = 0;
float s = 30;
float x = 30;
float y = 20;
float cBackground = 255;
float cShape = 0;
float speed = 0;

void setup(){
 size(400, 400);
 noStroke();
 fill(cShape);
}

void draw(){
  background(cBackground);
  
  float sx = cos(time) * s;
  float sy = sin(time) * s;
  
  for(int i = 0; i < width; i+=100){
    for(int j = 0; j < height; j += 80){
      beginShape();
        vertex(x + i + sx, y+j + sy); 
        vertex(x*2 + i, y+j);    
        vertex(x*2 + i + sx, y*3+j + sy); 
        vertex(x + i, y*3+j);        
      endShape(CLOSE);
    }
  }
  
  speed += 0.005;
  float ss = sin(speed);
  time += ss/5;
  
  //saveFrame("frame-####.tif"); 
  
  if(frameCount > 1250){
    noLoop(); 
  }
  
}