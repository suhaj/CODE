int fontSize = 200;
int activeFontSize = fontSize;
/////////////////////////////////////////////////////////////////////should be in gMenu really, is in setF1MenuButtons, f1Menu

float stepSize = 0;
float dancefactor = 0;

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(rb1)) {
    if (theEvent.getGroup().getValue()==1) {
      f2Menu.hide();
      f3Menu.hide();
      f1Menu.show();
      //keby tak, jen blikne
      //rect(i,i,i,i);
      //i+=10;
    }
    if (theEvent.getGroup().getValue()==2) {
      f1Menu.hide();
      f3Menu.hide();
      f2Menu.show();
    }
    if (theEvent.getGroup().getValue()==3) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.show();
    }
    if (theEvent.getGroup().getValue()==-1) {
      f2Menu.hide();
      f3Menu.hide();
      f1Menu.hide();
    }
  }
}

void setf1MenuButtons() {
  myGUI.addSlider("fontSize")
    .setPosition(10, 10)
    .setRange(1, 1000)
    .setLabel("Font size")  
    .setGroup(f1Menu)
    ;
  myGUI.addSlider("stepSize")
    .setPosition(10, 30)
    .setRange(1, 1000)
    .setLabel("Step size")  
    .setGroup(f1Menu)
    ;
  myGUI.addSlider("danceFactor")
    .setPosition(100, 50)
    .setRange(1, 1000)
    .setLabel("Dance Factor")  
    .setGroup(f1Menu)
    ;
}
void setf2MenuButtons() {
}
void setf3MenuButtons() {
}