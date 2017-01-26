/*Creates a stream of circles that looks a like shooting star. For best results, move the mouse slowly
when you run the program. 
*/


int num = 40;
int[] x = new int[num]; 
int[] y = new int[num]; /*Two arrays. One to hold the x position. One to 
hold the y-position. 
*/
void setup() {
  size(500,500);
  noStroke();
  background(0);
}
void draw(){
  background(0); /*When there's a lot of circles, background takes more time 
  to clear the window. 
  */
  
  for (int i = x.length-1; i>0; i--){ 
    // Move DOWN all old values to make room for the newest value. 
    x[i] = x[i-1]; /* All the elements move down by one. The last element is 
    now the second to the last element, which means the original last element 
    is deleted.
    */
    y[i] = y[i-1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
  for(int i = 0; i < x.length; i++){ /*For every (x,y) coordinate, draw a circle.
  The "for" loop creates a "stream" of circles. 
  */
    fill(6.4 * i); // The last circle in the stream will be the brightest.
    ellipse(x[i], y[i], .8 * i, .8 * i);
  }
}
  
  
