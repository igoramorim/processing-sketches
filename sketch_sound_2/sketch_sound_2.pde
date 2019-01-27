import ddf.minim.*;

Minim minim;
AudioPlayer music;

int cols;
int rows;
int size = 20;
int w = 1200;
int h = 900;
float [][] terrain;
float flying = 0;
float ampSound = 10;
float videoLength;

void setup() {
    //fullScreen(P3D);
    size(600, 600, P3D);
    cols = w / size;
    rows = h / size;
    colorMode(HSB, 360, 100, 100);
    frameRate(60);
    
    terrain = new float[cols][rows];

    minim = new Minim(this);
    music = minim.loadFile("Retro_Funk_1.wav", 2048); // 2048
    //music = minim.loadFile("Future_Trap_1.wav", 2048); // 2048
    videoLength = music.length();
    music.loop();
}

void draw() {
    background(0);
    stroke(178, 100, 100, 100);
    
    flying -= 0.1;
    
    float yoff = flying;
    for (int y = 0; y < rows; y++) {
        float xoff = 0;
       for (int x = 0; x < cols; x++) {
           float left = music.left.level() * ampSound;
           float right = music.right.level() * ampSound;
           terrain[x][y] = map(noise(xoff, yoff), 0, 1, -70*left, 70*right);
           xoff += 0.2;
       }
       yoff += 0.2;
    }
    
    translate(width/2, height/2);
    rotateX(PI/3);
    
    translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
        beginShape(TRIANGLE_STRIP);
        for (int x = 0; x < cols; x++) {
             //float cor = map(music.position(), 0, music.length(), 0, 360);
             //float cor = map(x, 0, cols, 0, 360);
             float cor = map(terrain[x][y], -30, 70, 260, 300);
             fill(cor, 100, 100);
             vertex(x*size, y*size, terrain[x][y]);
             vertex(x*size, (y+1)*size, terrain[x][y+1]);
        }
        endShape();
    }
    
    //println(floor(videoLength/1000));
    //saveFrame("frames/frame-####.tif");
    if(frameCount/frameRate > (videoLength/1000) + 1){
        noLoop();
   }
    
    //println(music.mix.level());
    //println(music.length() - music.position());
    
    //rect( 0, 0, music.left.level()*width, 100 );
    //rect( 0, 100, music.right.level()*width, 100 );   
    
    //println(frameCount/frameRate);
    
    //showPlayback();
}

void showPlayback() {
    stroke(255);
    float posx = map(music.position(), 0, music.length(), 0, width);
    line(posx, 0, posx, height);
}