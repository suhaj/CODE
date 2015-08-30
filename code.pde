  PFont font;

void setup() {
  size(900, 500);
  if (frame != null) {
   surface.setResizable(true);
   background(255, 255, 255);
  }
  
  // Uncomment the following two lines to see the available fonts IN CONSOLE
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Georgia", 32);
  fill(0,0,0);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(255, 255, 255);
  text("!@#$%", width/2, height/2);
}

//vstup: font
//popup/rozkliknutelná/rolldown nabídka fontů. Zvolit naistalovaný font
//there is a function (String[] fontList = PFont.list(); println(fontList);), which lists fonts, so zou just have to suck it out 
//and put in a list and just string the name into (font = createFont("Georgia", 32);)

//gui

//fce

//vystup: vektor
//theres a library for that, sketch > import lib