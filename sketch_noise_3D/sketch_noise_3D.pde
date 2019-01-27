float tx = 0;
float ty = 10;
float tz = 20;

void setup() {
    size(400, 400, P3D);
}

void draw() {
    background(0);
    
    //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    
    //pushMatrix();
    //translate(width/2, height/2, -100);
    //noFill();
    //stroke(255);
    //sphere(150);
    //popMatrix();
    
    
    
    float x = map(noise(tx), 0, 1, 0, width);
    float y = map(noise(ty), 0, 1, 0, height);
    float z = map(noise(tz), 0, 1, 0, width);
    
    println("x: " + x + "\ty: " + y + "\tz: " + z);
    
    tx += 0.01;
    ty += 0.01;
    tz += 0.01;
}