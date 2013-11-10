/**
 * @author @fabiantheblind
 * @license WTFPL
 */


/**
 * Some basic variables
 */
int randx;
int xrange = 300;
int step = 5;

/**
 * The setup.
 * No need for a draw...
 */
void setup(){
 smooth();// make it smooth
 randx = int(random(0,width));//some random start point

background(#ffffff);// white bg
size(1280,720);// sketch size
stroke(0,100);// black stroke
strokeWeight(0.6);// pretty thin
/**
 * Now generate some random value for the starting point
 * of the target points
 * it is smaller than the widht of the sketch minus the range
 */
int xstart = int(random(0, width - xrange));
/**
 * Loop the range increment x by step
 */
for(int x = 0; x < xrange; x+=step){
  line(randx, 0, xstart + x, height);// draw the line
  }
}


