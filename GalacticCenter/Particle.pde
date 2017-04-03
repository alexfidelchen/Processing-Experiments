
class Particle {
  
  // A particle object starts in a random location.
  PVector location = new PVector(random(width),random(height));
  PVector velocity = new PVector(0,0);
  PVector acceleration;
  PVector direction;                         // Used to move particle towards center.
  float size = random(5,10);
  // Possible colors for Particle. 
  color[] particleColors = {color(212,32,67,150), color(181,146,254,150),
                            color(9,92,198,150)};
  color moverColor;
  
  Particle() {
    /* When a Particle object gets initialized, 
    it chooses a color from particleColors. 
    */
    int choose = (int) (random(4)-1);
    moverColor = particleColors[choose];
    
  }

  void display() {
    noStroke();
    fill(moverColor);
    ellipse(location.x, location.y, size, size);
  }
  
  void move(PVector PSCenter) {
  PVector center = PSCenter.copy();
  direction = PVector.sub(center,location); 
  // Putting "null" in the parameter makes direction.normalize(null) a new vector. 
  acceleration = direction.normalize(null);
  float scalar = 0.07;
  acceleration.mult(scalar);
  velocity.add(acceleration);
  // Limit the velocity so that particles do not get too far away from the center.
  velocity.limit(4);                    
  location.add(velocity);
    
  }
}