ControlP5 myGUI;
Group gMenu;
Group f1Menu;
Group f2Menu;
Group f3Menu;
RadioButton rb1;

int i=100;

boolean gMenuOpenness = true;
int lastWidth;
PFont myFont;

String[] fontList = PFont.list(); //all installed fonts
String activeFont = "Comic Sans"; //default font
String selectedFont = activeFont;

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

  myGUI.addButton("Save as PDF", 1, 100, 3, 99, 20) //buttons
    .setGroup(gMenu);

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
}

void fonts(int n) { //list of installed fonts
  selectedFont = fontList[n];
  System.out.println(selectedFont);
}

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

//az bude jasne kolik bude cudlu na fce, mohly by se inicializovat pres volani fce