float nx, ny;
float nStep = 0.007;
float s1 = 1, s2 = 1;
int h = 0, offSet = 100 ; 

void setup() {
  size(1000, 300);
  //colorMode(HSB, 360, 100, 100);
  fbm();
}

void fbm() {
  nx = 0;
  float c = 0;
//  color to = color(#0A1A02);
//  color from = color(#F8FAC2);
  color to = color(#250846);
  color from = color(#F8FAC2);
  for (int x = 0; x<width; x++) {
    ny = 0;
    for (int y = 0; y<height; y++) {
      float n = noise(nx, ny);
      float f = n;
      n*= s1;
      float o = noise(nx+n, ny+n);
      f += o;
      o *= s2;
      float p = noise(nx+o, ny+n);
      f+=p;
      c = map(f,0.5,2.5,0,255);
      //c = map(f, 0.5, 3, 0,360);
      //fill(c,255);
      
      float l = map(f,0.5,2.5,0,1);
      color col = lerpColor(from, to,l);
      fill(col,150);
      noStroke();
      rect(x, y, 1, 1);
      ny += nStep;
    }
    nx+=nStep;
  }
  
  println("ok");
}

void mouseReleased() {
  noiseSeed((long)random(123456));
  s1 = 1;
  s2 = 1;
  fbm();
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            println("up");
            saveFrame("image-###.png");
            s1++; 
            s2++;
        }
        if (keyCode == DOWN) {
            s1--; 
            s2--;
        }    
    fbm();
    }
}