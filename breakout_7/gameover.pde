void gameover() {

  image(gif[f], 0, 0, width, height);
  f += 1;
  if (f == numberOfFrames) {
    f = 0;
  }
  fill(lavender);
  textSize(100);
  text("GAME OVER", width/2, height/2 - 100);

  fill(white);
  textSize(20);
  text("Click anywhere to restart...", width/2, height/2 - 40);

  fill(purple);
  textSize(100);
  text("Score: " + score, width/2, height/2 + 100);
}

void gameoverClick() {
  mode = INTRO;
  gameover.pause();

  theme.rewind();
  theme.loop();

  HP = 5;
  score = 0;

  ballX = width/2;
  ballY = height-200;
  ballR = 10;
  vX = 0;
  vY = 5;
  paddleX = width/2;
  paddleY = height;
}
