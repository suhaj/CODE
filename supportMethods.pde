/* keyboard controls*/
void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      textTyped = textTyped.substring(0, max(0, textTyped.length()-1));
      if (textTyped.length() > 0) {
        if (f7Menu.isVisible()) {
          resetF7();
        } else if (f8Menu.isVisible()) {
          resetF8();
        } else if (f9Menu.isVisible()) {
          resetF9();
        } else if (f10Menu.isVisible()) {
          resetF10();
        }
      }
      break;
    case ENTER:
    case RETURN:
      break;
    default:
      textTyped += key;
      if (textTyped.length() > 0) {
        if (f7Menu.isVisible()) {
          resetF7();
        } else if (f8Menu.isVisible()) {
          resetF8();
        } else if (f9Menu.isVisible()) {
          resetF9();
        } else if (f10Menu.isVisible()) {
          resetF10();
        }
      }
    }
  }
}
//void keyReleased() {
//  if (keyCode == CONTROL) savePDF();
//}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* mouse controls */
void mousePressed() {
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* selectedFont getting a path, not a name - fix for Geomerative */
void fonts(int n) { //list of installed fonts

  selectedFont = TTFPathList.get(n);
  System.out.println(selectedFont);

  //   System.out.println("got it!");
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Creates Lists, calls for font sorting function, getFontSuffix() */
void initializeFontList() {
  for (int i = 0; i < PFontList.length; i++) {
    if (getFontSuffix(PFontList[i])) {
      TTFFontList.add(PFontList[i]);
    }
  }
  //activeFont = TTFFontList.get(int(random(0, TTFFontList.size())));
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* font sorting function, called by initializeFontList() */
Boolean getFontSuffix(String fontNameMETHOD) {
  Boolean TTF = false;

  Font foundFont;
  FontManager fontManager = FontManagerFactory.getInstance();
  foundFont = null;
  foundFont = PFont.findFont(fontNameMETHOD);

  //System.out.println(foundFont);
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
    //System.out.println("--> Dialog issue");
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public static int convert8(int OctalNumber) {
  int counter=0;
  int result = 0;
  while (OctalNumber !=0) {
    int temp = (int) ((OctalNumber%8) * Math.pow(10, counter));
    counter++;
    result += temp;
    OctalNumber /= 8;
  }
  return result;
}

public static int convert9(int OctalNumber) {
  int counter=0;
  int result = 0;
  while (OctalNumber !=0) {
    int temp = (int) ((OctalNumber%9) * Math.pow(10, counter));
    counter++;
    result += temp;
    OctalNumber /= 9;
  }
  return result;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
String savePath;

public void savePDF() {
  selectOutput("Select a file to write to:", "fileSelected");
  noLoop();
  saveOneFrame = true;
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    loop();
  } else {
    savePath = selection.getAbsolutePath();
    loop();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void vectorPDF() {
  if (!vectorPDFOn) {
    selectOutput("Select a file to write to:", "fileSelected");
    noLoop();
    
    myGUI.getController("vectorPDF").setColorBackground(color(0, 85, 65));
    myGUI.getController("vectorPDF").setColorForeground(color(0, 47, 80));
    myGUI.getController("vectorPDF").setColorActive(color(199, 99, 62));
    vectorPDFOn = true;
  } else {
    endRecord();

    myGUI.getController("vectorPDF").setColorBackground(color(200, 97, 30));
    myGUI.getController("vectorPDF").setColorForeground(color(199, 99, 62));
    myGUI.getController("vectorPDF").setColorActive(color(0, 47, 80));
    vectorPDFOn = false;
  }
}

//public void vectorPDF() {
//  if (!vectorPDFOn) {
//    //beginRecord(PDF, "recordedImg" + counter + ".pdf");
//    selectOutput("Select a file to write to:", "fileSelected");
//    noLoop();
//    beginRecord(PDF, savePath + ".pdf");
//    colorMode(HSB, 360, 100, 100);
//
//    myGUI.getController("vectorPDF").setColorBackground(color(0, 85, 65));
//    myGUI.getController("vectorPDF").setColorForeground(color(0, 47, 80));
//    myGUI.getController("vectorPDF").setColorActive(color(199, 99, 62));
//    vectorPDFOn = true;
//  } else {
//    endRecord();
//
//    myGUI.getController("vectorPDF").setColorBackground(color(200, 97, 30));
//    myGUI.getController("vectorPDF").setColorForeground(color(199, 99, 62));
//    myGUI.getController("vectorPDF").setColorActive(color(0, 47, 80));
//    vectorPDFOn = false;
////    counter++;
//  }
//}
