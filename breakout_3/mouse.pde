void mouseReleased() {

  if (mode == INTRO) {
    if (mouseX > width/2-100  && mouseX < width/2+100 && mouseY > height*0.75 -25 && mouseY < height*0.75+25) {
      introClick();
    }
  } else if (mode == GAME) {
  
  }
}
