int fontSize = 200;
int activeFontSize = fontSize;

//float lineSpacing = fontSize*1.1;
//float letterY = lineSpacing;

//float stepSize = 0;
//float dancefactor = 0;

float verticalStretch = 0;
float horizontalStretch = 0;
int segment = 5;

/* function menu buttons init */
void setf1MenuButtons() {
  myGUI.addSlider("horizontalStretch")
    .setPosition(10, 10)
    .setWidth(300)
    .setRange(-1000, 1000)
    .setLabel("Horizontal stretch")  
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("verticalStretch")
    .setPosition(10, 30)
    .setWidth(300)
    .setRange(-1000, 1000)
    .setLabel("Vertical stretch")  
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("segment")
    .setPosition(10, 50)
    .setWidth(300)
    .setRange(1, 100)
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
  //myGUI.addToggle("f1toggle")
  //.setLabel("")
  // .setPosition(10,70)
  // .setSize(50,20)
  // //.setValue(false)
  // .setMode(ControlP5.SWITCH)
  // .setGroup(f1Menu)
  // ;
}
void setf2MenuButtons() {
  //myGUI.addSlider("stepSize")
  //  .setPosition(10, 30)
  //  .setRange(1, 1000)
  //  .setLabel("Step size")  
  //  .setGroup(f2Menu)
  //  .setColorLabel(0)
  //  ;
  //myGUI.addSlider("danceFactor")
  //  .setPosition(10, 50)
  //  .setRange(1, 1000)
  //  .setLabel("Dance Factor")  
  //  .setGroup(f2Menu)
  //  .setColorLabel(0)
  //  ;
}
void setf3MenuButtons() {
}

void f2particles() {
  particles = new ArrayList();
  for (int i=0; i<myPoints.length; i++) {
    particles.add(new Particle(myPoints[i].x, myPoints[i].y, 3));
  }
}

void f1() {
  noFill();
  stroke(0);
  strokeWeight(0.3);

  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  for (int i=0; i<myPoints.length; i++) {
    //zvaž obecně pro fce místo konstant fuknkce
    ellipse(myPoints[i].x, myPoints[i].y, myPoints[i].x+horizontalStretch, myPoints[i].y+verticalStretch);
  }
}
//void f2() {

//}