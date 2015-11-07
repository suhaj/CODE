import controlP5.*;
ControlP5 myGUI;

/*
//////////////////////////////////////////////
 --------- GEOMERATIVE TUTORIALS --------------
 //////////////////////////////////////////////
 Title   :   Geo_Font_02_c
 Date    :   01/03/2011 
 Version :   v0.5
 We access a number of points on a font's outline.
 In this variation we draw lines from a fixed position.
 
 Licensed under GNU General Public License (GPL) version 3.
 http://www.gnu.org/licenses/gpl.html
 
 A series of tutorials for using the Geomerative Library
 developed by Ricard Marxer. 
 http://www.ricardmarxer.com/geomerative/
 
 More info on these tutorial and workshops at :
 www.freeartbureau.org/blog
 
 */
//////////////////////////////////////////////

import geomerative.*;

RFont font;
String myText = "A";
float a, b, c, d = 0;
RPoint[] myPoints;
RGroup myGroup;

//----------------SETUP---------------------------------
void setup() {
  size(600, 600);
  background(255);
  smooth();
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 500, CENTER);

  noFill();
  stroke(0);
  strokeWeight(0.3);
  translate(width/2, height/1.2);
  smooth();

  RCommand.setSegmentLength(5);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  myGroup = font.toGroup(myText); 
  myPoints = myGroup.getPoints();

  //TRY DIFFERENT PARAMETERS AND VALUES TO GET VARIATIONS
  for (int i=0; i<myPoints.length; i++) {
    //line(myPoints[i].x, myPoints[i].y, -200, -200);
    //line(myPoints[i].x, myPoints[i].y,8,-360);
    a = myPoints[i].x+10;
    b = myPoints[i].y;
    c = myPoints[i].x+9; 
    d = myPoints[i].y+80;
    ellipse(a, b, c, d);
    //ellipse(myPoints[i].x,myPoints[i].y,3,3);
  }

  myGUI = new ControlP5(this);
  
  myGUI.addSlider("a")
    .setPosition(10, 10)
    .setRange(-500, 500)
    ;
  myGUI.addSlider("b")
    .setPosition(10, 30)
    .setRange(-500, 500)
    ;
  myGUI.addSlider("c")
    .setPosition(10, 50)
    .setRange(-500, 500)
    ;
  myGUI.addSlider("d")
    .setPosition(10, 70)
    .setRange(-500, 500)
    ;
}

//----------------DRAW---------------------------------

void draw() {
  background(255);
  for (int i=0; i<myPoints.length; i++) {
    ellipse(myPoints[i].x+a, myPoints[i].y+b, myPoints[i].x+c, myPoints[i].y+d);
  }
}
//////////////////////////////////////////////