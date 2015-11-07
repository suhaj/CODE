/* TODO 
 
 vlez do kodu PFont a zjisti, jak ziskava font 
 
 
 */

import geomerative.*;
import java.awt.*;
import java.lang.reflect.Field;

import sun.font.Font2D;
import sun.font.FontManager;
import sun.font.FontManagerFactory;
import sun.font.PhysicalFont;

import java.lang.String;

//BAUHS93.ttf
//BRITANIC.ttf
//CATELAR.ttf

PFont font;
RShape gfont;
Font foundFont;
String fontName;

FontManager fontManager = FontManagerFactory.getInstance();

void setup() {
  size(500, 500);
  printArray(PFont.list());

  
  RG.init(this);

  fontName = "Bauhaus 93";
  //font = createFont("Bauhaus 93", 35);
  
  // **************************************************
  
  foundFont = null;
  foundFont = PFont.findFont(fontName);

  System.out.println(foundFont);

  Font2D f2d = fontManager.findFont2D(foundFont.getFontName(), foundFont.getStyle(), 
    //        Font2D f2d = FontManager.findFont2D(f.getFontName(), f.getStyle(),
    FontManager.LOGICAL_FALLBACK).handle.font2D;

  Field platName = null;
  try {
    platName = PhysicalFont.class.getDeclaredField("platName");
  } 
  catch (NoSuchFieldException e) {
    e.printStackTrace();
  }
  platName.setAccessible(true);
  String fontPath = null;
  try {
    fontPath = (String)platName.get(f2d);
  } 
  catch (IllegalAccessException e) {
    e.printStackTrace();
  }
  platName.setAccessible(false);

  // ********************************************
  
  gfont = RG.getText("Hello world!", fontPath, 72, CENTER);


  System.out.println(fontPath);
}

void draw() {


  background(35);
  translate(width/2, height/2);
  fill(255);
  gfont.draw();

  //text("Lo?", width/4, height/4);
}