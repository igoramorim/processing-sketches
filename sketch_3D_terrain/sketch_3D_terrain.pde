int cols;
int rows;
int size = 20;
int w = 1200;
int h = 900;
float [][] terrain;
float flying = 0;


void setup() {
    size(600, 600, P3D);
    cols = w / size;
    rows = h / size;
    
    terrain = new float[cols][rows];
    
}

void draw() {
    background(0);
    stroke(255);
    noFill();
    
    flying -= 0.1;
    
    float yoff = flying;
    for (int y = 0; y < rows; y++) {
        float xoff = 0;
       for (int x = 0; x < cols; x++) {
           terrain[x][y] = map(noise(xoff, yoff), 0, 1, -70, 70);
           xoff += 0.2;
       }
       yoff += 0.2;
    }
    
    translate(width/2, height/2);
    rotateX(PI/3);
    
    translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
        beginShape(TRIANGLE_STRIP);
        for (int x = 0; x < cols; x++) {    
             vertex(x*size, y*size, terrain[x][y]);
             vertex(x*size, (y+1)*size, terrain[x][y+1]);
        }
        endShape();
    }
}