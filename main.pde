import megamu.mesh.*; 
import processing.pdf.*;
import geomerative.*;
import controlP5.*;
/* Font path search libraries */
import java.util.List;
import java.util.Arrays;
import java.lang.String;
import java.lang.reflect.Field;
import java.awt.*;
import sun.font.Font2D;
import sun.font.FontManager;
import sun.font.FontManagerFactory;
import sun.font.PhysicalFont;
/* Console to String libraries */
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.List;

PGraphics pg;
RFont myFONT;
RGroup myGroup;
RPoint[] myPoints;
/* GUI init */
ControlP5 myGUI;
controlP5.Group gMenu;
controlP5.Group publicMenu;
controlP5.Group f1Menu;
controlP5.Group f2Menu;
controlP5.Group f3Menu;
controlP5.Group f4Menu;
controlP5.Group f5Menu;
controlP5.Group f6Menu;
controlP5.Group f7Menu;
controlP5.Group f8Menu;
controlP5.Group f9Menu;
controlP5.Group f10Menu;
//---------------------------------------------------v
//controlP5.Group f#Menu;
//---------------------------------------------------^
RadioButton rb1;
Slider2D s;
/* GUI variables */
boolean gMenuOpenness = true;
String activeFont = "FreeSans.ttf"; //default font
String selectedFont = activeFont;
String textTyped = "Type!!";
int frmRt = 16;
boolean saveOneFrame = false;
boolean vectorPDFOn = false;

PGraphics pdf;
int textHue = 0;
int textSat = 0;
int textBri = 30;
int bcgHue = 0;
int bcgSat = 0;
int bcgBri = 100;
int hue7, sat7, bri7 = 0;
int hue8, sat8, bri8 = 0;
int hue9, sat9, bri9 = 0;
boolean firstDrawRun = true;
int lastWidth = 901;
int lastHeight = 501;
/* mousePressed() variables */
int offsetX = 0;
int offsetY = 0;
int centerX = 0;
int centerY = 0;
int lastCenterX = centerX;
int lastCenterY = centerY;
/* lists for font-work */
String[] PFontList = PFont.list();
List<String> TTFFontList = new ArrayList<String>();
List<String> TTFPathList = new ArrayList<String>();
/*fction1 variables*/
float verticalStretch = 0;
float horizontalStretch = 0;
int segment = 10;
float factor = 1;
/*fction2 variables*/
Particle p;
ArrayList particles = new ArrayList();
float distMin=40;
float xxx = 0;
float yyy = 0;
float lastXXX = xxx;
float lastYYY = yyy;
boolean firstF2run = true;
/* fction3variables */
FontAgent3[] myAgents3;
int step = 3;
float nervousMotion = 0;
float noiseVariation = 0;
float motion;
float noiseScale;
float noiseZ;
/* fction4variables */
FontAgent4[] myAgents4;
float xoff = 0.0;
float yoff = 0.0;
float xincrement = 0.000005; 
float yincrement = 0.000008; 
float randX;
float randY;
float MouvPoint;
float mousey = 0;
float mousex = 0;
float factorx = 0;
float factory = 0;
/* fction5variables */
float stepSizeF5 = 3;
float danceFactorF5 = 1;
float connectionF5 = 1.4;
int thicknessF5 = 1;
/* fction6variables */
float stepSizeF6 = 3;
float danceFactorF6 = 1;
float connectionF6 = 1.4;
int thicknessF6 = 1;
/* fction7variables */
RShape rshape;        
RPoint[] allPoints;
MPolygon[] myRegions;        
color[] colors;
float[][] regionCoordinates;           
float[][] points;
int numPointsGenerated = 225;
int numPointsText;
float lastTextHue = textHue;
float lastTextBri = textBri;
float lastTextSat = textSat;
float colorRange = 15;
float lastColorRange = colorRange;
float filling = 0.75;
/* fction8variables */
//RShape shape8;
int maxParticlesF8 = 100;
ArrayList <ParticleF8> particlesF8 = new ArrayList <ParticleF8> ();
boolean resetNeeded = false;
float toggleRadius = 10;
float lifeRateToggle = 0.01;
/* fction9variables */
int maxParticlesF9 = 1000; // the maximum number of active particles
ArrayList <ParticleF9> particlesF9 = new ArrayList <ParticleF9> (); // the list of particles
float fc001;
int angleNoise = 0;
int vectorNoise = 0;
float maxLifeToggle = 1;
/* fction10variables */
float maxLifeF10 = 1.25;
float minLifeF10 = 0.75;
int maxParticlesF10 = 1000; // the maximum number of active particles
ArrayList <ParticleF10> particlesF10 = new ArrayList <ParticleF10> (); // the list of particles
float globalRotation;
//---------------------------------------------------v
/* fction#variables */
//---------------------------------------------------^
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(900, 500);
  smooth(16);
  pg = createGraphics(width, height, JAVA2D);
  //  pg.colorMode(HSB, 360, 100, 100);
  colorMode(HSB, 360, 100, 100);
  //colorMode(HSB, 1);
  if (frame != null) {
    frame.setResizable(true); //surface vs. frame > processing 2 vs. 3
    background(bcgHue, bcgSat, bcgBri);
  }
  initializeFontList();
  background(bcgHue, bcgSat, bcgBri);

  /* Geomerative text object setup */
  RG.init(this);
  RCommand.setSegmentLength(segment);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myFONT = new RFont(activeFont, activeFontSize, RFont.CENTER);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();
  // ------ set style and segment resolution  ------
  //RCommand.setSegmentStep(10);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // -----------------------------------------------
  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);
  // -----------------------------------------------
  //myGroup = myGroup.toPolygonGroup();

  /* text location */
  centerX = lastCenterX = width/2;
  centerY = lastCenterY = (height/3)*2;
  /* f3 init */
  myAgents3 = new FontAgent3[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myAgents3[i] = new FontAgent3(new PVector(myPoints[i].x, myPoints[i].y));
  }
  /* f4 init */
  myAgents4 = new FontAgent4[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myAgents4[i] = new FontAgent4(new PVector(myPoints[i].x, myPoints[i].y));
  }
  /* f7,8,9,10 init */
  resetF7();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  frameRate(frmRt);
  /* sets GUI in the very beginning */
  if (firstDrawRun) {
    setGUI();
    setFunctionMenus();
    firstDrawRun = false;
  }
  //background(bcgHue, bcgSat, bcgBri);

  /* dropdown list changes font */
  if (activeFont != selectedFont) {
    activeFont = selectedFont;
    myFONT =  new RFont(activeFont, activeFontSize, RFont.CENTER);
    myGroup = myFONT.toGroup(textTyped);
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
  /* changes size of MyFont */
  if (activeFontSize != fontSize) { 
    activeFontSize = fontSize;
    myFONT.setSize(activeFontSize);
    xxx += 0.01;
    yyy += 0.01;
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
  //---------------------------------------------------v
  /* moving text while menus closed */
  if ((mousePressed == true)
    &&(!f1Menu.isVisible())&&(!f2Menu.isVisible())&&(!f3Menu.isVisible())&&(!f4Menu.isVisible())
    &&(!f5Menu.isVisible())&&(!f6Menu.isVisible())&&(!f7Menu.isVisible())&&(!f8Menu.isVisible())
    &&(!f9Menu.isVisible())&&(!f10Menu.isVisible())) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;

    resetF7();
  }
  //---------------------------------------------------^
  /* change Menu dimensions with screen resize */
  if (lastHeight != height || lastWidth != width) {
    lastWidth = width;
    lastHeight = height;
    pg = createGraphics(width, height, JAVA2D);
    gMenu.hide();
    if (gMenu.isOpen()) {
      gMenuOpenness = true;
      background(bcgHue, bcgSat, bcgBri);
      setGUI();
    } else {
      gMenuOpenness = false;  
      background(bcgHue, bcgSat, bcgBri);
      setGUI();
    }
    gMenu.show();
    if (f1Menu.isVisible()) {
      f1Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f1Menu.show();
      publicMenu.show();
    } else if (f2Menu.isVisible()) {
      f2Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f2Menu.show();
      publicMenu.show();
    } else if (f3Menu.isVisible()) {
      f3Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f3Menu.show();
      publicMenu.show();
    } else if (f4Menu.isVisible()) {
      f4Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f4Menu.show();
      publicMenu.show();
    } else if (f5Menu.isVisible()) {
      f5Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f5Menu.show();
      publicMenu.show();
    } else if (f6Menu.isVisible()) {
      f6Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f6Menu.show();
      publicMenu.show();
    } else if (f7Menu.isVisible()) {
      f7Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f7Menu.show();
      publicMenu.show();
    } else if (f8Menu.isVisible()) {
      f8Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f8Menu.show();
      publicMenu.show();
    } else if (f9Menu.isVisible()) {
      f9Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f9Menu.show();
      publicMenu.show();
    } else if (f10Menu.isVisible()) {
      f10Menu.hide();
      publicMenu.hide();
      setFunctionMenus();
      f10Menu.show();
      publicMenu.show();
    } else {
      setFunctionMenus();
    }
    //---------------------------------------------------v
    //if (f#Menu.isVisible()) {
    //  f#Menu.hide();
    //  publicMenu.hide();
    //  setFunctionMenus();
    //  f#Menu.show();
    //  publicMenu.show();
    //}
    //---------------------------------------------------^
  }
  
  if(f8Menu.isVisible()||f9Menu.isVisible()||f10Menu.isVisible()){
    myGUI.getController("vectorPDF").show();
  } else {
   myGUI.getController("vectorPDF").hide(); 
  }
    
  // .............................................................................................................................................................................. //
  /* TEXT OBJECT DISPLAY */
  if (saveOneFrame) {
    beginRecord(PDF, savePath + ".pdf");
    colorMode(HSB, 360, 100, 100);
  }
  if (vectorPDFOn) {    
    beginRecord(PDF, savePath + ".pdf");
    colorMode(HSB, 360, 100, 100);
  }
  pushMatrix();
  translate(centerX, centerY);
  /* basic text */
  //---------------------------------------------------v
  if ((!f1Menu.isVisible())&&(!f2Menu.isVisible())&&(!f3Menu.isVisible())
    &&(!f4Menu.isVisible())&&(!f5Menu.isVisible())&&(!f6Menu.isVisible())
    &&(!f7Menu.isVisible())&&(!f8Menu.isVisible())&&(!f9Menu.isVisible())
    &&(!f10Menu.isVisible())) {

    background(bcgHue, bcgSat, bcgBri);

    pushMatrix();
    fill(textHue, textSat, textBri);
    myFONT.draw(textTyped);
    popMatrix();
  }
  //---------------------------------------------------^
  /* f1 */
  if (f1Menu.isVisible()) {
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      //segment = 3;
      f1();
    }
  } else /* f2 */ if (f2Menu.isVisible()) {
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      //segment = 8;
      f2();
    }
  } else /* f3 */ if (f3Menu.isVisible()) {
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      f3();
    }
  } else /* f4 */ if (f4Menu.isVisible()) {
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      f4();
    }
  } else /* f5 */ if (f5Menu.isVisible()) {
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      f5();
    }
  } else /* f6 */ if (f6Menu.isVisible()) {
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      f6();
    }
  }
  //---------------------------------------------------v
  //else /* f# */ if (f#Menu.isVisible()) {
  //background(bcgHue, bcgSat, bcgBri);
  //if (textTyped.length() > 0) {
  //  f#();
  //}
  //}
  //---------------------------------------------------^
  popMatrix();

  if (f7Menu.isVisible()) {   
    background(bcgHue, bcgSat, bcgBri);
    if (textTyped.length() > 0) {
      f7();
    }
  } else if (f8Menu.isVisible()) {    
    if (textTyped.length() > 0) {
      f8();
    }
  } else if (f9Menu.isVisible()) {    
    if (textTyped.length() > 0) {
      f9();
    }
  } else if (f10Menu.isVisible()) {    
    if (textTyped.length() > 0) {
      f10();
    }
  }

  if (saveOneFrame) {
    endRecord();
    saveOneFrame = false;
    //counter++;
  }
}







//--------------------------END--------------------------OF--------------------------MAIN----------------------------------------------------------------------------------------------
/*
.setGUI by slo rozdelit na dve casti: jedna na zacatku pro init, druha pro srovnavani velikosti >> when you know how many buttons and stuff
 */
