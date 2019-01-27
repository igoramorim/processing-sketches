int num = 10;
float radius = 50;
float time = 0;

void setup(){
 size(400, 400);
 noStroke();
 //noFill();
 colorMode(HSB, 360, 100, 100);
 println(TWO_PI);
}

void draw(){
 background(#1E1E1E);
 translate(width/2, height/2);
 
 for(int i = 0; i < num; i++){
   pushMatrix();
   
   rotate(TWO_PI / num * i);
   fill(360 / num * i, 100, 100, 100);
   float x = map(sin(time) * 5, -1, 1, 10, 15);
   println(x);
   ellipse(radius/2 + x, 0, radius, radius);
   
   popMatrix();
 }
 time += 0.1;
}