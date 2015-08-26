PFont font;

void setup() {
  size(900, 500);
  if (frame != null) {
    frame.setResizable(true);
    //background(255, 255, 255);
    //if here there is no text displayed
  }
  
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Georgia", 32);
  //createFont(name, size, smooth, charset)
  fill(0,0,0);
  textFont(font);
  textAlign(CENTER, CENTER);
  //text("!@#$%", width/2, height/2);
}

void draw(){
  background(255, 255, 255);
  //if here everything is fine, if not here, text all blurry
  text("!@#$%", width/2, height/2);
  //if in setup works only w/o the if thing
}

//vstup: font

//resizable window

//gui

//fce

//vystup: