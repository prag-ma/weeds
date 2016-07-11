// load and scale arrays, or get coordinates from image files. scaling should be done within the script, changeable for different screen output sizes.
// trace these y-coordinates with ellipses at defined speeds.
// coordinate this with composed music

int x = 0;
float y = 0;
int [] leaf1array;

void setup(){
fullScreen();
leaf1array = int(loadStrings("leaf1.txt"));
println(leaf1array.length);
frameRate(300);
background(0); // put background here instead of draw so that it doesn't refresh
}


void draw(){

// trace image's pixels, make x and y for ellipse equal to them. or use previously made array of pixels to read through?
// make a class
// need to resize arrays - it always traces the same small portion
x = x + 10;

if (x >= leaf1array.length){
  x = 0;
}

int value = leaf1array[x];
y = map(value, -800, 500, displayHeight, 0);
// draw multiple dots to follow each other? or lines?
fill(33, 128, 61);
noStroke();

if (x < displayWidth && x < leaf1array.length){
ellipse(x, y, 5, 5);
}
if (x == displayWidth){
background(0);
}
if (x > displayWidth && x < leaf1array.length){
ellipse(x - displayWidth, y, 5, 5);
}
if (x == displayWidth*2){
background(0);
}
if (x > displayWidth*2 && x < leaf1array.length){
ellipse(x - displayWidth*2, y, 5, 5);
}
if (x == displayWidth*3){
background(0);
}
if (x > displayWidth*3 && x < leaf1array.length){
ellipse(x - displayWidth*3, y, 5, 5);
}
if (x == displayWidth*4){
background(0);
}
if (x > displayWidth*4 && x < leaf1array.length){
ellipse(x - displayWidth*4, y, 5, 5);
}
if (x == displayWidth*5){
background(0);
}
if (x > displayWidth*5 && x < leaf1array.length){
ellipse(x - displayWidth*5, y, 5, 5);
}
if (x == displayWidth*6){
background(0);
}
if (x > displayWidth*6 && x < leaf1array.length){
ellipse(x - displayWidth*6, y, 5, 5);
}
if (x == displayWidth*7){
background(0);
}
if (x > displayWidth*7 && x < leaf1array.length){
ellipse(x - displayWidth*7, y, 5, 5);
}
if (x == displayWidth*8){
background(0);
}
if (x > displayWidth*8 && x < leaf1array.length){
ellipse(x - displayWidth*8, y, 5, 5);
}


}