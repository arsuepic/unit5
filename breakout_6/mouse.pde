void mouseReleased() {
  press.rewind();
  press.play();

  if (key == 'a' || key == 'A') aKey = false;
  if (key == 'd' || key == 'D') dKey = false;

  if (mode == INTRO) {
    introClick();
  } else if (mode == GAME) {
    gameClick();
  } else if (mode == PAUSE) {
    pauseClick();
  } else if (mode == GAMEOVER) {
    gameoverClick();
  } else if (mode == WINMODE) {
    winClick();
  }
}
