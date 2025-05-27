void gameover() {
  background(black);

  fill(lavender);
  textSize(100);
  text("GAME OVER", width/2, height/2 - 30);

  fill(white);
  textSize(20);
  text("Click anywhere to restart...", width/2, height/2 + 30);
}

void gameoverClick() {
  mode = INTRO;
  gameover.pause();

  HP = 3;
  score = 0;
  
  ballX = width/2;
  ballY = height/2;
  ballR = 10;
  vX = 0;
  vY = -10;
  paddleX = width/2;
  paddleY = height;
  r = 60;
}
