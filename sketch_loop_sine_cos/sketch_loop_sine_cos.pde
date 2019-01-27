float angle = 0;
float speed = 0;
//the radius of the ellipse movement
float radius = 100;
float numObjects = 21;
float slice = PI * 2 / numObjects;
color r = color(255, 0, 0);
color g = color(0, 255, 0);
color b = color(0, 0, 255);
color[] colors = {r, g, b};

int counter = 0;

void setup() {
  size(400, 400);
  stroke(255);
  //noFill();
  noStroke();
  blendMode(ADD);
  //frameRate(24);
  smooth();
}

void draw() {

  //comment the background to draw continuous ellipses
  background(30);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < numObjects; i += 1) {
    angle = i * slice;
    
    if(counter > colors.length - 1){
      counter = 0;
    };
    
    fill(colors[counter]);
    //to rotate normally
    //ellipse(cos(angle + speed) * radius, sin(angle + speed) * radius, 30, 30);

    float x = sin(speed) * 150;
    //x is the radius from the center to the ellipse
    ellipse(cos(angle + speed) * x, sin(angle + speed) * x, 30, 30);
    counter += 1;
  }  
  
  speed += 0.03;
  
  //saveFrame("frame-####.tif"); 
  
  if(frameCount > 300){
    noLoop();
  }
  //println(frameRate);
}