import geomerative.*;
import controlP5.*;
import java.util.*;

int lastWidth;

PFont myFont;
String[] fontList = PFont.list();
String activeFont = "Comic Sans";

void setup() {
  size(900, 500);
  lastWidth = 900;
  if (frame != null) {
    surface.setResizable(true);
    background(255, 255, 255);
  }

  myFont = createFont(activeFont, 32);
  fill(0, 0, 0);
  textFont(myFont);
  textAlign(CENTER, CENTER);

  //setGUI();
}

void draw() {
  background(255);
  text("!@#$%", width/2, height/2);
  
  if (lastWidth != width) {
   boolean openness = gMenu.isOpen(); 
   setGUI();
   background(255);
   lastWidth = width;
   System.out.println("Tralala");
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

//gui

//fce

//vystup: vektor
//theres a library for that, sketch > import lib