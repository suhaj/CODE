int fontSize = 200;
int activeFontSize = fontSize;
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
    ellipse(myPoints[i].x, myPoints[i].y, (myPoints[i].x)*factor+s.getArrayValue()[0], myPoints[i].y*factor+s.getArrayValue()[1]);
    //ellipse(myPoints[i].x, myPoints[i].y, (myPoints[i].x)*factor+horizontalStretch, myPoints[i].y*factor+verticalStretch);
  }
}
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
void f5() {
  noFill();
  strokeWeight(0.1);
  stroke(textHue, textSat, textBri);

  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  //dancing movement
  for (int i = 0; i < myPoints.length; i++ ) {
    myPoints[i].x = myPoints[i].x + random(-stepSizeF5, stepSizeF5) * danceFactorF5;
    myPoints[i].y = myPoints[i].y + random(-stepSizeF5, stepSizeF5) * danceFactorF5;
  }

  for (int i=0; i<myPoints.length; i++) {
    vertex(myPoints[i].x, myPoints[i].y);
    ellipse(myPoints[i].x, myPoints[i].y, 7, 7);
  }
  vertex(myPoints[0].x, myPoints[0].y);

  for (int j = 0; j < thicknessF5; j++) {
    beginShape();
    for (int i=0; i<myPoints.length-1; i++) {
      float d = dist(myPoints[i].x, myPoints[i].y, myPoints[i+1].x, myPoints[i+1].y);
      // create a gap between each letter
      vertex(myPoints[i].x + 2*random(-j/2, j/2), myPoints[i].y + 2*random(-j/2, j/2));
      ellipse(myPoints[i].x + 2*random(-j/2, j/2), myPoints[i].y + 2*random(-j/2, j/2), 7, 7);
      if (d < segment*connectionF5) continue;
      endShape();
      beginShape();
      //System.out.println("shape ended, begun");
    }
    endShape();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f6() {
  noFill();
  strokeWeight(0.08);
  stroke(textHue, textSat, textBri);

  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();

  //dancing movement
  for (int i = 0; i < myPoints.length; i++ ) {
    myPoints[i].x = myPoints[i].x + random(-stepSizeF6, stepSizeF6) * danceFactorF6;
    myPoints[i].y = myPoints[i].y + random(-stepSizeF6, stepSizeF6) * danceFactorF6;
  }

  for (int j = 0; j < thicknessF6; j++) {
    beginShape();
    for (int i=0; i<myPoints.length-1; i++) {
      float d = dist(myPoints[i].x, myPoints[i].y, myPoints[i+1].x, myPoints[i+1].y);
      // create a gap between each letter
      //System.out.println("i " + i);
      //System.out.println("d " + d);
      //System.out.println("segment " + segment);
      curveVertex(myPoints[i].x + 2*random(-j/2, j/2), myPoints[i].y + 2*random(-j/2, j/2));
      if (d < segment*connectionF6) continue;
      endShape();
      beginShape();
      //System.out.println("shape ended, begun");
    }
    //curveVertex(myPoints[0].x, myPoints[0].y);
    endShape();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f7() {
  RCommand.setSegmentLength(segment);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  shape7 = myFONT.toShape(textTyped);
  shape7.translate(centerX*1.3 - shape7.getWidth()/2, centerY*0.8 + shape7.getHeight()/2);

  if (lastTextHue != textHue || lastTextSat != textSat || lastTextBri != textBri || lastColorRange != colorRange) {
    generateColors();
    lastTextHue = textHue;
    lastTextBri = textBri;
    lastTextSat = textSat;
    lastColorRange = colorRange;
  }
  
  // set stroke weight and color for all upcoming shape7s
  strokeWeight(0.65);
  stroke(0, 125);

  // draw the Voronoi Polygons related to the text points
  for (int i=0; i<numPointsText; i++) {
    float[][] regionCoordinates = myRegions[i].getCoords();

    // draw a straight voronoi region outline
    noFill();
    beginShape();
    for (int j=0; j<regionCoordinates.length; j++) {
      vertex(regionCoordinates[j][0], regionCoordinates[j][1]);
    }
    endShape(CLOSE);

    // draw a curved, colored and scaled voronoi region
    PVector center = new PVector();
    for (int j=0; j<regionCoordinates.length; j++) {
      center.add(regionCoordinates[j][0], regionCoordinates[j][1], 0);
    }
    center.div(regionCoordinates.length);
    pushMatrix();
    translate(center.x, center.y);
    scale(filling);
    fill(colors[i]);
    beginShape();
    for (int j=0; j<regionCoordinates.length; j++) {
      curveVertex(regionCoordinates[j][0]- center.x, regionCoordinates[j][1]- center.y);
    }
    curveVertex(regionCoordinates[0][0] - center.x, regionCoordinates[0][1] - center.y);
    curveVertex(regionCoordinates[1][0] - center.x, regionCoordinates[1][1] - center.y);
    curveVertex(regionCoordinates[2][0] - center.x, regionCoordinates[2][1] - center.y);
    endShape(CLOSE);
    popMatrix();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f8() {
  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();
  
  addRemoveParticles();
 
  for (ParticleF8 p : particlesF8) {
    p.update();
    p.display();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void f9() {
  RCommand.setSegmentLength(segment);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = myFONT.toGroup(textTyped);
  myPoints = myGroup.getPoints();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------------------------v
//void f#() {
//RCommand.setSegmentLength(segment);
////RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
//myGroup = myFONT.toGroup(textTyped);
//myPoints = myGroup.getPoints();
//}
//---------------------------------------------------^