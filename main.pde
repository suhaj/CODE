//import processing.svg.*;
//import java.util.*;

import geomerative.*;
import controlP5.*;
/* Font path search libraries */
import java.util.List;
import java.util.Arrays;
import java.lang.String;
import java.lang.reflect.Field;
import java.awt.*;
import sun.font.Font2D;
import sun.font.FontManager;
import sun.font.FontManagerFactory;
import sun.font.PhysicalFont;
/* Console to String libraries */
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.List;

RFont myFONT;
RGroup myGroup;
RPoint[] myPoints;

String textTyped = "Type!!";
boolean firstDrawRun = true;
int lastWidth = 900;
int lastHeight = 500;
/* mousePressed() variables */
int offsetX = 0;
int offsetY = 0;
int centerX = 0;
int centerY = 0;
/* GUI init */
ControlP5 myGUI;
controlP5.Group gMenu;
controlP5.Group f1Menu;
controlP5.Group f2Menu;
controlP5.Group f3Menu;
RadioButton rb1;
/* GUI variables */
boolean gMenuOpenness = true;
//boolean textToggle = false;
//boolean f1toggle = false;
String activeFont = "FreeSans.ttf"; //default font
String selectedFont = activeFont;
/* lists for font-work */
String[] PFontList = PFont.list();
List<String> TTFFontList = new ArrayList<String>();
List<String> TTFPathList = new ArrayList<String>();
/*fction variables*/
Particle p;
ArrayList particles;
float distMin=40;

void setup() {
  size(900, 500);
  smooth();
  if (frame != null) {
    surface.setResizable(true); //processing 3.0
    background(255);
  }

  initializeFontList();

  /* Geomerative text object setup */
  RG.init(this);
  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myFONT = new RFont(activeFont, activeFontSize, RFont.CENTER);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();
  // ------ set style and segment resolution  ------
  //RCommand.setSegmentStep(10);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // -----------------------------------------------
  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);
  // -----------------------------------------------
  //myGroup = myGroup.toPolygonGroup();

  f2particles();

  /* text location */
  centerX = width/2;
  centerY = (height/3)*2;
}

void draw() {
  background(255);
  // -----------------------------------------------
  /* sets GUI in the very beginning */
  if (firstDrawRun) {
    setGUI();
    setFunctionMenus();
    firstDrawRun = false;
  }
  /* dropdown list changes font */
  if (activeFont != selectedFont) {
    activeFont = selectedFont;
    myFONT =  new RFont(activeFont, activeFontSize, RFont.CENTER);
    myGroup = myFONT.toGroup(textTyped);
  }
  /* changes size of MyFont */
  if (activeFontSize != fontSize) { 
    activeFontSize = fontSize;
    myFONT.setSize(activeFontSize);
  }
  /* moving text while menus closed */
  if ((mousePressed == true)&&(!f1Menu.isVisible())&&(!f2Menu.isVisible())&&(!f3Menu.isVisible())) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
  } 
  /* change Menu dimensions with screen resize */
  if (lastWidth != width || lastHeight != height) {
    gMenu.hide();
    if (gMenu.isOpen()) {
      gMenuOpenness = true;
      background(255);
      setGUI();
    } else {
      gMenuOpenness = false;  
      background(255);
      setGUI();
    }
    gMenu.show();
    if (f1Menu.isVisible()) {
      f1Menu.hide();
      setFunctionMenus();
      f1Menu.show();
    }
    if (f2Menu.isVisible()) {
      f2Menu.hide();
      setFunctionMenus();
      f2Menu.show();
    }
    if (f3Menu.isVisible()) {
      f3Menu.hide();
      setFunctionMenus();
      f3Menu.show();
    }
    lastWidth = width;
    lastHeight = height;
  }
  // -----------------------------------------------

  /*
  !!!TRYING TO RESOLVE FCTION COEXISTENCE!!!
   if (f1 togle is on)
   display f1 style
   
   two modes? see/type font 
   and then edit fctions */

  /* TEXT OBJECT DISPLAY */
  pushMatrix();
  translate(centerX, centerY);
  /* basic text */
  if (!f1Menu.isVisible()&&!f2Menu.isVisible()&&!f3Menu.isVisible()) {
    fill(0, 0, 0);
    myFONT.draw(textTyped);
  }

  /* f1 */
  if (f1Menu.isVisible()) {
    f1();
  }
  /* f2 */
  if (f2Menu.isVisible()) {
    fill(255, 50);
    strokeWeight(0.3);
    stroke(0, 255, 255, 50);

    RCommand.setSegmentLength(segment);
    //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    myGroup = myFONT.toGroup(textTyped);
    myPoints = myGroup.getPoints();

    for (int i=0; i<particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      p.draw();

      float dpart=0;
      for (int j =0; j<particles.size(); j++) {

        Particle pj = (Particle)particles.get(j);
        dpart = p.distance(pj);

        if (dpart <= distMin) {
          // stroke(255, map(dpart, 0, distMin, 255, 0));
          line(p.x, p.y, pj.x, pj.y);
        }
      }
    }
  }

  popMatrix();
}

//--------------------------END--------------------------OF--------------------------MAIN----------------------------------------------------------------------------------------------
/*
.setGUI by slo rozdelit na dve casti: jedna na zacatku pro init, druha pro srovnavani velikosti >> when you know how many buttons and stuff
 
 .Generative design is a design method in which the output – image, sound, architectural models, animation – is generated 
 by a set of rules or an Algorithm, normally by using a computer program. Most generative design is based on parametric modeling.
 */
//System.out.println("Tralala");

/*
TAKEN FROM DRAW, THE MOVING GESTALTUNG FUNCTION
 pushMatrix();
 translate(centerX, centerY);
 
 if (textTyped.length() > 0) {
 // get the points on font outline
 RGroup myGroup;
 myGroup = myFONT.toGroup(textTyped);
 myGroup = myGroup.toPolygonGroup();
 RPoint[] pnts = myGroup.getPoints();
 
 // map mouse axis
 float addToAngle = map(mouseX, 0,width, -PI,+PI);
 float curveHeight = map(mouseY, 0,height, 0.1,2);
 
 for (int i = 0; i < pnts.length-1; i++ ) {
 float d = dist(pnts[i].x, pnts[i].y, pnts[i+1].x, pnts[i+1].y);
 // create a gap between each letter
 if (d > 20) continue;
 // alternate in every step from -1 to 1
 //float stepper = map(i%2,0,1,-1,1);
 //float angle = atan2(pnts[i+1].y-pnts[i].y, pnts[i+1].x-pnts[i].x);
 //angle = angle + addToAngle;
 
 float cx = pnts[i].x ;// + cos(angle*stepper) * d*4 * curveHeight;
 float cy = pnts[i].y ;//+ sin(angle*stepper) * d*3 * curveHeight;
 
 bezier(pnts[i].x,pnts[i].y,  cx,cy, cx,cy,  pnts[i+1].x,pnts[i+1].y);
 }
 }
 popMatrix();
 */