
/* Fire Simulation by Alex Chen. 
   A simulation of fire blowing in the wind. The wind blows the fire towards 
   the mouse's current location. 
   
   Repurposed this fire simulation as propulsion for the SpaceSim simulator. 
   https://github.com/alexfidelchen/SpaceSim
   
   Inspired by Shiffman's The Nature of Code.   
*/
import java.util.Random;
Random generator = new Random();

ParticleSystem fire;

void setup() {
  size(800,200,P2D);
  background(0);
  fire = new ParticleSystem (new PVector(width/2, (3 * height/4)));
}

void draw() {
  background(0);
  blendMode(ADD);
  // Create wind that blows the fire towards the mouse.  
  float dirX = map(mouseX,0,width,-0.2,0.2);          // mouseX = mouse's x-coordinate
  PVector wind = new PVector(dirX,0);
  fire.applyForce(wind);
  fire.run();
  
}
