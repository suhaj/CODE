import controlP5.*;
import java.util.*;

ControlP5 myGUI;
PFont myFont;
String[] fontList = PFont.list();
String activeFont = "Comic Sans";

void setup() {
  size(900, 500);
  if (frame != null) {
   surface.setResizable(true);
   background(255, 255, 255);
  }
  
  
  //scrollable List:
  myGUI = new ControlP5(this); //the argument "this" tells cP5 I'm refering to this sketch
  List l = Arrays.asList(fontList);
  myGUI.addScrollableList("Fonts")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l);
     
  myFont = createFont(activeFont, 32);
  fill(0,0,0);
  textFont(myFont);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(255, 255, 255);
  text("!@#$%", width/2, height/2);
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