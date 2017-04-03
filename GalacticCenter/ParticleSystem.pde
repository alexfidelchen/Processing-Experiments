
// ParticleSystem manages Particle objects. 

class ParticleSystem {
  PVector center = new PVector(width/2,height/2);
  Particle[] particles; 

  ParticleSystem(int numParticles) { 
    /* At initialization, ParticleSystem fills its array. 
     numParticles = number of particles desired in the array. 
     */
    particles = new Particle[numParticles];
    for (int i = 0; i < particles.length; i++ ) {
      particles[i] = new Particle();
    }
  }

  void run() {
    for (Particle p: particles) {
      p.display();
      p.move(center);
    }
  }
}