/*
What if the functions ar evoid and just create lists to work with!!
 Yay!!
 */

//Console to String libraries
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.List;

String[] PFontList = PFont.list();
List<String> TTFFontList = new ArrayList<String>();
List<String> TTFPathList = new ArrayList<String>();

//Creates Lists, calls for font sorting function, getFontSuffix()
String[] initializeFontList() {
  for (int i = 0; i < PFontList.length; i++) {
    if (getFontSuffix(PFontList[i])) {
      TTFFontList.add(PFontList[i]);
    }
  }
  //activeFont = TTFFontList.get(int(random(0, TTFFontList.size())));
  String[] TTFFontArray = new String[TTFFontList.size()];
  for (int i = 0; i < TTFFontList.size(); i++ ) {
    TTFFontArray[i] = TTFFontList.get(i);
  }
  return TTFFontArray;
}

String[] initializePathList() {
  String[] TTFPathArray = new String[TTFPathList.size()];
  for (int i = 0; i < TTFPathList.size(); i++ ) {
    TTFPathArray[i] = TTFPathList.get(i);
  }
  return TTFPathArray;
}

//font sorting function, called by initializeFontList()
Boolean getFontSuffix(String fontNameMETHOD) {
  Boolean TTF = false;

  Font foundFont;
  FontManager fontManager = FontManagerFactory.getInstance();
  foundFont = null;
  foundFont = PFont.findFont(fontNameMETHOD);

  System.out.println(foundFont);
  ByteArrayOutputStream baos = new ByteArrayOutputStream();
  PrintStream ps = new PrintStream(baos);
  PrintStream old = System.out;
  System.setOut(ps);
  System.out.println(foundFont);
  System.out.flush();
  System.setOut(old);
  String theTruth = baos.toString();
  //System.out.println(theTruth + "theTruth: ");

  if (theTruth.startsWith("java.awt.Font[family=Dialog")
    ||theTruth.startsWith("java.awt.Font[family=Monospaced")
    ||theTruth.startsWith("java.awt.Font[family=SansSerif")
    ||theTruth.startsWith("java.awt.Font[family=Serif")) {
    System.out.println("--> Dialog issue");
    return TTF;
  }

  Font2D f2d = fontManager.findFont2D(foundFont.getFontName(), foundFont.getStyle(), 
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

  //System.out.println(fontPath);

  if (fontPath.endsWith(".ttf")) {
    TTF = true;
    TTFPathList.add(fontPath);
  }

  return TTF;
}

/*
RFont getFont(String fontName) {
 RFont gotFont;
 // **************************************************
 Font foundFont;
 FontManager fontManager = FontManagerFactory.getInstance();  
 // **************************************************
 foundFont = null;
 foundFont = PFont.findFont(fontName);
 
 Font2D f2d = fontManager.findFont2D(foundFont.getFontName(), foundFont.getStyle(), 
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
 
 return gotFont=new RFont(fontPath, activeFontSize, RFont.CENTER);
 }
 */

void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      textTyped = textTyped.substring(0, max(0, textTyped.length()-1));
      break;
    case ENTER:
    case RETURN:
      //soooooo what if we actuallz use the points and move those!
      break;
    default:
      textTyped += key;
    }
  }
}

void mousePressed() {
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}

void fonts(int n) { //list of installed fonts
  selectedFont = TTFFontList.get(n);
  System.out.println(selectedFont);
}