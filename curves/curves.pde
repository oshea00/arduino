void setup()
{
  size(500,400);
  background(255);
  smooth();  // pretty antialias

  rectMode(CENTER);
  stroke(128);
  rect(35,35,50,50);
  rect(105,35,50,50);
  rect(175,35,50,50);
  rect(105,105,100,50);

  stroke(255,80,0);
  arc(35,35,50,50,0,PI/2.0);
  arc(105,35,50,50,-PI/2,0);
  arc(175,35,50,50,-PI/6,PI/6);
  line(175,35,196,22);
  line(175,35,196,46);
  arc(105,105,100,50,PI/2,3*PI/2);
  
  stroke(0,127,127);
  curve(220,35,250,10,300,50,270,50);
  noStroke();
  fill(255,0,0);
  ellipse(220,35,3,3);
  ellipse(270,50,3,3);
  fill(0,127,127);
  ellipse(250,10,3,3);
  ellipse(300,50,3,3);

  noFill();
  stroke(0,127,127);
  beginShape();
  curveVertex(340, 40); // the first control point
  curveVertex(340, 40); // is also the start point of curve
  curveVertex(380, 60);
  curveVertex(400, 100);
  curveVertex(360, 120);
  curveVertex(350, 150); // the last point of curve
  curveVertex(350, 150); // is also the last control point
  endShape();
  fill(255,0,0);
  noStroke();
  ellipse(340,40,3,3);
  ellipse(380,60,3,3);
  ellipse(400,100,3,3);
  ellipse(360,120,3,3);
  ellipse(350,150,3,3);
  
  stroke(0);
  noFill();
  bezier(50, 275, 25, 225, 125, 225, 100, 275);
  
  beginShape();
  vertex(150, 275); // first point
  bezierVertex(125, 225, 225, 225, 200, 275);
  bezierVertex(180, 325, 225, 325, 230, 275);
  endShape();
  
  noStroke();
  fill(255,0,0);
  ellipse(125,225,3,3);
  ellipse(225,225,3,3);
  fill(0,127,127);
  ellipse(180,325,3,3);
  ellipse(225,325,3,3);
  noFill();
  stroke(127);
  line(125,225,150,275);
  line(225,225,200,275);
  line(180,325,200,275);
  line(225,325,230,275);
  
  
}
