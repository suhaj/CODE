void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      textTyped = textTyped.substring(0, max(0, textTyped.length()-1));
      break;
    case RETURN:
      // enable linebreaks
      textTyped += "\n";
      break;
    default:
      textTyped += key;
    }
  }
}