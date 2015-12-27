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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* fction 3 class */
class FontAgent3 {

  PVector loc;

  FontAgent3(PVector l) {
    loc = l.get(); //copy vs. get > processing 2 vs. 3
  }

  void motion() {
    noiseScale = map(noiseVariation, 0, 800, 0.00001, 0.5); //Smaller numbers give less variation in the noise val.
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* fction 4 class */
class FontAgent4 {

  PVector loc;
  float dia;

  FontAgent4(PVector l) {
    loc = l.get(); //copy vs. get > processing 2 vs. 3
  }

  void motion() {
    float deplacementX = noise(xoff)*width;
    float deplacementY = noise(yoff)*height;

    xoff += xincrement;
    yoff += yincrement;
    MouvPoint = dist(deplacementX-(width/2), deplacementY-(height/2), loc.x, loc.y);
    ;
  }  

  void display() {
    noStroke();
    fill(textHue, textSat, textBri, 73);
    dia = (150/MouvPoint) *5; // the boldness of everzthing diplayed
    //ellipse(loc.x + random(-randX, randX), loc.y + random(-randY, randY), dia, dia);
    ellipse(loc.x + random(-randX/20, randX), loc.y + random(-randY/20, randY*2), dia, dia);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* f7 methods */
void generateRegionsAndColors() {
  for (int i=numPointsText; i<points.length; i++) {
    points[i] = getRandomPoint();
  }
  checkIdentical(points);
  Voronoi myVoronoi = new Voronoi(points);
  myRegions = myVoronoi.getRegions();
  // generate a color for each voronoi region in the text
  generateColors();
}
//*********************
void generateColors() {
  //colorMode(HSB, 1);
  for (int i=0; i<numPointsText; i++) {
    colors[i] = color(random(textHue - colorRange, textHue), random(textSat - colorRange*2, textSat), random(textBri - colorRange*2.5, textBri));
  }
  //colorMode(RGB, 255);
}
//*********************
float[] getRandomPoint() {
  float[] point = new float[2];
  point[0] = random(width);
  point[1] = random(height);
  // make sure it's outside the text
  while (rshape.contains (point[0], point[1])) {
    point[0] = random(width);
    point[1] = random(height);
  }
  return point;
}
//*********************
void checkIdentical(float[][] points) {
  for (int i=0; i<points.length; i++) {
    for (int j=0; j<i; j++) {
      if (points[i][0]==points[j][0]&&points[i][1]==points[j][1]) {
        points[i][0]+=random(1);
        points[i][1]+=random(1);
        points[j][0]+=random(-1);
        points[j][1]+=random(-1);
      }
    }
  }
}
//*********************
public void resetF7() {
  rshape = myFONT.toShape(textTyped);
  //rshape.translate(width*0.635 - rshape.getWidth()/2, height*0.55 + rshape.getHeight()/2);
  rshape.translate(centerX*1.3 - rshape.getWidth()/2, centerY*0.8 + rshape.getHeight()/2);
  numberOfPoints();
  generateRegionsAndColors();
}
//*********************
void numberOfPoints() {

  allPoints = rshape.getPoints(); // holds the extracted points

  numPointsText = allPoints.length;
  colors = new color[numPointsText];

  points = new float[numPointsText + numPointsGenerated][2];
  for (int i=0; i<numPointsText; i++) {
    points[i][0] = allPoints[i].x;
    points[i][1] = allPoints[i].y;
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* f8 methods */
void addRemoveParticlesF8() {
  // remove particlesF8 with no life left
  for (int i=particlesF8.size()-1; i>=0; i--) {
    ParticleF8 p = particlesF8.get(i);
    if (p.life <= 0) {
      particlesF8.remove(i);
    }
  }
  while (particlesF8.size () < maxParticlesF8) {
    particlesF8.add(new ParticleF8());
  }
}
//*********************
public void resetF8() {
  rshape = myFONT.toShape(textTyped);
  rshape.translate(width/2, height*0.7);
  particlesF8.clear();
  background(bcgHue, bcgSat, bcgBri);
}
//*********************
/* f8 class */
class ParticleF8 {
  PVector loc, vel; // location and velocity
  float radius = toggleRadius; // base radius of the ellipse
  float life = 1; // start with a full life
  float lifeRate = lifeRateToggle; // decrease rate of life
  //0.005 - 0.05

  ParticleF8() {
    getPosition();
    vel = PVector.random2D(); // random direction
  }

  // get a random position inside the text
  void getPosition() {
    while (loc == null || !isInText(loc)) loc = new PVector(random(width), random(height));
  }

  void update() {
    vel.rotate(random(-QUARTER_PI, QUARTER_PI)); // rotate velocity (direction of movement)
    loc.add(vel); // add velocity to position (aka move!)
    life -= lifeRate; // decrease life by the lifeRate (the particle is removed by the addRemoveParticles() method when no life is left)
  }

  void display() {
    fill(textHue, textSat, textBri); 
    stroke(hue8, sat8, bri8, 125); // transparant black stroke
    strokeWeight(1.85);
    float r = radius; // radius of the ellipse
    r *= life; // base the radius of the ellipse on the life (which decreases from 1 to 0)
    ellipse(loc.x, loc.y, r, r); // draw ellipse
  }

  // return if point is inside the text
  boolean isInText(PVector v) {
    return rshape.contains(v.x, v.y);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* f9 methods */
void addRemoveParticlesF9() {
  // remove particles with no life left
  for (int i=particlesF9.size()-1; i>=0; i--) {
    ParticleF9 p = particlesF9.get(i);
    if (p.life <= 0) {
      particlesF9.remove(i);
    }
  }
  // add particles until the maximum
  while (particlesF9.size () < maxParticlesF9) {
    particlesF9.add(new ParticleF9());
  }
}
//*********************
public void resetF9() {
  rshape = myFONT.toShape(textTyped);
  rshape.translate(width/2, height*0.7);
  particlesF9.clear();
  background(bcgHue, bcgSat, bcgBri);
}
//*********************
/* f9 class */

class ParticleF9 {
  PVector loc;
  float maxLife = maxLifeToggle;
  float life, lifeRate;

  ParticleF9() {
    getPosition();
    // set the maximum life of the Particles depending on the drawMode
    // randomly set a life and lifeRate for each Particle
    life = random(0.5 * maxLife, maxLife);
    lifeRate = random(0.01, 0.02);
  }

  void update() {
    float angle = noise(loc.x * 0.01, loc.y * 0.01, fc001*angleNoise) * TWO_PI;
    PVector vel = PVector.fromAngle(angle + fc001*vectorNoise);
    loc.add(vel);
    life -= lifeRate; // decrease life by the lifeRate (the particle is removed by the addRemoveParticles() method when no life is left)
  }

  void display() {
    fill(textHue, textSat, textBri); 
    stroke(0, 125); // transparant black stroke
    strokeWeight(1.9);
    float r = 8 * life/maxLife; // radius of the ellipse
    ellipse(loc.x, loc.y, r, r); // draw ellipse
  }

  // get a random position inside the text
  void getPosition() {
    while (loc == null || !isInText (loc)) loc = new PVector(random(width), random(height));
  }

  // return if point is inside the text
  boolean isInText(PVector v) {
    return rshape.contains(v.x, v.y);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* f10 methods */
void addRemoveParticlesF10() {
  // remove particles with no life left
  for (int i=particlesF10.size()-1; i>=0; i--) {
    ParticleF10 p = particlesF10.get(i);
    if (p.life <= 0) {
      particlesF10.remove(i);
    }
  }
  // add particles until the maximum
  while (particlesF10.size () < maxParticlesF10) {
    particlesF10.add(new ParticleF10());
  }
}
//*********************
public void resetF10() {
  rshape = myFONT.toShape(textTyped);
  rshape.translate(width/2, height*0.7);
  particlesF10.clear();
  globalRotation = random(TWO_PI); // randomly set the global rotation/direction of the Particles
  background(bcgHue, bcgSat, bcgBri);
}
//*********************
/* f10 class */
class ParticleF10 {
  PVector loc;
  float life, lifeRate;

  ParticleF10() {
    getPosition();
    life = random(minLifeF10, maxLifeF10);
    lifeRate = random(0.01, 0.02);
  }

  void update() {
    float angle = noise(loc.x * 0.01, loc.y * 0.01) * TWO_PI;
    PVector vel = PVector.fromAngle(angle + globalRotation);
    loc.add(vel);
    life -= lifeRate;
  }

  void display() {
    boolean special = random(1) < 0.001;
    strokeWeight(special ? random(0.75, 3) : 0.75);
    stroke(255, special ? random(175, 255) : 65);
    point(loc.x, loc.y);
  }

  // get a random position inside the text
  void getPosition() {
    while (loc == null || !isInText (loc)) loc = new PVector(random(width), random(height));
  }

  // return if point is inside the text
  boolean isInText(PVector v) {
    return rshape.contains(v.x,v.y);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
