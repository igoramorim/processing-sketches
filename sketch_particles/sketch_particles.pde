ArrayList<Triangle> triangles;
int totalParticles = 100;
Particle[] particles = new Particle[totalParticles];
float theta;
float speed = 0.005;

void setup() {
  size(400, 400);
  noStroke();
  fill(100, 50, 180, 100);
  stroke(100, 50, 200, 255);
  createParticles();
}

void createParticles() {
    for (int i = 0; i < totalParticles; i++) {
           particles[i] = new Particle();
    }
}

void draw() {
    background(50);
    triangles = new ArrayList<Triangle>();
    
    for (int i = 0; i < totalParticles; i++) {
        particles[i].show();
        particles[i].move();
    }

}

class Triangle {
    PVector a, b, c;
    
    Triangle(PVector p1, PVector p2, PVector p3) {
        a = p1;
        b = p2;
        c = p3;
    }
    
    public void show() {
        vertex(a.x, a.y);
        vertex(b.x, b.y);
        vertex(c.x, c.y);
    }
}

class Particle {
    float rad = 4;
    float bounce = -1;
    float maxSpeed = 2;
    float maxDist = 50;
    PVector speed = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
    PVector acc = new PVector(0, 0);
    PVector pos;
    ArrayList<Particle> neighbors;
    
    Particle() {
        pos = new PVector(random(width), random(height));   
    }
    
    public void move() {
        pos.add(speed);
        
        if (pos.x < 0) {
            pos.x = 0;
            speed.x *= bounce;
        } else if (pos.x > width) {
               pos.x = width;
               speed.x *= bounce;
        }
        if (pos.y < 0) {
            pos.y = 0;
            speed.y *= bounce;
        } else if (pos.y > height) {
               pos.y = height;
               speed.y *= bounce;
        }
    }
    
    public void show() {
        fill(255, 14);
        ellipse(pos.x, pos.y, rad, rad);
    }
}