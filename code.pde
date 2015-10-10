//import processing.svg.*;

import geomerative.*;
import controlP5.*;
import java.util.*;

int lastWidth;

PFont myFont;
String[] fontList = PFont.list(); //all installed fonts
String activeFont = "Comic Sans"; //default font
String selectedFont = activeFont; 
boolean firstDrawRun = true;

void setup() {
  size(900, 500);
  lastWidth = 900;
  if (frame != null) {
    //    frame.setResizable(true); //processing 2.2.1
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
    myFont = createFont(activeFont, 32);
    textFont(myFont);
  }

  background(255); //repeating background 
  text("!@#$%", width/2, height/2); //the text THATS GONNA BE AN OBJECT SOMEHOW

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

//setGUI by slo rozdelit na dve casti: jedna na zacatku pro init, druha pro srovnavani velikosti >> when you know how many buttons and stuff

//vystup: svg x pdf
//vstup: svg