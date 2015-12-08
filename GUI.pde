/* top menu group init */
void setGUI() { 
  myGUI = new ControlP5(this); //the argument "this" tells cP5 I'm refering to this sketch
  /* top menu group */
  gMenu = myGUI.addGroup("gMenu")
    .setPosition(0, 10)
    .setWidth(width)
    .setBackgroundHeight(30 + int(20*cos((width/1000)*(HALF_PI))) + int(20*cos((width/1000)*(HALF_PI))*cos((convert(width/100)/10)*(HALF_PI))))
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("Menu")  
    .setOpen(gMenuOpenness)
    ;
    //System.out.println(width/100 + " " + convert(width/100)/10 + " " + cos((convert(width/100)/10)*(HALF_PI)));
    
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
  /* Public noLoop switch */
  //myGUI.addToggle("stopMotion")
  //  .setPosition(500, height - 70)
  //  .setSize(50, 20)
  //  .setValue(true)
  //  .setMode(ControlP5.SWITCH)
  //  .hide()
  //  ;
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
    .setItemsPerRow(width/100 - 5)
    .setSpacingColumn(3)
    .addItem("function 1", 1)
    .addItem("function 2", 2)
    .addItem("function 3", 3)
    .addItem("function 4", 4)
    .addItem("function 5", 5)
    .addItem("function 6", 6)
    //---------------------------------------------------v
    //.addItem("function #", ##)
    //---------------------------------------------------^
    .setGroup(gMenu)
    ;
    System.out.println(width/100);
  /* function (radio) buttons'padding */
  for (Toggle t : rb1.getItems()) {
    t.getCaptionLabel().getStyle().movePadding(0, 0, 0, -75);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Radio button toggling */
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(rb1)) {
    if (theEvent.getGroup().getValue()==1) {
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f1Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==2) {
      f1Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f2Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==3) {
      f1Menu.hide();
      f2Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f3Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==4) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f4Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==5) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f6Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f5Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==6) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f6Menu.show();
      publicMenu.show();
    }
    //---------------------------------------------------v
    //else if (theEvent.getGroup().getValue()==#) {
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
      f5Menu.hide();
      f6Menu.hide();
      publicMenu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* fuction menus group init */
void setFunctionMenus() {
  f1Menu = myGUI.addGroup("f1Menu") //f1 menu group
    .setPosition(0, height-100)
    .setWidth(width-400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("f1")  
    .hideBar()
    .hide()
    ;
  f2Menu = myGUI.addGroup("f2Menu") //f2 menu group
    .setPosition(0, height-100)
    .setWidth(width-400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("f2")  
    .hideBar()
    .hide()
    ;
  f3Menu = myGUI.addGroup("f3Menu") //f3 menu group
    .setPosition(0, height-100)
    .setWidth(width-400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("f3")  
    .hideBar()
    .hide()
    ;
  f4Menu = myGUI.addGroup("f4Menu") //f4 menu group
    .setPosition(0, height-100)
    .setWidth(width-400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("f4")  
    .hideBar()
    .hide()
    ;
  f5Menu = myGUI.addGroup("f5Menu") //f5 menu group
    .setPosition(0, height-100)
    .setWidth(width-400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("f5")  
    .hideBar()
    .hide()
    ;
  f6Menu = myGUI.addGroup("f6Menu") //f6 menu group
    .setPosition(0, height-100)
    .setWidth(width-400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .setLabel("f6")  
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
  publicMenu = myGUI.addGroup("publicMenu") //public menu group
    .setPosition(width - 400, height-100)
    .setWidth(400)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(0, 0, 80, 90))
    .hideBar()
    .hide()
    ;  

  /* function menu buttons init */
  setf1MenuButtons();
  setf2MenuButtons();
  setf3MenuButtons();
  setf4MenuButtons();
  setf5MenuButtons();
  setf6MenuButtons();
  //---------------------------------------------------v
  //setf#MenuButtons();
  //---------------------------------------------------^
  setPublicMenuButtons();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  myGUI.addSlider("factor")
    .setPosition(10, 50)
    .setWidth(300)
    .setRange(-1.5, 1.5)
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  myGUI.addSlider("distMin")
    .setLabel("minimal connect distance")
    .setPosition(10, 70)
    .setWidth(300)
    .setRange(0, 60)
    .setGroup(f2Menu)
    .setColorLabel(0)
    ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
void setf5MenuButtons() {
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setf6MenuButtons() {
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------------------------v
//void setf#MenuButtons() {
//}
//---------------------------------------------------^
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setPublicMenuButtons() {
  myGUI.addSlider("textHue")
    .setPosition(10, 10)
    .setWidth(100)
    .setRange(0, 360)
    .setLabel("text hue")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("textSat")
    .setPosition(10, 23)
    .setWidth(100)
    .setRange(0, 100)
    .setLabel("text saturation")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("textBri")
    .setPosition(10, 36)
    .setWidth(100)
    .setRange(0, 100)
    .setLabel("text brightness")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;

  myGUI.addSlider("bcgHue")
    .setPosition(10, 56)
    .setWidth(100)
    .setRange(0, 360)
    .setLabel("background hue")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("bcgSat")
    .setPosition(10, 69)
    .setWidth(100)
    .setRange(0, 100)
    .setLabel("background saturation")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("bcgBri")
    .setPosition(10, 82)
    .setWidth(100)
    .setRange(0, 100)
    .setLabel("background brightness")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;    

  myGUI.addSlider("segment")
    .setPosition(230, 10)
    .setWidth(100)
    .setRange(1, 100)
    .setLabel("segmentation")
    .setGroup(publicMenu)
    .setColorLabel(0)
    ;
}








//--------------------------END--------------------------OF--------------------------GUI-----------------------------------------------------------------------------------------------
//az bude jasne kolik bude cudlu na fce, mohly by se inicializovat pres volani fce, tj. cyklem