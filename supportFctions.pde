/* Creates Lists, calls for font sorting function, getFontSuffix() */
void initializeFontList() {
  for (int i = 0; i < PFontList.length; i++) {
    if (getFontSuffix(PFontList[i])) {
      TTFFontList.add(PFontList[i]);
    }
  }
  //activeFont = TTFFontList.get(int(random(0, TTFFontList.size())));
}

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

/* keyboard controls*/
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

/* mouse controls */
void mousePressed() {
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}

/* selectedFont getting a path, not a name - fix for Geomerative */
void fonts(int n) { //list of installed fonts
  selectedFont = TTFPathList.get(n);
  System.out.println(selectedFont);
}