void game() {

  background(black);

  //bricks
  
  int i = 0;
  while (i < n) {
    circle(x[i], y[i], brickD);
    i += 1;
  }

  //end

  noStroke();
  fill(white);
  circle(ballX, ballY, 2*ballR);

  fill(purple);
  circle(paddleX, paddleY, 2*r);

  fill(lavender);
  textSize(50);
  text("HP: " + HP, width - 100, height - 50);
  text("Score: " + score, 100, height - 50);
  if (paddleX > 0 - r/2)      if (aKey) paddleX -= 10;
  if (paddleX < width + r/2)  if (dKey) paddleX += 10;

  ballX += vX;
  ballY += vY;

  if (ballX < ballR/2 || ballX > -ballR/2 + width) {
    vX *= random(-0.75, -0.9);
    hitPaddle.rewind();
    hitPaddle.play();
  }
  if (ballY < ballR/2) {
    vY *= random(-0.75, -0.9);
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
      gameover.loop();
    }
    if (HP > -1) {
      life.rewind();
      life.play();
    }
  }
  if (dist(paddleX, paddleY, ballX, ballY) < r + ballR) {
    vX = (ballX - paddleX) / random(4, 5);
    vY = (ballY - paddleY) / random(4, 5);
    hitPaddle.rewind();
    hitPaddle.play();
  }

  ballX = constrain(ballX, 0 + ballR, width - ballR);
  ballY = constrain(ballY, 0 + ballR, height + ballR);
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
