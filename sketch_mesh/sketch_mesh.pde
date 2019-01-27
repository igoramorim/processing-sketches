int totalParticles = 50;
float theta;
float speed = 0.005;
ArrayList<Triangle> triangles;
Particle[] particles = new Particle[totalParticles];


void setup() {
  size(400, 400);
  noStroke();
  fill(100, 50, 180, 100);
  stroke(100, 50, 200, 255);
  frameRate(30);
  createParticles();
}

// populate the particles array
void createParticles() {
    for (int i = 0; i < totalParticles; i++) {
           particles[i] = new Particle();
    }
}

void draw() {
    background(30);
    //fill(0, 100);
    //rect(0, 0, width, height);
    
    triangles = new ArrayList<Triangle>();
    Particle p1, p2;
    
    // particles move around the screen
    for (int i = 0; i < totalParticles; i++) {
        particles[i].show();
        particles[i].move();
    }

    // add neighbors particles depending on the distance
    for (int i = 0; i < totalParticles; i++) {
        p1 = particles[i];
        p1.neighbors = new ArrayList<Particle>();
        p1.neighbors.add(p1);
        for (int j = i+1; j < totalParticles; j++) {
            p2 = particles[j];
            float d = PVector.dist(p1.pos, p2.pos);
            if (d > 0 && d < Particle.MAX_DIST) {
                p1.neighbors.add(p2);
            }
        }
        if (p1.neighbors.size() > 1) {
            //println(p1.neighbors.size());
            addTriangles(p1.neighbors);
        }
    }
    drawTriangles();
    
    //saveFrame("frame-####.tif");
    println(frameCount/frameRate);
    
    if(frameCount/frameRate > 15){
        noLoop();
    }
}

void drawTriangles() {
    fill(100, 50, 180, 100);
    beginShape(TRIANGLES);
        for (int i = 0; i < triangles.size(); i++) {
            Triangle tri = triangles.get(i);
            tri.show();
        }
    endShape();
}

void addTriangles(ArrayList<Particle> neighbors) {
    int neighborsSize = neighbors.size();
    if (neighborsSize > 2) {
        for (int i = 1; i < neighborsSize-1; i++) {
            for (int j = i+1; j < neighborsSize; j++) {
                triangles.add(new Triangle(neighbors.get(0).pos,
                                           neighbors.get(i).pos,
                                           neighbors.get(j).pos)
                );
            }
        }
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
    float maxSpeed = 3;
    final static float MAX_DIST = 50;
    PVector speed = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
    PVector acc = new PVector(0, 0);
    PVector pos;
    // neighbors are the particles that are close (dist < MAX_DIST) to another
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