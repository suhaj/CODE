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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  while (shape7.contains (point[0], point[1])) {
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
  shape7 = myFONT.toShape(textTyped);
  //shape7.translate(width*0.635 - shape7.getWidth()/2, height*0.55 + shape7.getHeight()/2);
  shape7.translate(centerX*1.3 - shape7.getWidth()/2, centerY*0.8 + shape7.getHeight()/2);
  numberOfPoints();
  generateRegionsAndColors();
}
//*********************
void numberOfPoints() {
  
  allPoints = shape7.getPoints(); // holds the extracted points

  numPointsText = allPoints.length;
  colors = new color[numPointsText];

  points = new float[numPointsText + numPointsGenerated][2];
  for (int i=0; i<numPointsText; i++) {
    points[i][0] = allPoints[i].x;
    points[i][1] = allPoints[i].y;
  }
}