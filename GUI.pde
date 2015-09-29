ControlP5 myGUI;
Group gMenu; 

void setGUI() {
  myGUI = new ControlP5(this);
  //the argument "this" tells cP5 I'm refering to this sketch
  gMenu = myGUI.addGroup("gMenu")
    .setPosition(0, 10)
    .setWidth(width)
    .setBackgroundHeight(30)
    .setBackgroundColor(color(200, 200, 200, 40))
    .setLabel("Menu")
    ;

  List l = Arrays.asList(fontList);
  myGUI.addScrollableList("fonts")
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
  myGUI.addButton("function1", 1, 400, 3, 99, 20)
    .setGroup(gMenu),
    .setLabel("Function 1");
  myGUI.addButton("function2", 1, 500, 3, 99, 20)
    .setGroup(gMenu),
    .setLabel("Function 2");
}

void fonts(int n) {
  selectedFont = fontList[n];
  System.out.println(selectedFont);
}

void function1 (){
  //if na první spuštění kde se inicializuje grupa
  //pak se jen vyvolá s uloženýma věcma :)))
}