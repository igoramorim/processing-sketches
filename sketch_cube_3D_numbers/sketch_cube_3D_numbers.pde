int n = 5;
float t = 0;
float speed = 0.05;
float textSize = 32;
float offset = 70;

void setup() {
    size(480, 480, P3D);
    colorMode(HSB, 360, 100, 100);
    frameRate(60);
}

void draw() {
    background(30);
    
    //translate(0, 250, 0);
    //rotateX(radians(45));
    //rotateY(radians(45));
    //rotateZ(radians(45));
    //translate(0, -200, 0);
    
    translate(width/2, height/2, -500);
    rotateX(radians(frameCount));
    rotateY(radians(frameCount));
    //rotateZ(radians(frameCount));
    
    //rotateX(radians(sin(t) * 45));
    //rotateY(radians(cos(t) * 45));
    //rotateZ(radians(sin(t) * 45));
    
    textSize(textSize);
    //float col = map(sin(t), -1, 1, 0, 360);
    fill(200, 100, 100);
    
    int counter = 0;
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                text(counter, i*offset, j*offset, k*-offset);
                println(" k: " + k + " i: " + i + " j: " + j);
                counter++;
            }
            println("------------------------");
        }
    }
    
    t += speed;
    
    // saveFrame("frame-####.tif");
    float seconds = (frameCount/frameRate);
    // println(seconds);
    //if(seconds > 10){
    //    noLoop();
    //}
}