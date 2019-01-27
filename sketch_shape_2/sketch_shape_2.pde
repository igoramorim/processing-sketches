int num = 500, frms = 180;
float theta;

void setup() {
  size(540, 540, P2D);
  smooth(8);
}

void draw() {
  background(34);
  translate(width/2, height/2);
  for (int i=0; i<16; i++) {
    int f = i%2==0?238:34;
    int dir = i%2==0?1:-1;
    myShape(1, f, dir, 4+i%4,66-4*i);
  }
  theta += TWO_PI/frms;
}

void myShape(int s, int f, int dir, int n, int v) {
  if (s == 0) {
    noStroke();
  } else {
    stroke(34);
  }
  fill(f);
  beginShape();
  for (int i=0; i<num; i++) {
    float angle = TWO_PI/num*i;
    float minV = map(sin(dir*theta+dir*angle*3), -1, 1, 20, width*.25);
    float d = map(sin(angle*n), -1, 1, minV, width*.25+v);
    float x = cos(angle)*d;
    float y = sin(angle)*d;
    vertex(x, y);
  }
  endShape(CLOSE);
}