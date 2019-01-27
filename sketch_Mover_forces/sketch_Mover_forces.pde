Mover[] movers = new Mover[20];

void setup() {
    size(400, 400);
    frameRate(30);
    for (int i = 0; i < movers.length; i++) {
        movers[i] = new Mover(random(0.1, 5), 30, 30);    
    }
}

void draw() {
    background(255);
    
    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0.0, 1);
    
    for (int i = 0; i < movers.length; i++) {
        movers[i].applyForce(wind);
        movers[i].applyForce(gravity);
        movers[i].update();
        movers[i].checkEdges();
        movers[i].display();    
    }
}

class Mover {
    
    PVector location;
    PVector velocity;
    PVector acceleration;
    float mass;
    
    Mover(float m, float x, float y) {
        mass = m;
        location = new PVector(x, y);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
    }
    
    void update() {        
        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
    }
    
    void display() {
        stroke(0);
        fill(150, 200);
        ellipse(location.x, location.y, mass*16, mass*16);
    }
    
    void applyForce(PVector force) {
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }
    
    void checkEdges() {
        if (location.x > width) {
            location.x = width;
            velocity.x *= -1;
        } else if (location.x < 0) {
            velocity.x *= -1;
            location.x = 0;
        }
        
        if (location.y > height) {
            velocity.y *= -1;
            location.y = height;
        }
    }
    
}