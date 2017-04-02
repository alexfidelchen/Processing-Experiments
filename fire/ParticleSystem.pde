
// ParticleSystem manages fire particles which form a fire. 

import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector origin;
 
  ParticleSystem(PVector location) {
    origin = location.copy();
  }
 
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  // Used to apply wind onto the fire. 
  void applyForce(PVector force) {
    for (Particle p: particles) {
      p.applyForce(force);
    }
  }
 
  void run() {
    // If the particle is dead, remove it from the ArrayList. 
    addParticle();
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.dead()) {
        it.remove();
      }
    }
  }
}