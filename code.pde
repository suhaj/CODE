//import processing.svg.*;

import geomerative.*;
import controlP5.*;
import java.util.*;

boolean firstDrawRun = true;
String textTyped = "Type!!";

void setup() {
  size(900, 500);
  smooth();
  lastWidth = 900;
  if (frame != null) {
    //frame.setResizable(true); //processing 2.2.1
    surface.setResizable(true); //processing 3.0
    background(255, 255, 255);
  }

  myFont = createFont(activeFont, 32);
  fill(0, 0, 0);
  textFont(myFont);
  textAlign(CENTER, CENTER);

  //setGUI();
}

void draw() {
  if (firstDrawRun) { //sets GUI in the very beginning
    setGUI();
    setFunctionMenus();
    firstDrawRun = false;
  }

  if (activeFont != selectedFont) { //dropdown list changes font
    activeFont = selectedFont;
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

  if (lastWidth != width) { //change gMenu dimensions with screen resize
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
    //System.out.println("Tralala");
  }
}

void Fonts(int n) {
  /* request the selected item based on index n */
  println(n, myGUI.get(ScrollableList.class, "Fonts").getItem(n));
  int index = n;
  activeFont = fontList[n];
}

void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      textTyped = textTyped.substring(0, max(0, textTyped.length()-1));
      break;
    case RETURN:
      // enable linebreaks
      textTyped += "\n";
      break;
    default:
      textTyped += key;
    }
  }
}

/*
.setGUI by slo rozdelit na dve casti: jedna na zacatku pro init, druha pro srovnavani velikosti >> when you know how many buttons and stuff
 
 .Generative design is a design method in which the output – image, sound, architectural models, animation – is generated 
 by a set of rules or an Algorithm, normally by using a computer program. Most generative design is based on parametric modeling.
 */