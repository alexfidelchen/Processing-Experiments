
// Particle creates fire particles. 

class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration = new PVector(0,0);
  float lifespan = 255;
  int fColor = 176;                         //Flame color.  
  float mass  = 1;
  PImage smoke;                             
  
  Particle(PVector l) {
    location = l.copy();
    float velX = (float) generator.nextGaussian()*0.3;
    // Subtract 1 to ensure that the fire moves upwards.
    float velY = (float) generator.nextGaussian()*0.3 - 1;
    velocity = new PVector (velX, velY);
    // The particle is represented with an image of smoke. 
    smoke = loadImage("smoke.png");
    
  }
  
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan = lifespan - 2;
    fColor = fColor - 2;                     // The fire particle becomes redder overtime.  
    /* Reset the acceleration so that the particle moves at a constant 
    velocity. 
    */
    acceleration.mult(0); 
  }
  
  void display() {
  imageMode(CENTER);
  tint(color(234,fColor,0),lifespan);
  image(smoke,location.x,location.y);
  } 
  
  void applyForce(PVector f) {
    PVector force = f.copy();
    force.div(mass);
    acceleration.add(force);
  }
  
  //Checks if the particle its dead or not. 
  boolean dead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  
 //Runs the most important functions with one method. 
   void run() {
     move();
     display();
   }
}
