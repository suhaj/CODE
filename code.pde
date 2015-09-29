import processing.svg.*;

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
  if (firstDrawRun) { //sets GUI only in the very beginning
    setGUI();
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
      gMenu.setOpen(true);
      background(255);
      setGUI();
    } else {
      gMenu.setOpen(false);  
      background(255);
      setGUI();
    }
    gMenu.show();

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

/*vstup: font
 nacist kliknuty umime, ale jak ho zobrazit kdyz se text setup a text nesnesou v jedné fci?
 */

//vystup: svg x pdf
//vstup: svg