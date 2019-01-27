float tx = 0;
float ty = 100;

void setup() {
    size(400, 400);
}

void draw() {
    fill(255, 50);
    rect(0, 0, width, height);
    float x = map(noise(tx), 0, 1, 0, width);
    float y = map(noise(ty), 0, 1, 0, height);
    
    ellipse(x, y, 20, 20);
    
    tx += 0.01;
    //ty += 0.01;
}