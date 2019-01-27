class MyBox {
    
    float x, y, z;
    float size;
    color col;
    color strokeCol;
    
    MyBox() {
        x = 0;
        y = 0;
        z = 0;
        size = 15;
    }
    
    void position(float tx, float ty, float tz) {
        x = tx;
        y = ty;
        z = tz;
    }
    
    void update(float tx, float ty, float tz, float time) {
        //x = x + sin((ty - tx) + time);
        //y = y + cos((tx - ty) + time);
        //z = z + sin((tx - ty) + time);
        
        x = x + sin((tx - ty) + cos(ty - tz) + time);
        y = y + sin((ty - tz) + cos(tz - tx) + time);
        z = z + sin((tz - tx) + cos(tx - ty) + time);
        size = size + sin((tx+ty+tz) + time);
        
        //size = sin((tx+ty+tz) + time / 3) * 15;
        
        if (tx % 2 == 0) {
            col = color(22, 120, 240);
            strokeCol = color(22, 240, 160);
        } else {
            col = color(22, 240, 160);
            strokeCol = color(22, 120, 240);
        }
    }
    
    void display() {
        //noFill();
        fill(col, 200);
        stroke(strokeCol);
        pushMatrix();
        translate(x, y, z);
        box(size);
        popMatrix();
    }
}