/* fction 2 class */
class Particle {
  PVector position;
  PVector speed;

  //POSITION
  float x;
  float y;
  float z;
  float origX, origY;

  //DIAMETER
  float d;

  Particle(float x_, float y_, float d_) {
    this.x = x_;
    this.y = y_;
    this.d = d_;    
    position = new PVector (x, y);

    origX = x;
    origY = y;
  }

  void draw() {
    x = origX + random(-xxx, xxx);
    y = origY + random(-yyy, yyy);
  }

  //THIS RETURNS A VALUE WHICH DETERMINES IF WE DRAW A LINE BETWEEN EACH POINT
  float distance(Particle p) {
    return dist(this.x, this.y, p.x, p.y);
  }
}

/* fction 3 class */
class FontAgent3 {

 PVector loc;

 FontAgent3(PVector l) {
   loc = l.copy();
 }

 void motion() {
   noiseScale = map(noiseVariation, 0, width, 0.001, 0.01); //Smaller numbers give less variation in the noise val.
   noiseZ = map(nervousMotion, 0, height, frameCount*0.0003, frameCount*0.03);//Greater numbers will make the motion more nervous.
   motion = noise(loc.x * noiseScale * noiseZ, loc.y * noiseScale * noiseZ) * 53;
   //System.out.println("mouseX " + mouseX);
   //System.out.println("mouseY " + mouseY);
 }  


 void display() {
   noStroke();
   fill(textHue, textSat, textBri, 53);
   ellipse(loc.x, loc.y, motion+step, motion+step);
   //System.out.println("display " + mouseX);
 }
}

/* fction 4 class */
class FontAgent4 {

  PVector loc;
  float dia;

  FontAgent4(PVector l) {
    loc = l.copy();
  }

  void motion() {
    float deplacementX = noise(xoff)*width;
    float deplacementY = noise(yoff)*height;

    xoff += xincrement;
    yoff += yincrement;
    MouvPoint = dist(deplacementX-(width/2), deplacementY-(height/2), loc.x, loc.y);;
  }  

  void display() {
    noStroke();
    fill(textHue, textSat, textBri,73);
    dia = (150/MouvPoint) *5; // the boldness of everzthing diplayed
    //ellipse(loc.x + random(-randX, randX), loc.y + random(-randY, randY), dia, dia);
    ellipse(loc.x + random(-randX/20, randX), loc.y + random(-randY/20, randY*2), dia, dia);
  }
}