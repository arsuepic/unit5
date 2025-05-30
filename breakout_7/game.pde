void game() {

  background(black);

  //bricks

  int i = 0;
  while (i < n) {
    noStroke();
    if (alive[i] == true) {
      manageBrick(i);
    }
    i += 1;
  }

  //end

  if (score == n) {
    mode = WINMODE;
  }

  noStroke();
  fill(white);
  circle(ballX, ballY, 2*ballR);

  fill(purple);
  circle(paddleX, paddleY, 2*r);

  fill(lavender);
  textSize(50);
  text("HP: " + HP, width - 100, height - 50);
  text("Score: " + score, 100, height - 50);
  if (paddleX > 0 - r/2)      if (aKey) paddleX -= 15;
  if (paddleX < width + r/2)  if (dKey) paddleX += 15;

  fill(white);
  textSize(20);
  text("Click anywhere to pause...", width/2, height-20);

  ballX += vX;
  ballY += vY;

  if (ballX < ballR/2 || ballX > -ballR/2 + width) {
    vX *= random(-0.8, -0.9);
    hitPaddle.rewind();
    hitPaddle.play();
  }
  if (ballY < ballR/2) {
    vY *= random(-0.8, -0.9);
    hitPaddle.rewind();
    hitPaddle.play();
  }
  if (ballY > -ballR/2 + height) {
    vX = 0;
    vY = 5;
    ballX = width/2;
    ballY = height-200;
    paddleX = width/2;
    HP -= 1;
    if (HP < 0) {
      mode = GAMEOVER;
      theme.pause();
      gameover.rewind();
      gameover.loop();
    }
    if (HP > -1) {
      life.rewind();
      life.play();
    }
  }
  if (dist(paddleX, paddleY, ballX, ballY) < r + ballR) {
    vX = (ballX - paddleX) / random(3, 4);
    vY = (ballY - paddleY) / random(3, 4);
    hitPaddle.rewind();
    hitPaddle.play();
  }

  ballX = constrain(ballX, 0 + ballR/2, width - ballR/2);
  ballY = constrain(ballY, 0 + ballR/2, height + ballR);
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

void manageBrick(int i) {
  if (c[i] == 1) {
    fill(white);
  } else if (c[i] == 2) {
    fill(lavender);
  } else if (c[i] == 3) {
    fill(purple);
  } else {
    fill(gray);
  }
  circle(x[i], y[i], brickR*2);
  if (dist(ballX, ballY, x[i], y[i]) < ballR + brickR) {
    vX = (ballX - x[i]) / random(2, 3);
    vY = (ballY - y[i]) / random(2, 3);
    hitObject.rewind();
    hitObject.play();
    alive[i] = false;
    score += 1;
  }
}

void gameClick() {
  mode = PAUSE;
}
