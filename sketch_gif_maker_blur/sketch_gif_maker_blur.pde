// tutorial source: https://necessarydisorder.wordpress.com/2018/07/02/getting-started-with-making-processing-gifs-and-using-the-beesandbombs-template/

int[][] result;
float t, c;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3), ia = atan(sqrt(.5));

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}

void draw() {

  if (!recording) {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  } else {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }

    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();

    saveFrame("output/fr###.png");
    println(frameCount,"/",numFrames);
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////
 
int samplesPerFrame = 5;
int numFrames = 75;        
float shutterAngle = 1.0;
 
boolean recording = true;
 
int n = 100;
 
class Thing{
  float size = random(1,5);
  float offset = random(0, 0.6);
  float theta;
   
  Thing(float theta_){
    theta = theta_;
  }
   
  void show(){
    stroke(255,200);
    strokeWeight(size);
    float radius = 150 + 80*sin(TWO_PI*t + offset);
    float x = 250 + radius*cos(theta);
    float y = 250 + radius*sin(theta);
    point(x, y);
  }
}
 
Thing[] array = new Thing[n];
 
void setup(){
  size(500, 500, P3D);
  result = new int[width*height][3];
   
  for(int i=0;i<n;i++){
    float theta = TWO_PI*i/n;
    array[i] = new Thing(theta);
  }
}
 
void draw_(){
  background(0);
 
  for(int i=0;i<n;i++){
    array[i].show();
  }
}
