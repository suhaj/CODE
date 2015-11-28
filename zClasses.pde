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