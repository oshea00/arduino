PFont f;
PFont c;
int start;
String banner="News, News, News!!!";
String spinning="Wheeeeee..";
float theta;

void setup()
{
  size(400,300);
  f = createFont("BrushScriptMT",32,true);
  c = loadFont("Chalkboard-32.vlw");
  start=width;
  smooth();
}

void draw()
{
  background(255);
  textFont(f);
  fill(0);
  textAlign(LEFT);
  text("Hello World!",10,100);
  textFont(c,24);
  fill(#00ff80);
  text("From Mike ;)",10,132);
  stroke(100);
  line(width/2,height,width/2,0);
  textAlign(RIGHT);
  fill(#a7f21d);
  text("Right aligned",width/2,165);
  textAlign(CENTER);
  text("Centered text",width/2,190);
  textAlign(LEFT);
  fill(0,127,127);
  text(banner,start,220);
  float bannerWidth = textWidth(banner);
  start--;
  if (start+bannerWidth<0)
      start=width;
  pushMatrix();
  translate(width-(textWidth(spinning)/2),textWidth(spinning)/2);
  noFill();
  stroke(#ff8000);
  strokeWeight(4);
  ellipse(0,0,textWidth(spinning),textWidth(spinning));
  strokeWeight(1);
  rotate(theta-=0.05);
  fill(127,0,127);
  textAlign(CENTER);
  text(spinning,0,0);
  popMatrix();
}

