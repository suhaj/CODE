ControlP5 myGUI;
Group gMenu;
Group f1Menu;
Group f2Menu;
Group f3Menu;
RadioButton rb1;

boolean gMenuOpenness = true;

boolean firstF1run = false;
boolean firstF2run = false;
boolean firstF3run = false;

void setGUI() {
  myGUI = new ControlP5(this);
  //the argument "this" tells cP5 I'm refering to this sketch
  
  gMenu = myGUI.addGroup("gMenu") //top menu group
    .setPosition(0, 10)
    .setWidth(width)
    .setBackgroundHeight(30)
    .setBackgroundColor(color(200, 200, 200, 40))
    .setLabel("Menu")  
    .setOpen(gMenuOpenness)
    ;

  List l = Arrays.asList(fontList);
  myGUI.addScrollableList("fonts") //font dropdown
    .setPosition(0, 3)
    .setSize(99, 300)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l)
    .setOpen(false)
    .setGroup(gMenu);

  myGUI.addButton("Save as PDF", 1, 100, 3, 99, 20)
    .setGroup(gMenu);
  myGUI.addButton("Undo", 1, width - 110, 3, 99, 20)
    .setGroup(gMenu);
  //myGUI.addButton("function1", 1, 400, 3, 99, 20)
  //  .setGroup(gMenu),
  //  .setLabel("Function 1");
  //myGUI.addButton("function2", 1, 500, 3, 99, 20)
  //  .setGroup(gMenu),
  //  .setLabel("Function 2")
  rb1 = myGUI.addRadioButton("function1")
    .setPosition(300, 3)
    .setSize(99, 20)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setItemsPerRow(5)
    .setSpacingColumn(3)
    .addItem("function 1", 1)
    .addItem("function 2", 2)
    .addItem("function 3", 3)
    .setGroup(gMenu);

  for (Toggle t : rb1.getItems()) {
    t.getCaptionLabel().getStyle().movePadding(0, 0, 0, -75);
  }
}

void fonts(int n) {
  selectedFont = fontList[n];
  System.out.println(selectedFont);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(rb1)) {
    //System.out.println(theEvent.getGroup().getValue());
    switch(int(theEvent.getGroup().getValue())) {
    case 1:
      //System.out.println("A");
      if (!firstF1run) {
        f1Menu = myGUI.addGroup("f1Menu")
          .setPosition(0, 100)
          .setWidth(width)
          .setBackgroundHeight(30)
          .setBackgroundColor(color(200, 200, 200, 40))
          .setLabel("f1")
          ;
        firstF1run=true;
      }
      if (f2Menu.isOpen()) {
        //f2Menu.hide();
        //f2Menu.show();
        f2Menu.setOpen(false);
      }
      if (f3Menu.isOpen()) {
        f3Menu.setOpen(false);
      }
      f1Menu.setOpen(true);
      break;
    case 2:
      //System.out.println("B");
      if (!firstF2run) {
        f2Menu = myGUI.addGroup("f2Menu")
          .setPosition(0, 100)
          .setWidth(width)
          .setBackgroundHeight(30)
          .setBackgroundColor(color(200, 200, 200, 40))
          .setLabel("f2")
          ;
        firstF2run=true;
      }
      if (f1Menu.isOpen()) {
        f1Menu.setOpen(false);
      }
      if (f3Menu.isOpen()) {
        f3Menu.setOpen(false);
      }
      f2Menu.setOpen(true);
      break;
    case 3:
      //System.out.println("C");
      if (!firstF3run) {
        f3Menu = myGUI.addGroup("f3Menu")
          .setPosition(0, 100)
          .setWidth(width)
          .setBackgroundHeight(30)
          .setBackgroundColor(color(200, 200, 200, 40))
          .setLabel("f3")
          ;
        firstF3run=true;
      }
      if (f1Menu.isOpen()) {
        f1Menu.setOpen(false);
      }
      if (f2Menu.isOpen()) {
        f2Menu.setOpen(false);
      }
      f3Menu.setOpen(true);
      break;
    default:
    System.out.println("Function button error on 'switch'");
    }
  }
  
  
  /*
  if (theEvent.controllerGroup().getName() == "function 1") {
   if (!firstF1run) {
   f1Menu = myGUI.addGroup("f1Menu")
   .setPosition(0, 100)
   .setWidth(width)
   .setBackgroundHeight(30)
   .setBackgroundColor(color(200, 200, 200, 40))
   .setLabel("f1")
   ;
   firstF1run=true;
   }
   System.out.println("H");
   f1Menu.setOpen(true);
   //radio();
   }
   if (theEvent.controller().getName() == "function 2") {
   if (!firstF2run) {
   f2Menu = myGUI.addGroup("f2Menu")
   .setPosition(0, height-40)
   .setWidth(width)
   .setBackgroundHeight(30)
   .setBackgroundColor(color(200, 200, 200, 40))
   .setLabel("f2")
   ;
   firstF2run=true;
   }
   }
   if (theEvent.controller().getName() == "function 3") {
   if (!firstF3run) {
   f3Menu = myGUI.addGroup("f3Menu")
   .setPosition(0, height-40)
   .setWidth(width)
   .setBackgroundHeight(30)
   .setBackgroundColor(color(200, 200, 200, 40))
   .setLabel("f3")
   ;
   firstF3run=true;
   }
   }*/


  //if (theEvent.isFrom(r1)) {
  //  myColorBackground = color(int(theEvent.getGroup().getValue()*50), 0, 0); //the action
  //}
}

void function1 () {
  //if na první spuštění kde se inicializuje grupa
  //pak se jen vyvolá s uloženýma věcma :)))
}