int fontSize = 200;
int activeFontSize = fontSize;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f2particles() {
  particles.clear();
  particles = new ArrayList();
  if (particles != null) {
    for (int i=0; i<myPoints.length; i++) {
      particles.add(new Particle(myPoints[i].x, myPoints[i].y, 3));
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f3particles() {
  if (myAgents3 != null) {
    myAgents3 = new FontAgent3[myPoints.length];
    for (int i=0; i<myPoints.length; i++) {
      myAgents3[i] = new FontAgent3(new PVector(myPoints[i].x, myPoints[i].y));
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
boolean f4particles() {
  if (myAgents4 != null) {
    myAgents4 = new FontAgent4[myPoints.length];
    for (int i=0; i<myPoints.length; i++) {
      myAgents4[i] = new FontAgent4(new PVector(myPoints[i].x, myPoints[i].y));
    }
    return true;
  }
  return false;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f1() {
  noFill();
  stroke(textHue, textSat, textBri);
  strokeWeight(0.3);

  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  for (int i=0; i<myPoints.length; i++) {
    ellipse(myPoints[i].x, myPoints[i].y, myPoints[i].x+horizontalStretch, myPoints[i].y+verticalStretch);
    ellipse(myPoints[i].x, myPoints[i].y, (myPoints[i].x)*factor+horizontalStretch, myPoints[i].y*factor+verticalStretch);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f2() {
  strokeWeight(0.3);
  stroke(textHue, textSat, textBri, 50);
  
  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();
  f2particles();

  for (int i=0; i<particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    p.draw();    

    float dpart=0;
    for (int j =0; j<particles.size(); j++) {

      Particle pj = (Particle)particles.get(j);
      dpart = p.distance(pj);

      if (dpart <= distMin) {
        // stroke(255, map(dpart, 0, distMin, 255, 0)); <-------------huh
        line(p.x, p.y, pj.x, pj.y);
      }
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f3() {
  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  f3particles();

  for (int i = 0; i < myAgents3.length; i++) {
    myAgents3[i].display();
    myAgents3[i].motion();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f4() {
  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  if (f4particles()) {

    for (int i = 0; i < myAgents4.length; i++) {
      randX = (((100/MouvPoint)*factorx)+mousex*2)-width/2;
      randY = (((100/MouvPoint)*factory)+mousey*2)-height/2;
      myAgents4[i].display();
      myAgents4[i].motion();
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------------------------v
//void f#() {
// RCommand.setSegmentLength(segment);
// //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
// myGroup = myFONT.toGroup(textTyped);
// myPoints = myGroup.getPoints();
//}
//---------------------------------------------------^