void notTrigged(int boxNumber) {

  if (boxNumber == 1) {
    boxColor[1] = red;
  }

  if (boxNumber == 2) {
    boxColor[2] = yellow;
  }

  if (boxNumber == 3) {
    boxColor[3] = purple;
  }

  if (boxNumber == 4) {
    boxColor[4] = red;
  }

  if (boxNumber == 5) {
    boxColor[5] = blue;
  }

  if (boxNumber == 6) {
    boxColor[6] = green;
  }

  if (boxNumber == 7) {
    boxColor[7] = blue;
  }
}


void myTrigger(int boxNumber) {

  if (boxNumber == 1) {
//    boxColor[1] = white;
    snare.trigger();
  }

  if (boxNumber == 2) {
    kick.trigger();
//    boxColor[2] = white;
  }

  if (boxNumber == 3) {
//    boxColor[3] = white;
    hihat.trigger();
  }

  if (boxNumber == 4) {
//    boxColor[4] = white;
    crash.trigger();
  }

  if (boxNumber == 5) {
//    boxColor[5] = white;
    tom1.trigger();
  }

  if (boxNumber == 6) {
//    boxColor[6] = white;
    tom2.trigger();
  }

  if (boxNumber == 7) {
//    boxColor[7] = white;
    tom3.trigger();
  }
}

