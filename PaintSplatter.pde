
/* PaintSplatter simulation by Alex Chen. 
   Simulates paint splattered on a canvas. Paint is splattered in 5 different colors. 
   Inspired by Mark Rothko's abstract paintings. 
   */

import java.util.Random;

Splatter splatter1;

void setup() {
  size(300,300);
  background(#F9A318);
  splatter1 = new Splatter();
  frameRate(10);
}

void draw() {
  
   splatter1.paint();  
   
}