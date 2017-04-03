
/* GalacticCenter by Alex Chen. 

   GalacticCenter simulates an array of particles attracted towards the center
   of the display window. The attractive force between each particle and center is 
   so strong that the particle overshoots the center. At this point, the particle
   turns around and moves towards the center again. When there are a lot of 
   particles in the array, the particles seem to move towards then away from 
   the center. 
*/

ParticleSystem ps1;
void setup(){
  size(300,300);
  background(#ffc5e7);
  ps1 = new ParticleSystem(1500); 
}
void draw(){
  background(#ffc5e7);
  ps1.run();
}