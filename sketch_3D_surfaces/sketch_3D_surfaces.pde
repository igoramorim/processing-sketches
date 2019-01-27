int n = 20;
MyBox boxes[] = new MyBox[n * n];
float t = 0;
float speed = 0.05;
int counter = 0;
float zPos = -114;

void setup() {
    size(480, 480, P3D);
    colorMode(HSB, 360, 100, 100);
    frameRate(60);
    
    for (int i = 0; i < boxes.length; i++) {
        boxes[i] = new MyBox();
    }
    
    for (int i = 12; i <= width - 12; i += 24) {
        for (int j = 12; j <= width - 12; j += 24) {
            boxes[counter].position(i, j);
            counter++;
        }
    }
}

void draw() {
    background(30);
    
    translate(0, 250, 0);
    rotateX(radians(45));
    translate(0, -450, 0);
    
    lights();
    
    int c = 0;
    for (int i = 0; i < n; i ++) {
        for (int j = 0; j < n; j ++) {
            boxes[c].update(i, j);
            boxes[c].display();
            c++;
        }
    }
    
    t += speed;
    
     //saveFrame("frame-####.tif");
    float seconds = (frameCount/frameRate);
    //println(seconds);
    if(seconds > 10){
        noLoop();
   }
}

class MyBox {
    
    float x, y, z, an;
    float hue;
    
    MyBox() {
        x = 0;
        y = 0;
    }
    
    void position(float tx, float ty) {
        x = tx;
        y = ty;
        z = -100;
        an = 0;
        //println(tx, ty);
    }
    
    void update(float ux, float uy) {
        
        //float s = sin((ux - uy) + t);
        //float s = sin((ux - uy) + sin(t));
        //float s = sin((ux - uy) + sin(uy - ux) + t);
        //float s = sin((ux - uy) + cos(ux + t) + t);
        
        //float d = sqrt(ux * ux + uy * uy);
        //float s = sin(PI * (1 * d - t));
        
        //float s = sin(ux + t) + sin(uy + t);
        float s = sin(ux + uy + t) + sin(ux + uy + t * 0.5) + sin(ux + sin(t) * 3);
        
        hue = map(s, -1, 1, 150, 230);
        
        z = -100 + s * 10;
        // println(s);
    }
    
    void display() {
        noStroke();
        fill(hue, 100, 100);
        pushMatrix();
        translate(x, y, z);
        box(22);
        popMatrix();
    }
}