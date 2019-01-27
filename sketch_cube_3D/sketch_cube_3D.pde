float time = 0;
float c = 0;
int n = 10;
float offset = 20;
float base = 110;

MyBox boxes[] = new MyBox[n * n * n];
int counter = 0;

float t;

void setup() {
    size(400, 400, P3D);
    noFill();
    frameRate(24);
    
    //colorMode(HSB, 360, 100, 100);
    
    for (int i = 0; i < boxes.length; i++) {
        boxes[i] = new MyBox();
    }
    
    for (float z = 0; z < n; z++) {
        for (float x = 0; x < n; x++) {
            for (float y = 0; y < n; y++) {
                float xx = base + x * offset;
                float yy = base + y * offset;
                float zz = -base + z * offset;
                boxes[counter].position(xx, yy, zz);
                counter++;
            }
        }
    }
}

void draw() {
    background(0);
    
    translate(-5, 350, 50 + sin(time) * 20);
    //translate(-5, 350, 50);
    rotateX(radians(45));
    translate(0, -350, 100);
    
    //translate(-120, 120, 150);
    //rotateX(radians(45));
    //rotateY(radians(45));
    //rotateZ(radians(45));
    //translate(0, -550, 100);
    
    lights();
    
    counter = 0;
    for (float z = 0; z < n; z++) {
        for (float x = 0; x < n; x++) {
            for (float y = 0; y < n; y++) {
                boxes[counter].update(x, y, z, time);
                boxes[counter].display();
                counter++;
            }
        }
    }
    
    //time += 0.05;
    time += 0.3;
  
  //saveFrame("frame-####.tif");
  //println(frameCount/frameRate);
  if(frameCount/frameRate > 10){
    noLoop();
  }
}