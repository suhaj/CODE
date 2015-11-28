int fontSize = 200;
int activeFontSize = fontSize;

//float lineSpacing = fontSize*1.1;
//float letterY = lineSpacing;

//float stepSize = 0;
//float dancefactor = 0;

/* function menu buttons init */
void setf1MenuButtons() {
  myGUI.addSlider("horizontalStretch")
    .setPosition(10, 10)
    .setWidth(300)
    .setRange(-1000, 1000)
    .setLabel("Horizontal stretch")  
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("verticalStretch")
    .setPosition(10, 30)
    .setWidth(300)
    .setRange(-1000, 1000)
    .setLabel("Vertical stretch")  
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("segment")
    .setPosition(10, 50)
    .setWidth(300)
    .setRange(1, 100)
    .setGroup(f1Menu)
    .setColorLabel(0)
    ;
  }
void setf2MenuButtons() {
  myGUI.addSlider("xxx")
    .setPosition(10, 50)
    .setWidth(300)
    .setRange(0, 50)
    .setGroup(f2Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("yyy")
    .setPosition(10, 70)
    .setWidth(300)
    .setRange(0, 50)
    .setGroup(f2Menu)
    .setColorLabel(0)
    ;
  myGUI.addSlider("ddd")
    .setPosition(10, 90)
    .setWidth(300)
    .setRange(0, 50)
    .setGroup(f2Menu)
    .setColorLabel(0)
    ;  
}
void setf3MenuButtons() {
}

//myGUI.addSlider("stepSize")
  //  .setPosition(10, 30)
  //  .setRange(1, 1000)
  //  .setLabel("Step size")  
  //  .setGroup(f2Menu)
  //  .setColorLabel(0)
  //  ;
  //myGUI.addSlider("danceFactor")
  //  .setPosition(10, 50)
  //  .setRange(1, 1000)
  //  .setLabel("Dance Factor")  
  //  .setGroup(f2Menu)
  //  .setColorLabel(0)
  //  ;
  
void f2particles() {
  particles.clear();
  particles = new ArrayList();
  if (particles != null) {
    for (int i=0; i<myPoints.length; i++) {
      particles.add(new Particle(myPoints[i].x, myPoints[i].y, 3));
    }
  }
}

void f1() {
  noFill();
  stroke(0);
  strokeWeight(0.3);

  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  for (int i=0; i<myPoints.length; i++) {
    //zvaž obecně pro fce místo konstant fuknkce
    ellipse(myPoints[i].x, myPoints[i].y, myPoints[i].x+horizontalStretch, myPoints[i].y+verticalStretch);
  }
}
void f2() {
  fill(255, 50);
  strokeWeight(0.3);
  stroke(0, 255, 255, 50);
if(firstF2run){
  background(255);
  xxx = 0.01;
  yyy = 0.01;
  firstF2run = false;
}
  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();
  f2particles();

  if (lastXXX != xxx || lastYYY != yyy) {
    background(255);
    for (int i=0; i<particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      p.draw();    

      float dpart=0;
      for (int j =0; j<particles.size(); j++) {

        Particle pj = (Particle)particles.get(j);
        dpart = p.distance(pj);

        if (dpart <= distMin) {
          // stroke(255, map(dpart, 0, distMin, 255, 0));
          line(p.x, p.y, pj.x, pj.y);
        }
      }
    }
    lastXXX = xxx;
    lastYYY = yyy;
  }
}