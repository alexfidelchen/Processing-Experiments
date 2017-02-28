/* Here three objects attract particles using a simplified gravitational
  force. On startup, three objects called attractors are created. Particles are 
  spread randomly throughout the window and then become attracted to the closest
  attractor. A particle's closest attractor may switch overtime.
*/

PVector gravity; /* This is a simplified gravitational force. This force does not
reflect reality. 
*/
Particle[] particle = new Particle[2500];
Attractor[] attractor = new Attractor[3];

//Gravity's variables. Used for debugging purposes. 
float distance;
float gravityMagnitude;



void setup(){
  size(640,360);
  background(255);
  for (int i = 0; i < particle.length; i++){
  particle[i] = new Particle(new PVector(random(width),random(height)),
             new PVector(1,0), new PVector(0,0));
  }
  attractor[0] = new Attractor(new PVector(width/3,height/2));
  attractor[1] = new Attractor(new PVector(2 * width/3, height/4));
  attractor[2] = new Attractor( new PVector(2 * width/3, 3* height/4));
  
}
void draw(){
  background(255);
  for (Attractor a: attractor){
    a.display();
  }
  // Display the attractor so the particle knows where to move towards. 
  for (Particle m: particle){
  int closestNeighbor = closestNeighbor(attractor,m);
      gravity = attractor[closestNeighbor].attract(m);
      m.applyForce(gravity);
  m.move();
  m.display();
  }
  
}

class Particle{
  //Properties
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  
  //Constructor
  Particle( PVector loc_, PVector vel_, PVector accel_){
  //I indicate constructor arugments using an underscore. 
    location = loc_;
    velocity = vel_;
    acceleration = accel_;
  }
  
  // Methods (Things the particle can do)
  void display(){
    noStroke();
    fill(150,50);
    ellipse(location.x, location.y, 4, 4); 
    // The particle's mass does not correlate with its diameter.
  }
  
  void move(){
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    acceleration.mult(0); /* Reset the acceleration at the end of each frame, so the
    acceleration stays constant. 
    */
  }
  
  void applyForce(PVector force){ 
    PVector f = force.copy();
    f.div(mass); 
    acceleration.add(f);   
  }
  void debug(){
    println(" ");
    println("Current location: " + "(" + location.x + "," + location.y +")");
    println("Current velocity: " +  velocity.mag());
    println("Current velocity components: " + 
    "(" + velocity.x + "," + velocity.y +")");
    println("Current acceleration: " +  acceleration.mag());
    println("Current acceleration components: " + 
    "(" + acceleration.x + "," + acceleration.y +")"); 
    println("Current gravity: " + gravity.mag());
    println("Current gravity components: " + 
    "(" + gravity.x + "," + gravity.y +")"); 
    
  }

}

class Attractor{
  //Properties
  PVector location;
  float mass = 20;
  float G = 0.3; /* G is the universal gravitational constant. In this simulation, G is
  abritrary. 
  */
  //Constructor
  Attractor(PVector loc_){
    location = loc_;
  }
  //Methods (Things the attractor can do)
  void display(){
    stroke(0); 
    strokeWeight(3);
    fill(175,200);
    ellipse(location.x, location.y, mass * 2, mass * 2);
  }
  
  // The attractor attracts a particle using a simplified gravitational force.
  PVector attract(Particle particle){ 
  float particleMass = particle.mass;
  PVector gravity = PVector.sub(location,particle.location);
  distance = gravity.mag();
  distance = constrain(distance,5,7); 
  gravityMagnitude = (G * mass * particleMass)/(distance * distance);
  
  gravity.normalize();
  gravity.mult(gravityMagnitude); 
  return gravity;
}

/* Closest Neighbor Function. This function determines the closest attractor for each particle.
  The function returns the index number of the closest attractor.
  */
}
int closestNeighbor(Attractor[] attractor, Particle particle){
  PVector king = new PVector(100000,100000);
  int kingNumber = -1; // Program breaks if there is no king. 
  for (int i = 0; i < attractor.length ; i++){
    PVector challenger = PVector.sub(particle.location, attractor[i].location);
    if(challenger.mag() < king.mag()){
      king = challenger;
      kingNumber = i;
    }
  }
  return kingNumber;
 
}