/* 
Erica Jewell
2016

Created for Ulla Puggaard's "Kingdom of Weeds" - sonifying the leaves from weeds.
- Trace a leaf in black so that it resembles a waveform, use this file as input.
- Get distance in pixels from zero-crossing to amplitude height of the black outline image file using this script.
- Store the array of distances to be used to write a .wav file from the image

Using Daniel Schiffman's pixels tutorial:
 - For any given X, Y point in the window, the location in our 1 dimensional (image) pixel array is: LOCATION = X + Y*WIDTH
*/

PImage img;

void setup() {
  // change the dimensions here to make size equal to the dimensions of the image in pixels
  size(8991, 1613);
  // specify image you're using - put this in the data folder within Processing
  img = loadImage("outline.png");
}

void draw() {
  // create an array the size of the image's width to store the amplitude values
  String [] values = new String[img.width];
  
  loadPixels(); 
  // access the image's pixels  
  img.loadPixels(); 
  // scanning across each x an y value
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // get the location in the image's pixel array
      int loc = x + y*width;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      // if the pixel is black, 
      // if (r == 0 && g == 0 && b == 0){
      if (r < 255){
        // change this value to stabilize the zero-crossing - if the first value in the array should be zero, and represent the middle of the image, use that value here.
        int first = 119;
        // turn the measured pixels red in order to check that the function is working.
        pixels[loc] = color(255, 0, 0);
        // store the y-value in the array
        // if the pixel's y-location is greater than the zero crossing (height/2), it is negative. subtract the height of the image from its y-value.
        if (y > (height/2))
          values[x] = str(-(y - (height/2)) - first);
        // if the pixel's y-location is less than or equal to the zero crossing, subtract its y-value from the image's height.
        if (y <= (height/2))
          values[x] = str((height/2) - y - first);
      }
      // leave all other pixels as they are and draw them to the screen.
      else{
      pixels[loc] =  color(r, g, b); 
      }
    }
  }
  // save the array as a .txt file.
  saveStrings("array.txt", values);
  updatePixels();
}
          