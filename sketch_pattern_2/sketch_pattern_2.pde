int n = 20;
int size = 30;
color[] colors = new color[n];
float tx = 0;
float ty = 50;

void setup() {
    size(600, 600);
    colorMode(HSB, 360, 100, 100);
    noStroke();
    frameRate(3);
    //noLoop();
    
    for (int i = 0; i < colors.length; i++) {
        colors[i] = color(40, 100, i*5);
    }
}

void draw() {
    
    background(255);
    
    for (int x=-30; x<width; x+=30) {
        for (int y=-30; y<height; y+=30) {
            float c = random(colors.length);
            fill(colors[int(c)]);
            float xNoise = noise(tx * x);
            float yNoise = noise(ty * y);
            //rect(x+size, y+size, size, size);
            ellipse(x+size * xNoise, y+size * yNoise, size*2, size*2);
        }
    }
    
    tx += 0.01;
    ty += 0.01;
}

void mouseClicked() {
    redraw();
}