/* top menu group init */
void setGUI() { 
  myGUI = new ControlP5(this); //the argument "this" tells cP5 I'm refering to this sketch
  /* top menu group */
  gMenu = myGUI.addGroup("gMenu")
    .setPosition(0, 10)
      .setWidth(width)
        //.setBackgroundHeight(30 + int(20*cos((width/1000)*(HALF_PI))) + int(20*cos((width/1000)*(HALF_PI))*cos((convert(width/100)/10)*(HALF_PI))))
        .setBackgroundHeight(50)
          .setBackgroundColor(color(0, 0, 80, 90))
            .setLabel("Menu")  
              .setOpen(gMenuOpenness)
                ;
  //System.out.println(width/100 + " " + convert(width/100)/10 + " " + cos((convert(width/100)/10)*(HALF_PI)));

  /* Array to List for CP5 Scrollable List, Scrollable List */
  String[] TTFFontArray = new String[TTFFontList.size()];
  for (int i = 0; i < TTFFontList.size (); i++ ) {
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
  myGUI.addButton("savePDF")
    .setPosition(width - 99, 3)
      .setSize(99, 20)
        .setLabel("Save as PDF")
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
                              .addItem("function 7", 7)
                                .addItem("function 8", 8)
                                  .addItem("function 9", 9)
                                    .addItem("function 10", 10)
                                      //---------------------------------------------------v
                                      //.addItem("function #", #)
                                      //---------------------------------------------------^
                                      .setGroup(gMenu)
                                        ;
  //System.out.println(width/100);
  /* function (radio) buttons'padding */
  for (Toggle t : rb1.getItems ()) {
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f6Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==7) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f7Menu.show();
      publicMenu.show();
    } else if (theEvent.getGroup().getValue()==8) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      f7Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f8Menu.show();
      publicMenu.show();
      background(bcgHue, bcgSat, bcgBri);
      pg.colorMode(HSB, 360, 100, 100);
      pg.background(bcgHue, bcgSat, bcgBri);
    } else if (theEvent.getGroup().getValue()==9) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      f7Menu.hide();
      f8Menu.hide();
      f10Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f9Menu.show();
      publicMenu.show();
      background(bcgHue, bcgSat, bcgBri);
      pg.colorMode(HSB, 360, 100, 100);
      pg.background(bcgHue, bcgSat, bcgBri);
    } else if (theEvent.getGroup().getValue()==10) {
      f1Menu.hide();
      f2Menu.hide();
      f3Menu.hide();
      f4Menu.hide();
      f5Menu.hide();
      f6Menu.hide();
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      //---------------------------------------------------v
      //f#Menu.hide();
      //---------------------------------------------------^
      f10Menu.show();
      publicMenu.show();
      background(bcgHue, bcgSat, bcgBri);
      pg.colorMode(HSB, 360, 100, 100);
      pg.background(bcgHue, bcgSat, bcgBri);
    } 
    //---------------------------------------------------v
    //else if (theEvent.getGroup().getValue()==#) {
    //  f1Menu.hide();
    //  f2Menu.hide();
    //  f3Menu.hide();
    //  f4Menu.hide();
    //  f5Menu.hide();
    //  f6Menu.hide();
    //  f7Menu.hide();
    //  f8Menu.hide();
    //  f9Menu.hide();
    //  f10Menu.hide();
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
      f7Menu.hide();
      f8Menu.hide();
      f9Menu.hide();
      f10Menu.hide();
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
  f7Menu = myGUI.addGroup("f7Menu") //f7 menu group
      .setPosition(0, height-100)
      .setWidth(width-400)
        .setBackgroundHeight(100)
          .setBackgroundColor(color(0, 0, 80, 90))
            .setLabel("f7")  
              .hideBar()
                .hide()
                  ;
  f8Menu = myGUI.addGroup("f8Menu") //f8 menu group
      .setPosition(0, height-100)
      .setWidth(width-400)
        .setBackgroundHeight(100)
          .setBackgroundColor(color(0, 0, 80, 90))
            .setLabel("f8")  
              .hideBar()
                .hide()
                  ;
  f9Menu = myGUI.addGroup("f9Menu") //f9 menu group
      .setPosition(0, height-100)
      .setWidth(width-400)
        .setBackgroundHeight(100)
          .setBackgroundColor(color(0, 0, 80, 90))
            .setLabel("f9")  
              .hideBar()
                .hide()
                  ;
  f10Menu = myGUI.addGroup("f10Menu") //f10 menu group
      .setPosition(0, height-100)
      .setWidth(width)
        .setBackgroundHeight(100)
          .setBackgroundColor(color(0, 0, 80, 90))
            .setLabel("f10")  
              .hideBar()
                .hide()
                  ;
  //---------------------------------------------------v
  //f#Menu = myGUI.addGroup("f#Menu") //f# menu group
  //.setPosition(0, height-100)
  //.setWidth(width)
  //.setBackgroundHeight(100)
  //.setBackgroundColor(color(0, 0, 80, 90))
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
  setf7MenuButtons();
  setf8MenuButtons();
  setf9MenuButtons();
  setf10MenuButtons();
  //---------------------------------------------------v
  //setf#MenuButtons();
  //---------------------------------------------------^
  setPublicMenuButtons();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* function menu buttons init */
void setf1MenuButtons() {
  s = myGUI.addSlider2D("wave")
    .setPosition(10, 10)
      .setSize(80, 80)
        .setMinMax(-400, -400, 400, 400)
          .setValue(0, 50)
            .setGroup(f1Menu)
              .disableCrosshair()
                ;
  myGUI.addSlider("factor")
    .setPosition(100, 10)
      .setWidth(200)
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
        .setRange(-30, 50)
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
  myGUI.addSlider("danceFactorF5")
    .setPosition(10, 10)
      .setWidth(300)
        .setRange(0, 3)
          .setGroup(f5Menu)
            .setLabel("dance factor")
              .setColorLabel(0)
                ;
  myGUI.addSlider("stepSizeF5")
    .setPosition(10, 30)
      .setWidth(300)
        .setRange(0, 100)
          .setGroup(f5Menu)
            .setLabel("step size")
              .setColorLabel(0)
                ;
  myGUI.addSlider("connectionF5")
    .setPosition(10, 50)
      .setWidth(300)
        .setRange(0, 10)
          .setGroup(f5Menu)
            .setLabel("connection")
              .setColorLabel(0)
                ;
  myGUI.addSlider("thicknessF5")
    .setPosition(10, 70)
      .setWidth(300)
        .setRange(1, 10)
          .setGroup(f5Menu)
            .setLabel("thickness")
              .setColorLabel(0)
                ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setf6MenuButtons() {
  myGUI.addSlider("danceFactorF6")
    .setPosition(10, 10)
      .setWidth(300)
        .setRange(0, 3)
          .setGroup(f6Menu)
            .setLabel("dance factor")
              .setColorLabel(0)
                ;
  myGUI.addSlider("stepSizeF6")
    .setPosition(10, 30)
      .setWidth(300)
        .setRange(0, 100)
          .setGroup(f6Menu)
            .setLabel("step size")
              .setColorLabel(0)
                ;
  myGUI.addSlider("connectionF6")
    .setPosition(10, 50)
      .setWidth(300)
        .setRange(0, 10)
          .setGroup(f6Menu)
            .setLabel("connection")
              .setColorLabel(0)
                ;
  myGUI.addSlider("thicknessF6")
    .setPosition(10, 70)
      .setWidth(300)
        .setRange(1, 10)
          .setGroup(f6Menu)
            .setLabel("thickness")
              .setColorLabel(0)
                ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setf7MenuButtons() {
  myGUI.addSlider("filling")
    .setPosition(10, 10)
      .setWidth(300)
        .setRange(0, 2)
          .setGroup(f7Menu)
            .setColorLabel(0)
              ;
  myGUI.addSlider("numPointsGenerated")
    .setPosition(10, 30)
      .setWidth(300)
        .setRange(10, 1300)
          .setGroup(f7Menu)
            .setColorLabel(0)
              ;
  myGUI.addSlider("colorRange")
    .setPosition(10, 50)
      .setWidth(100)
        .setRange(0, 100)
          .setLabel("color range")
            .setGroup(f7Menu)
              .setColorLabel(0)
                ;
  myGUI.addButton("resetF7")
    .setPosition(10, 70)
      .setSize(60, 40)
        .setValue(0)
          .setLabel("generate")
            .setGroup(f7Menu)
              ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setf8MenuButtons() {
  myGUI.addSlider("maxParticlesF8")
    .setPosition(103, 3)
      .setSize(99, 20)
        .setRange(1, 300)
          .setLabel("number of particles")  
            .setGroup(f8Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("toggleRadius")
    .setPosition(103, 43)
      .setSize(99, 20)
        .setRange(1, 90)
          .setLabel("radius")  
            .setGroup(f8Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("lifeRateToggle")
    .setPosition(103, 63)
      .setSize(99, 20)
        .setRange(0.005, 0.05)
          .setLabel("life")  
            .setGroup(f8Menu)
              .setColorLabel(0)
                ;
  myGUI.addButton("resetF8")
    .setPosition(10, 63)
      .setSize(60, 40)
        .setValue(0)
          .setLabel("generate")
            .setGroup(f8Menu)
              ;
  myGUI.addSlider("hue8")
    .setPosition(403, 3)
      .setSize(99, 20)
        .setRange(0, 360)
          //          .setLabel("life")  
          .setGroup(f8Menu)
            .setColorLabel(0)
              ;
  myGUI.addSlider("sat8")
    .setPosition(403, 43)
      .setSize(99, 20)
        .setRange(0, 100)
          //          .setLabel("life")  
          .setGroup(f8Menu)
            .setColorLabel(0)
              ;
  myGUI.addSlider("bri8")
    .setPosition(403, 63)
      .setSize(99, 20)
        .setRange(0, 100)
          //          .setLabel("life")  
          .setGroup(f8Menu)
            .setColorLabel(0)
              ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setf9MenuButtons() {
  myGUI.addSlider("vectorNoise")
    .setPosition(103, 3)
      .setSize(99, 20)
        .setRange(0, 10)
          .setLabel("Direction randomization")  
            .setGroup(f9Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("angleNoise")
    .setPosition(103, 43)
      .setSize(99, 20)
        .setRange(0, 10)
          .setLabel("angle randomization")  
            .setGroup(f9Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("maxLifeToggle")
    .setPosition(103, 63)
      .setSize(99, 20)
        .setRange(0.1, 6)
          .setLabel("life")  
            .setGroup(f9Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("maxParticlesF9")
    .setPosition(103, 83)
      .setSize(99, 20)
        .setRange(1, 300)
          .setLabel("number of particles")  
            .setGroup(f9Menu)
              .setColorLabel(0)
                ;
  myGUI.addButton("resetF9")
    .setPosition(10, 63)
      .setSize(60, 40)
        .setValue(0)
          .setLabel("generate")
            .setGroup(f9Menu)
              ;
  myGUI.addSlider("hue9")
    .setPosition(403, 3)
      .setSize(99, 20)
        .setRange(0, 360)
          //          .setLabel("life")  
          .setGroup(f9Menu)
            .setColorLabel(0)
              ;
  myGUI.addSlider("sat9")
    .setPosition(403, 43)
      .setSize(99, 20)
        .setRange(0, 100)
          //          .setLabel("life")  
          .setGroup(f9Menu)
            .setColorLabel(0)
              ;
  myGUI.addSlider("bri9")
    .setPosition(403, 63)
      .setSize(99, 20)
        .setRange(0, 100)
          //          .setLabel("life")  
          .setGroup(f9Menu)
            .setColorLabel(0)
              ;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setf10MenuButtons() {
  myGUI.addSlider("maxParticlesF10")
    .setPosition(103, 3)
      .setSize(99, 20)
        .setRange(1, 2000)
          .setLabel("number of particles")  
            .setGroup(f10Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("maxLifeF10")
    .setPosition(103, 43)
      .setSize(99, 20)
        .setRange(0.1, 6)
          .setLabel("maximum life")  
            .setGroup(f10Menu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("minLifeF10")
    .setPosition(103, 63)
      .setSize(99, 20)
        .setRange(0.1, 6)
          .setLabel("minimum life")  
            .setGroup(f10Menu)
              .setColorLabel(0)
                ;
  myGUI.addButton("resetF10")
    .setPosition(10, 83)
      .setSize(60, 40)
        .setValue(0)
          .setLabel("generate")
            .setGroup(f10Menu)
              ;
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
        .setRange(3, 100)
          .setLabel("segmentation")
            .setGroup(publicMenu)
              .setColorLabel(0)
                ;
  myGUI.addSlider("frmRt")
    .setPosition(230, 23)
      .setWidth(100)
        .setRange(1, 60)
          .setLabel("frame rate")
            .setGroup(publicMenu)
              .setColorLabel(0)
                ;

  myGUI.addButton("vectorPDF")
    .setPosition(230, 36)
      .setSize(99, 20)
        .setLabel("Record a vector PDF")
          .setGroup(publicMenu)
            ;
}








//--------------------------END--------------------------OF--------------------------GUI-----------------------------------------------------------------------------------------------
//az bude jasne kolik bude cudlu na fce, mohly by se inicializovat pres volani fce, tj. cyklem

