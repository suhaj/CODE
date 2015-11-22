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