// This sketch depends on Firmata running on the Arduino.
// It uses the Firmata library for Processing.org to query
// analog input 0 - which in this case has a photoresistor
// on it.
//
// The code auto-scales based on lowest and highest readings
// and draws a "pupil" in proportion to the amount of light
// sensed.
//
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int minval=9999;
int maxval=0;
float r=0;
int a0;
PFont f;

void setup() {
  size(200, 200);
  try {
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  } catch (Exception ex)
  {}
  f = createFont("Krungthep",20,true);
  smooth();
}

void draw() {
  
  background(255);
  textFont(f);
  textAlign(CENTER);
  if (arduino!=null)
      a0 = arduino.analogRead(0);     
  if (a0 < minval) minval = a0;
  if (a0 > maxval) maxval = a0;
  if (maxval==minval || abs(maxval-minval) <= 20)
      r=60;
  else
  {
      r = (float) abs(a0-minval) / (float) abs(maxval-minval);
      r *= 50;
      r += 10;
  }
  
  //println("val:"+(a0-minval)+" range:"+abs(maxval-minval));
  //println(r);
  
  pushMatrix();
  translate(20,40);
  drawEye(r);
  popMatrix();
  
  fill(0,127,127);
  text("A0="+a0,width/2,height-25);
  
  if (mousePressed)
  {
    minval = 9999;
    maxval = 0;
  }
  
}

void drawEye(float pupilSize)
{
    int theta=0;
    pushStyle();
    stroke(0);
    noFill();
    bezier(0,40,30,-12,130,-12,160,40);
    bezier(0,40,30,92,130,92,160,40);
    pushMatrix();
    fill(#9B9DF7);
    ellipse(80,40,80,80);
    translate(80,40);
    for (int i=0;i<360;i+=(360/12))
    {
        rotate((2*PI)/12); 
        line(-40,0,40,0);
    }
    fill(0);
    ellipse(0,0,pupilSize,pupilSize);
    popMatrix();
    popStyle();
}






