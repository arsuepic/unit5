void pause() {
  image(gif[f], 0, 0, width, height);
  f += 1;
  if (f == numberOfFrames) {
    f = 0;
  }
  fill(lavender);
  textSize(100);
  text("PAUSED", width/2, height/2 - 30);

  fill(white);
  textSize(20);
  text("Click anywhere to continue...", width/2, height/2 + 30);
}

void pauseClick() {
  mode = GAME;
}
