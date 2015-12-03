/* top menu group init */
void setGUI() { 
  myGUI = new ControlP5(this); //the argument "this" tells cP5 I'm refering to this sketch
  /* top menu group */
  gMenu = myGUI.addGroup("gMenu")
    .setPosition(0, 10)
    .setWidth(width)
    .setBackgroundHeight(30)
    .setBackgroundColor(color(230, 230, 230, 160))
    .setLabel("Menu")  
    .setOpen(gMenuOpenness)
    ;
  /* Array to List for CP5 Scrollable List, Scrollable List */
  String[] TTFFontArray = new String[TTFFontList.size()];
  for (int i = 0; i < TTFFontList.size(); i++ ) {
    TTFFontArray[i] = TTFFontList.get(i);
  }
  List l = Arrays.asList(TTFFontArray);
  myGUI.addScrollableList("fonts") //font dropdown
    .setPosition(0, 3)
    .setSize(99, 300)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l)
    .setOpen(false)
    .setGroup(gMenu)
    ;

  myGUI.addSlider("fontSize")
    .setPosition(103, 3)
    .setSize(99, 20)
    .setRange(1, 1000)
    .setLabel("text size")  
    .setGroup(gMenu)
    .setColorLabel(255)
    ;
  myGUI.getController("fontSize").getValueLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);
  myGUI.getController("fontSize").getCaptionLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  /* Public segment slider */
  myGUI.addSlider("segment")
    .setPosition(500, height - 90)
    .setWidth(300)
    .setRange(1, 100)
    .setColorLabel(0)
    .hide()
    ;
  /* Public noLoop switch */
  myGUI.addToggle("stopMotion")
    .setPosition(500, height - 70)
    .setSize(50, 20)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    .hide()
    ;
  /* Save PDF button */
  myGUI.addButton("Save as PDF", 1, width - 99, 3, 99, 20)
    .setGroup(gMenu)
    ;
  //void keyPressed() {
  //  if (key == ' ') {
  //    saveFrame("captures/capture_"+(new Date().getTime())+".tiff");
  //    println("save TIFF");
  //  }
  //}
  
  /* function (radio) buttons */
  rb1 = myGUI.addRadioButton("function1")
    .setPosition(300, 3)
    .setSize(99, 20)
    .setColorForeground(color(120))
    .setColorActive(color(200))
    .setColorLabel(color(255))
    .setItemsPerRow(5)
    .setSpacingColumn(3)
    .addItem("function 1", 1)
    .addItem("function 2", 2)
    .addItem("function 3", 3)
    .addItem("function 4", 4)
    //---------------------------------------------------v
    //.addItem("function #", ##)
    //---------------------------------------------------^
    .setGroup(gMenu);
  /* function (radio) buttons'padding */
  for (Toggle t : rb1.getItems()) {
    t.getCaptionLabel().getStyle().movePadding(0, 0, 0, -75);
  }
}

/* Radio button toggling */
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(rb1)) {
    if (theEvent.getGroup().getValue()==1) {
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f1Menu.show();
    }
    if (theEvent.getGroup().getValue()==2) {
      f1Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f2Menu.show();
    }
    if (theEvent.getGroup().getValue()==3) {
      f1Menu.hide();
      f2Menu.hide();
      f4Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f3Menu.show();
    }
    if (theEvent.getGroup().getValue()==4) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f4Menu.show();
    }
    //---------------------------------------------------v
    //if (theEvent.getGroup().getValue()==#) {
    //  f##Menu.hide();
    //  f##Menu.hide();
    //  //---------------------------------------------------v
    //  //f#Menu.hide();
    //  //---------------------------------------------------^
    //  f#Menu.show();
    //}
    //---------------------------------------------------^
    if (theEvent.getGroup().getValue()==-1) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
    }
  }
}

//....................................................................................................................................................................................
//....................................................................................................................................................................................

/* fuction menus group init */
void setFunctionMenus() {
  f1Menu = myGUI.addGroup("f1Menu") //f1 menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(230, 230, 230, 160))
    .setLabel("f1")  
    .hideBar()
    .hide()
    ;
  f2Menu = myGUI.addGroup("f2Menu") //f2 menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(230, 230, 230, 160))
    .setLabel("f2")  
    .hideBar()
    .hide()
    ;
  f3Menu = myGUI.addGroup("f3Menu") //f3 menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(230, 230, 230, 160))
    .setLabel("f3")  
    .hideBar()
    .hide()
    ;
  f4Menu = myGUI.addGroup("f4Menu") //f# menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(230, 230, 230, 160))
    .setLabel("f4")  
    .hideBar()
    .hide()
    ;
  //---------------------------------------------------v
  //f#Menu = myGUI.addGroup("f#Menu") //f# menu group
  //.setPosition(0, height-100)
  //.setWidth(width)
  //.setBackgroundHeight(100)
  //.setBackgroundColor(color(230, 230, 230, 160))
  //.setLabel("f#")  
  //.hideBar()
  //.hide()
  //;
  //---------------------------------------------------^

  /* function menu buttons init */
  setf1MenuButtons();
  setf2MenuButtons();
  setf3MenuButtons();
  setf4MenuButtons();
  //---------------------------------------------------v
  //setf#MenuButtons();
  //---------------------------------------------------^
}

//....................................................................................................................................................................................
//....................................................................................................................................................................................

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
}
void setf2MenuButtons() {
  myGUI.addSlider("xxx")
    .setPosition(10, 10)
    .setWidth(300)
    .setRange(0, 50)
    .setGroup(f2Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("yyy")
    .setPosition(10, 30)
    .setWidth(300)
    .setRange(0, 50)
    .setGroup(f2Menu)
    .setColorLabel(0)
    ;
  //myGUI.addSlider("segment")
  //  .setPosition(10, 50)
  //  .setWidth(300)
  //  .setRange(1, 100)
  //  .setGroup(f2Menu)
  //  .setColorLabel(0)
  //  ;
}
void setf3MenuButtons() {
  myGUI.addSlider("noiseVariation")
    .setPosition(10, 10)
    .setWidth(300)
    .setRange(0, 800)
    .setGroup(f3Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("nervousMotion")
    .setPosition(10, 30)
    .setWidth(300)
    .setRange(0, 350)
    .setGroup(f3Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("step")
    .setPosition(10, 50)
    .setWidth(300)
    .setRange(0, 50)
    .setGroup(f3Menu)
    .setColorLabel(0)
    ;
}
void setf4MenuButtons() {
  myGUI.addSlider("mousex")
    .setPosition(10, 10)
    .setWidth(300)
    .setRange(0, 800)
    .setGroup(f4Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("mousey")
    .setPosition(10, 30)
    .setWidth(300)
    .setRange(0, 450)
    .setGroup(f4Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("factorx")
    .setPosition(10, 50)
    .setWidth(300)
    .setRange(0, 175)
    .setGroup(f4Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("factory")
    .setPosition(10, 70)
    .setWidth(300)
    .setRange(0, 175)
    .setGroup(f4Menu)
    .setColorLabel(0)
    ;
}
//---------------------------------------------------v
//void setf#MenuButtons() {
//{
//---------------------------------------------------^

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






//--------------------------END--------------------------OF--------------------------GUI-----------------------------------------------------------------------------------------------
//az bude jasne kolik bude cudlu na fce, mohly by se inicializovat pres volani fce, tj. cyklem