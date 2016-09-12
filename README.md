# weeds

"Kingdom of Weeds"  
by  
Erica Jewell  
Íñigo Martínez de Rituerto  
Ulla Puggaard  

Sonification of leaves, based on Processing and Python, running on Arduino and Adafruit.

http://www.kingdomofweeds.com/

Process:  
- Trace a leaf in black so that it resembles a waveform, use this file as input.
- Get distance in pixels from zero-crossing to amplitude height of the black outline image file using the leaf_tracer.pde script.
- Store the array of distances to be used to write a .wav file from the image
