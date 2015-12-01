/* fction 2 class */
//-----------------------------------------------------
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

  //-----------------------------------------------------
  Particle(float x_, float y_, float d_) {
    this.x = x_;
    this.y = y_;
    this.d = d_;    
    position = new PVector (x, y);

    origX = x;
    origY = y;
  }

  //-----------------------------------------------------
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
class FontAgent {

  PVector loc;
  float motion;

  FontAgent(PVector l) {
    loc = l.copy();
  }

  void motion() {
    float noiseScale = map(noiseVariation, 0, width, 0.001, 0.01); //Smaller numbers give less variation in the noise val.
    float noiseZ = map(nervousMotion, 0, height, frameCount*0.0003, frameCount*0.03);//Greater numbers will make the motion more nervous.
    motion = noise(loc.x * noiseScale * noiseZ, loc.y * noiseScale * noiseZ) * 53;
    //System.out.println("mouseX " + mouseX);
    //System.out.println("mouseY " + mouseY);
  }  


  void display() {
    noStroke();
    fill(0, 53);
    ellipse(loc.x, loc.y, motion+step, motion+step);
    //System.out.println("display " + mouseX);
  }
}