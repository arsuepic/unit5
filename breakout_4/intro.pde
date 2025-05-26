int size = 100;
boolean big = true;
boolean small = false;

void intro() {
  textSize(size);
  background(black);

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
    noFill();
  }
  rect(width/2, height*0.75, 200, 50);

  fill(white);
  text("START", width/2, height*0.75);
}

void introClick() {
  if (mouseX > width/2-100  && mouseX < width/2+100 && mouseY > height*0.75 -25 && mouseY < height*0.75+25) {
    mode = GAME;
  }
}
