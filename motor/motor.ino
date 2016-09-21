/*

Kingdom of Weeds
2016
Erica Jewell

Adapted from http://www.4tronix.co.uk/arduino/Stepper-Motors.php

"[Unidirectional] operation of a 28BYJ-48, using a ULN2003 interface board
to drive the stepper. The 28BYJ-48 motor is a 4-phase, 8-beat motor,
geared down by a factor of 68. One bipolar winding is on motor pins 1 & 3 and
the other on motor pins 2 & 4. The step angle is 5.625/64 and the operating
Frequency is 100pps. Current draw is 92mA."

*/

//declare variables for the motor pins
int motorPin1 = 8;    // Blue   - 28BYJ48 pin 1
int motorPin2 = 9;    // Pink   - 28BYJ48 pin 2
int motorPin3 = 10;    // Yellow - 28BYJ48 pin 3
int motorPin4 = 11;    // Orange - 28BYJ48 pin 4
                        // Red    - 28BYJ48 pin 5 (VCC)

int motorSpeed = 4000;  // variable to set stepper speed. higher number = slower
int count = 0;          // count of steps made
int countsperrev = 512; // number of steps per full revolution
int lookup[8] = {B01000, B01100, B00100, B00110, B00010, B00011, B00001, B01001};


void setup() {
  //declare the motor pins as outputs
  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  pinMode(motorPin3, OUTPUT);
  pinMode(motorPin4, OUTPUT);
//  pinMode(7, OUTPUT);
  Serial.begin(9600);
  // set digital pin to 0 to send a ground signal to the adafruit soundboard, to start it playing the loop
//  pinMode(7, LOW);
}

void loop(){
  count++;
  //set pins to ULN2003 high in sequence from 1 to 4
  //delay "motorSpeed" between each pin setting (to determine speed)
  for(int i = 7; i >= 0; i--)
  {
    setOutput(i);
    delayMicroseconds(motorSpeed);
    // save <count> to EEPROM
    //Serial.println(count);
  }
  if (count == countsperrev){
    // TODO: Play/resync audio here
    count = 0;
  }
}

void setOutput(int out)
{
  digitalWrite(motorPin1, bitRead(lookup[out], 0));
  digitalWrite(motorPin2, bitRead(lookup[out], 1));
  digitalWrite(motorPin3, bitRead(lookup[out], 2));
  digitalWrite(motorPin4, bitRead(lookup[out], 3));
}
