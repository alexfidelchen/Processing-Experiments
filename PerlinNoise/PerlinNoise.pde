
/* PerlinNoise experiment by Alex Chen. 

  Here I experimented with Processing's noise() function which generates
  Perlin noise. The code below generates a 2d cloud texture. A unique cloud is
  created everytime the program starts up. I did not include the draw()
  in this program because it was not necessary to creates the cloud texture. 
  
  I repurposed this program to create the background of my Spacesim simulator. 
  https://github.com/alexfidelchen/SpaceSim
*/

/* xSpace and ySpace help keep track of the Perlin noise values. The 
  noise values change overtime. 
  */
float xSpace = 0; 
float ySpace = 0;

void setup() {
  size(300,300);
  background(0);
  loadPixels();
  
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      float bright = map(noise(xSpace,ySpace),0,1,0,255);
      pixels[(y * width) + x] = color(bright);
      //The pixels are defined as color variables.  
      ySpace = ySpace + 0.01; 
    }
    xSpace = xSpace + 0.004;
    ySpace = 0;
  }
  updatePixels();
}