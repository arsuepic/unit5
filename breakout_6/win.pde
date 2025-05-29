void win() {

  image(gif[f], 0, 0, width, height);
  f += 1;
  if (f == numberOfFrames) {
    f = 0;
  }

  fill(lavender);
  textSize(100);
  text("!!!YOU WIN!!!", width/2, height/2 - 30);

  fill(white);
  textSize(20);
  text("Click anywhere to play again!", width/2, height/2 + 30);
}

void winClick() {
  mode = INTRO;

  theme.rewind();
  theme.loop();

  HP = 3;
  score = 0;

  ballX = width/2;
  ballY = height-200;
  ballR = 10;
  vX = 0;
  vY = 5;
  paddleX = width/2;
  paddleY = height;
  r = 60;
}
