void game() {

  background(black);

  noStroke();
  fill(white);
  circle(ballX, ballY, 2*ballR);

  fill(purple);
  circle(x, y, 2*r);

  fill(lavender);
  textSize(50);
  text("HP: " + HP, width - 100, height - 50);
  text("Score: " + score, 100, height - 50);
  if (x > 0 - r/2)      if (aKey) x -= 10;
  if (x < width + r/2)  if (dKey) x += 10;

  ballX += vX;
  ballY += vY;

  if (ballX < ballR/2 || ballX > -ballR/2 + width) {
    vX *= -0.95;
    hitPaddle.rewind();
    hitPaddle.play();
  }
  if (ballY < ballR/2) {
    vY *= -0.95;
    hitPaddle.rewind();
    hitPaddle.play();
  }
  if (ballY > -ballR/2 + height) {
    vX = 0;
    vY = -10;
    ballX = width/2;
    ballY = height/2;
    HP -= 1;
    if (HP < 0) {
      mode = GAMEOVER;
      gameover.rewind();
      gameover.play();
    }
    if (HP > -1) {
      life.rewind();
      life.play();
    }
  }
  if (dist(x, y, ballX, ballY) < r + ballR) {
    vX = (ballX - x) / random(4.5, 5.5);
    vY = (ballY - y) / random(4.5, 5.5);
    hitPaddle.rewind();
    hitPaddle.play();
  }
}

void keyPressed() {
  if (mode == GAME) {
    if (key == 'a' || key == 'A') aKey = true;
    if (key == 'd' || key == 'D') dKey = true;
  }
}

void keyReleased() {
  if (mode == GAME) {
    if (key == 'a' || key == 'A') aKey = false;
    if (key == 'd' || key == 'D') dKey = false;
  }
}

void gameClick() {
  mode = PAUSE;
}
