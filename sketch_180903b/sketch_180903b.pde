float angle = 0;
float n = 12;
float slice = PI * 2 / n;
float radius = 15;
float distance = 200;
float time = 0;

void setup() {
    size(600, 600);
    frameRate(30);
}

void draw() {
    background(255);
    //fill(255, 10);
    //rect(0, 0, width, height);
    
    //translate(width/2, height/2);
    
    //float nTotal = map(mouseX, 0, width, 1, 360);
    //println(nTotal);
    
    //for (int i = 0; i < n; i++) {
    //    angle = i * slice;
        
    //    float x = cos(angle)*distance;
    //    float y = sin(angle)*distance;
        
    //    float noise = noise(frameCount * 0.05);
    //    println(noise);
    //    ellipse(x + cos(time) * 50, y + sin(time) * 50, radius, radius);
    //}
    
    for (int i = 0; i < n; i++) {
        float x = (width/2) + cos(time + (i * 60) + cos(time)) * 150;
        float y = (height/2) + sin(time + (i * 60) + sin(time)) * 150;
        
        ellipse(x, y, 10, 10);
    }
    
    //ellipse((width/2) + cos(time + 100) * 150, (height/2) + sin(time + 100) * 150, 10, 10);
    
    time += 0.05;
}