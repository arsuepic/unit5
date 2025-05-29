int size = 100;
boolean big = true;
boolean small = false;

void intro() {
  
  image(gif[f], 0, 0, width, height);
  f += 1;
  if (f == numberOfFrames) {
     f = 0; 
  }
  
  textSize(size);

  fill(lavender);
  text("BREAKOUT", width/2, size*2);

  if (size > 150) {
    big = false;
    small = true;
  } else if (size < 50) {
    big = true;
    small = false;
  }

  if (big == true) {
    size += 1;
  } else if (small == true) {
    size -= 1;
  }

  textSize(50);

  strokeWeight(5);
  if (mouseX > width/2-100  && mouseX < width/2+100 && mouseY > height*0.75 -25 && mouseY < height*0.75+25) {
    stroke(white);
    fill(lavender);
  } else {
    stroke(purple);
    fill(black);
  }
  rect(width/2, height*0.75, 200, 50);

  fill(white);
  text("START", width/2, height*0.75);
}

void introClick() {
  if (mouseX > width/2-100  && mouseX < width/2+100 && mouseY > height*0.75 -25 && mouseY < height*0.75+25) {

    tempX = 50;
    tempY = 50;
    tempC = 1;
    
    int k = 0;
    while (k < n) {
      x[k] = tempX;
      y[k] = tempY;
      c[k] = tempC;
      alive[k] = true;
      tempX += 100;
      if (tempX > width) {
        tempX = 50;
        tempY += 100;
        tempC += 1;
      }
      k += 1;
    }

    mode = GAME;
  }
}
