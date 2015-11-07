//import processing.svg.*;

import geomerative.*;
import controlP5.*;
import java.util.*;

RFont fontGEOM;
RGroup grp;
/*RPoint[] pnts;
*/
String textTyped = "Type!!";

boolean firstDrawRun = true;
int lastWidth = 900;
int lastHeight = 500;

int offsetX = 0;
int offsetY = 0;
int centerX = 0;
int centerY = 0;

void setup() {
  size(900, 500);
  smooth();
  if (frame != null) {
    surface.setResizable(true); //processing 3.0
    background(255, 255, 255);
  }

  fill(0, 0, 0);
  
  RG.init(this);
  fontGEOM = new RFont("Oswald-Regular.ttf", 200, RFont.CENTER);
  grp = fontGEOM.toGroup(textTyped);
  /*grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints();
  */

  //myFont = createFont(activeFont, activeFontSize);
  //fill(0, 0, 0);
  //textFont(myFont);
  //textAlign(CENTER, CENTER);

  // ------ set style and segment resolution  ------
  //RCommand.setSegmentStep(10);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);

  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);

  //setGUI(); redundant??
  
  centerX = width/2;
  centerY = (height/3)*2;
}

void draw() {
  if (firstDrawRun) { //sets GUI in the very beginning
    setGUI();
    setFunctionMenus();
    firstDrawRun = false;
  }
/*
  if (activeFont != selectedFont) { //dropdown list changes font
    activeFont = selectedFont;
    fontGEOM = new RFont("C:/Windows/Fonts/"+activeFont+".ttf", activeFontSize, RFont.CENTER);
    grp = fontGEOM.toGroup(textTyped);

    myFont = createFont(activeFont, activeFontSize);
    textFont(myFont);
  }
  */

if (activeFontSize != fontSize) { 
    activeFontSize = fontSize;
    fontGEOM.setSize(activeFontSize);
}

  background(255);
  /*text(textTyped, width/2, height/2); //the text THATS GONNA BE AN OBJECT SOMEHOW
  */
  
  /*if that down there && all menus closed except gmenu*/
  if ((mousePressed == true)&&(!f1Menu.isVisible())&&(!f2Menu.isVisible())&&(!f3Menu.isVisible())) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
  } 
  
  pushMatrix();
  translate(centerX, centerY);

  if (textTyped.length() > 0) {
    // get the points on font outline
    RGroup grp;
    grp = fontGEOM.toGroup(textTyped);
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();

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


  if (lastWidth != width || lastHeight != height) { //change gMenu dimensions with screen resize
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
}

/*
.setGUI by slo rozdelit na dve casti: jedna na zacatku pro init, druha pro srovnavani velikosti >> when you know how many buttons and stuff
 
 .Generative design is a design method in which the output – image, sound, architectural models, animation – is generated 
 by a set of rules or an Algorithm, normally by using a computer program. Most generative design is based on parametric modeling.
 */
//System.out.println("Tralala");