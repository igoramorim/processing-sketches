int tileSize = 41;
color color1 = color(215, 190, 0);
color color2 = color(0, 165, 215);

void setup() {
    size(820, 615);
    noStroke();
}

void draw() {
    for (int x = 0; x < width; x += tileSize) {
        for (int y = 0; y < height; y += tileSize) {
            int r = int(random(2));
            //println(r);
            if (r == 0) {
                fill(color1);
            } else {
                fill(color2);    
            }
            rect(x, y, tileSize, tileSize);
        }
    }
    
    for (int x = 0; x < width + 1; x += tileSize) {
        for (int y = 0; y < height + 1; y += tileSize) {
            //println(x + " + " + y + " = ",x+y);
            if ((x + y) % 2 == 0) {
                fill(color1);
            } else {
                fill(color2);    
            }
            ellipse(x, y, tileSize, tileSize);
        }
    }
    
    noLoop();
}

void mouseReleased() {
    loop();
    color1 = color(random(255), random(255), random(255));
    color2 = color(random(255), random(255), random(255));
}