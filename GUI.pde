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

  myGUI.addButton("Save as PDF", 1, 100, 3, 99, 20) //buttons
    .setGroup(gMenu)
    ;

  rb1 = myGUI.addRadioButton("function1") //radio buttons
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
    .setGroup(gMenu);

  for (Toggle t : rb1.getItems()) { //radio buttons' padding
    t.getCaptionLabel().getStyle().movePadding(0, 0, 0, -75);
  }
}

void setFunctionMenus() {
  f1Menu = myGUI.addGroup("f1Menu") //f1 menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(200, 200, 200, 40))
    .setLabel("f1")  
    .hideBar()
    .hide()
    ;
  f2Menu = myGUI.addGroup("f2Menu") //f2 menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(200, 200, 200, 40))
    .setLabel("f2")  
    .hideBar()
    .hide()
    ;
  f3Menu = myGUI.addGroup("f3Menu") //f3 menu group
    .setPosition(0, height-100)
    .setWidth(width)
    .setBackgroundHeight(100)
    .setBackgroundColor(color(200, 200, 200, 40))
    .setLabel("f3")  
    .hideBar()
    .hide()
    ;

  setf1MenuButtons();
  setf2MenuButtons();
  setf3MenuButtons();
}

//az bude jasne kolik bude cudlu na fce, mohly by se inicializovat pres volani fce, tj. cyklem