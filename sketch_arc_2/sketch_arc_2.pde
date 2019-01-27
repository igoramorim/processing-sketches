float time = 0;
float speed = 0;
int size = 10;
int n = 36;
int c = 25;
float lim = 0;

void setup(){
 size(400, 400);
 noFill();
 stroke(255, 0, 150);
 colorMode(HSB, 360, 100, 100);
 strokeWeight(10);
}

void draw(){
  background(#1E1E1E);
  
  translate(width/2, height/2);
  
  lim = map(speed, 0, 3, 0, TWO_PI);
  //println(lim);
  
  if(lim >= TWO_PI){
    speed = 0;
    c += 25;
    println("cor: " + c);
    if(c > 350){
      c = 50;
      //noLoop();
    }
  }
  
  for(int i = 1; i < n; i++){
    stroke(c / n * i, 100, 100, 100);
    arc(0, 0, size*i, size*i, 0, lim);
  }
    
  speed += 0.05;
}