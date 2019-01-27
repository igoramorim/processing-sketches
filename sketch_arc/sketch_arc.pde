float time = 0;
float size = 50;

void setup(){
 size(400, 400);
 noFill();
 stroke(255, 0, 150);
 strokeWeight(3);
}

void draw(){
  background(#1E1E1E);
  
  translate(width/2, height/2);
  
  float st = sin(time) * 2;
  println(st);
  
  for(int i = 0; i < TWO_PI; i++){
    arc(0, 0, size * i / 2, size * i / 2, 0, QUARTER_PI + i);
    rotate(st);  
  }
  
  time += 0.01;
}