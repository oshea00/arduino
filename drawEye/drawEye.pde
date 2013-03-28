
void setup()
{
    size(200,200);
    background(255);
    smooth();  
    drawEye(20);
    translate(0,100);
    drawEye(40);
}

void drawEye(int pupilSize)
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

