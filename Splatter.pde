
// Splatter creates paint splatters. 

class Splatter {
  color[] colorPallete = {color(241,44,100,10), color(245,52,107,10), 
                          color(252,33,41,10), color(237,21,36,10),
                          color(247,23,59,10)};
                          
  // Need generator's nextGaussian() method to determine the paint splatter's location. 
  Random generator = new Random();
    
  Splatter () {  
  }
  
  void paint() {
    /* Paint is splattered near the center but never exactly on top of it. 
    The splatter's displacement from the center is determined by a Gaussian 
    distribution. 
    */
    
    // The colors are always splattered in the same order.
    for(color c: colorPallete) {
      
      float displacement = (float) generator.nextGaussian();   
      float xPos = width/2 + 50 * displacement; 
      displacement = (float) generator.nextGaussian();
      float yPos = height/2 + 50 * displacement; 
      fill(c);
      noStroke();
      ellipse(xPos,yPos,150,150); 
    }
  }
}