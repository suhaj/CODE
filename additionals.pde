void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      textTyped = textTyped.substring(0, max(0, textTyped.length()-1));
      break;
    case ENTER:
    case RETURN:
      //soooooo what if we actuallz use the points and move those!
      break;
    default:
      textTyped += key;
    }
  }
}

void mousePressed(){
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}