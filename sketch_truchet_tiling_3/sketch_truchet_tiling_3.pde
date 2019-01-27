
Tile[] tiles = new Tile[50];
int size = 50;
float t = 0;
float speed = 0.1;

void setup() {
    size(400, 400);
    frameRate(5);
    //noLoop();
}

void draw() {
    background(0);

    for (int i = 0; i < width/size; i++) {
        for (int j = 0; j < height/size; j++) {
            int rand = int(random(2));
            float s = sin(t);
            float m = map(s, -1, 1, 20, 50);
            //println(s, m);
            tiles[i] = new Tile((size/2) + i*size, (size/2) + j*size, m, rand);
            tiles[i].display();
        }
    }
    
    t += speed;
    
    // saveFrame("frame-####.tif");
    if(frameCount > 150){
     noLoop();
   }
    
}

class Tile {
    
    int x;
    int y;
    float size;
    int type;
    
    Tile(int x, int y, float size, int type) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.type = type;
    }
    
    void display() {
        noFill();
        strokeWeight(2);
        rectMode(CENTER);
        //rect(x, y, size, size); // for debug purposes
        
        stroke(random(255), random(255), 255);
        //println(x, y);
        
        if (type == 1) {
            arc(x-(size/2), y-(size/2), size, size, 0, HALF_PI);
            arc(x+(size/2), y+(size/2), size, size, PI, 3*HALF_PI);
        } else {
            arc(x+(size/2), y-(size/2), size, size, HALF_PI, PI);
            arc(x-(size/2), y+(size/2), size, size, PI+HALF_PI, TWO_PI);
        }    
    }
}