float time = 0;
float c = 0;

void setup() {
  size(400, 400, P3D);
  noFill();
  stroke(255);
  frameRate(24);
}

void draw() {
  background(30);
  
  for (float x=0; x<10; x++) {
    for (float y=0; y<10; y++) {
      pushMatrix();
      
      float z = sin(time)*15;
      float c = constrain(z * 20, 150, 255);
      //println(c);
      stroke(c, 0, 200);
      //                                    100 + x*z
      translate(105 + x * 20, 105 + y * 20, 100 + z*13);
      
      //fill(0, 0, random(150, 255));
      box(z);
      
      popMatrix();
    }
  } 
  time += 0.08;
  
  //saveFrame("frame-####.tif"); 
  
  /*if(frameCount > 100){
    noLoop();
  }*/
}