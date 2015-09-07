import controlP5.*;
import java.util.*;

ControlP5 myGUI;
PFont myFont;

void setup() {
  size(900, 500);
  if (frame != null) {
   surface.setResizable(true);
   background(255, 255, 255);
  }  
  myGUI = new ControlP5(this); //the argument "this" tells cP5 I|m refering to this sketch
  List l = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
  myGUI.addScrollableList("Fonts")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l);
     
  // Uncomment the following two lines to see the available fonts IN CONSOLE
  String[] fontList = PFont.list();
  println(fontList);
  myFont = createFont("Georgia", 32);
  fill(0,0,0);
  textFont(myFont);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(255, 255, 255);
  text("!@#$%", width/2, height/2);
}

//vstup: font
//popup/rozkliknutelná/rolldown nabídka fontů. Zvolit naistalovaný font
//there is a function (String[] fontList = PFont.list(); println(fontList);), which lists fonts, so zou just have to suck it out 
  //and put in a list and just string the name into (myFont = createFont("Georgia", 32);)
//listbox leaves just one selection!!

//gui

//fce

//vystup: vektor
//theres a library for that, sketch > import lib