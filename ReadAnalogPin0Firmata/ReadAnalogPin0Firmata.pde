// This sketch uses serial IO to communicate with the Arduino.
// The Arduino is writing out values from
// analog input 0 - which in this case has a photoresistor
// on it.
//
// The code auto-scales based on lowest and highest readings
// and draws a "pupil" in proportion to the amount of light
// sensed.
//
import processing.serial.*;

Serial myPort;
int minval=9999;
int maxval=0;
float r=0;
int a0;
PFont f;

void setup() {
  size(200, 200);
  myPort = new Serial(this,"/dev/cu.usbmodemfd121",9600);
  myPort.clear();
  f = createFont("Krungthep",20,true);
  smooth();
}

// Reads string between two delimiters in serial stream 
String readLine(Serial p,int firstDelim, int secondDelim) {
  StringBuilder sb = new StringBuilder();
  Boolean isFirstDelim = false;
  int c;
  while (true)
  {
    while ((c = p.read()) < 0);
    if (!isFirstDelim)
    {
      if (c != firstDelim)
        continue;
      isFirstDelim = true;
    }
    else
    if (c != secondDelim)
      sb.append((char)c);
    else
      break;
  }  
  return sb.toString();
}

void getReading()
{
  String line;
  if (myPort.available()>0) {
    line = readLine(myPort,10,13);
    if (line != null && line.length()>0)
      a0 = Integer.parseInt(line);
  }
}

void draw() {
  background(255);
  textFont(f);
  textAlign(CENTER);
  getReading();
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
    fill(255);
    ellipse(15,-15,8,8);
    popMatrix();
    popStyle();
}






