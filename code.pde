//import processing.svg.*;

import geomerative.*;
import controlP5.*;
import java.util.*;

RFont fontGEOM;
RGroup grp;

boolean firstDrawRun = true;
int lastWidth = 900;
int lastHeight = 500;
String textTyped = "Type!!";

void setup() {
  size(900, 500);
  smooth();
  if (frame != null) {
    surface.setResizable(true); //processing 3.0
    background(255, 255, 255);
  }

  fill(0, 0, 0);
  RG.init(this);
  fontGEOM = new RFont("C:/Windows/Fonts/"+activeFont, activeFontSize, RFont.CENTER);

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

  setGUI();
}

void draw() {
  if (firstDrawRun) { //sets GUI in the very beginning
    setGUI();
    setFunctionMenus();
    firstDrawRun = false;
  }

  if (activeFont != selectedFont) { //dropdown list changes font
    activeFont = selectedFont;
    //fontGEOM = new RFont(activeFont, activeFontSize, RFont.LEFT);
    //grp = fontGEOM.toGroup(textTyped);
    
    myFont = createFont(activeFont, activeFontSize);
    textFont(myFont);
  }

  if (activeFontSize != fontSize) { //dropdown list changes font size
    activeFontSize = fontSize;
    myFont = createFont(activeFont, activeFontSize);
    textFont(myFont);
  }

  background(255); //repeating background 
  text(textTyped, width/2, height/2); //the text THATS GONNA BE AN OBJECT SOMEHOW

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
    //System.out.println("Tralala");
  }
}

/*
.setGUI by slo rozdelit na dve casti: jedna na zacatku pro init, druha pro srovnavani velikosti >> when you know how many buttons and stuff
 
 .Generative design is a design method in which the output – image, sound, architectural models, animation – is generated 
 by a set of rules or an Algorithm, normally by using a computer program. Most generative design is based on parametric modeling.
 */