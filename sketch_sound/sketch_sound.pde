// Note: this program runs only in the Processing IDE, not in the browser

import ddf.minim.*;

Minim minim;
AudioSample music;

int x = 130;
int y = 100;
int dx = 5;
int dy = 5;

void setup() {
  //size(400, 300);
  fullScreen();
  fill(255, 0, 0);
  noStroke();
  smooth();
  colorMode(HSB, 360, 100, 100);

  minim = new Minim(this);
  music = minim.loadSample("Redline.mp3", 2048); // 2048
  music.trigger();
}
void draw() {
    //background(0);
    fill(0, 50);
    stroke(0);
    rect(0, 0, width, height);
    
    for (int i = 0; i < music.bufferSize() - 1; i++) {
        float x1 = map(i, 0, music.bufferSize(), 0, width);
        float x2 = map(i+1, 0, music.bufferSize(), 0, width);
        noFill();
        float amp1 = music.mix.get(i);
        float amp2 = music.mix.get(i+1);
        float col = map(amp1, -1, 1, 0, 360);
        stroke(col, 100, 100);
        line(x1, (height/2) - amp1*50, x2, (height/2) - amp2*50);
        //println(water.mix.get(i)*50);
        
    }
    //ellipse(width/2, height/2, music.mix.level()*100, music.mix.level()*100);
    
    
    
}

void stop() {
  music.close();
  minim.stop();
  super.stop();
}