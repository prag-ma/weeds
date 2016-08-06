/* T O D O:
 present it as a ritual, reconnecting with something so simple
 - shape of hand
 
 - scale the files to fit to screen
 - draw bottom and top of leaf at the same time
 - experiment with textures
 - use the veins of the leaves
 - follow music in some revealing way?
   - leaf in background, tracing over it in time with sound triggering
   - make your own song by combining leaf shapes

 load and scale arrays, or get coordinates from image files. scaling should be done within the script, changeable for different screen output sizes.
 trace these y-coordinates with ellipses at defined speeds.
 coordinate this with composed music
*/

int x1 = 0;
int x2 = 0;

  // y-coordinates are floats because we need to scale them
float y1 = 0;
float y2 = 0;

  // create arrays to store leaf coordinates
int [] leaf1array;
int [] leaf2array;


void setup(){
  
  fullScreen();
  
    // leaf coordinate .txt files are gathered from images using "leaf_tracer.pde"
  leaf1array = int(loadStrings("leaf1.txt"));
  leaf2array = int(loadStrings("leaf2.txt"));
  
  frameRate(300);
  
    // put background in setup instead of draw so that it doesn't refresh, leaving a trail of ellipses and giving the effect of live drawing/tracing
  background(0); 
}



void draw(){

    // move the x-coordinate by a certain amount ("speed") each frame. 
  int speed = 1;
  x1 = x1 + speed;
  x2 = x2 + speed;
  
    // when reaching the end of the leaf trace, restart from the left
  if (x1 >= leaf1array.length){
    x1 = 0;
  }
  if (x2 >= leaf2array.length){
    x2 = 0;
  }
  
    // map the corresponding y-coordinates to fit inside the screen. 
    // needs to be fixed to determine the maximum an minimum values in the array before mapping.
  int value1 = leaf1array[x1];
  y1 = map(value1, -1000, 1000, displayHeight, 0);
  int value2 = leaf2array[x2];
  y2 = map(value2, -1000, 1000, displayHeight, 0);
  
    // make the ellipse green and with no outline.
  fill(33, 128, 61);
  noStroke();

    // if the x-value has not crossed the width of the screen, draw it now.
  if (x1 < displayWidth && x1 < leaf1array.length){
  ellipse(x1, y1, 5, 5);
  }
  if (x2 < displayWidth && x2 < leaf2array.length){
  ellipse(x2, y2, 5, 5);
  }

    // if the x-value has already crossed the screen once, keep drawing it but clear each successive frame before beginning to draw again from the left.
  for (int i = 1; i < 10; i++){
    if (x1 == displayWidth*i){
    background(0);
    }
    if (x1 > displayWidth*i && x1 < leaf1array.length){
    ellipse(x1 - displayWidth*i, y1, 5, 5);
    }
    if (x2 == displayWidth*i){
    background(0);
    }
    if (x2 > displayWidth*i && x2 < leaf2array.length){
    ellipse(x2 - displayWidth*i, y2, 5, 5);
    } 
  }
}