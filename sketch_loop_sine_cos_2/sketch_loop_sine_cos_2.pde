float angle = 0;
float speed = 0.01;
//the radius of the ellipse movement
float radius = 100;
float numObjects = 6;
float slice = PI * 2 / numObjects;
color a = color(255, 0, 155);
color b = color(0, 200, 255);
color[] colors = {a, b};
int counter = 0;

void setup() {
  size(400, 400);
  stroke(255);
  //noFill();
  noStroke();
  //frameRate(24);
}

void draw() {
  //println(frameRate);
  //comment the background to draw continuous ellipses
  background(30);

  translate(width/2, height/2);
  
  for (int i = 0; i < numObjects; i += 1) {
    angle = i * slice;
    
    if(counter > colors.length - 1){
      counter = 0;
    };
    
    fill(colors[counter]);
    
    float x = sin(angle - speed) * radius;
    
    ellipse(cos(angle + speed) * radius, sin(angle - speed) * radius, 30, 30);
    
    counter += 1;
  }
  speed += 0.05;
  
  //saveFrame("frame-####.tif"); 
  
  //if(frameCount > 300){
  //  noLoop();
  //}
}