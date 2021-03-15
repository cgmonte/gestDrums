void collisionDetec() {
//ROW 1
  for (int boxNumber = 1; boxNumber <4; boxNumber++) {
    if ((box[boxNumber].containsPoint(hand[1])==true && pointIsInFront.equals(cutPlane1.classifyPoint(hand[1], 0).toString()))
      || (box[boxNumber].containsPoint(hand[2])==true && pointIsInFront.equals(cutPlane1.classifyPoint(hand[2], 0).toString())))

    {
      if (lockPad[boxNumber] == false) 
      {
        myTrigger(boxNumber);
        lockPad[boxNumber] = true;
      } else 
      {    
          notTrigged(boxNumber);
      }
    } else 
    {
          notTrigged(boxNumber);
      lockPad[boxNumber] = false;
    }
//------------------------------------------------------------------
    if (lockPad[boxNumber] == true) 
    {

      if (box[boxNumber].containsPoint(hand[1])==true && pointIsInFront.equals(cutPlane1.classifyPoint(hand[1], 0).toString())) 
      {

        constrainHand1 = 1;
        hand1IsInBox = boxNumber;
      }

      if (box[boxNumber].containsPoint(hand[2])==true && pointIsInFront.equals(cutPlane1.classifyPoint(hand[2], 0).toString())) 
      {
        constrainHand2 = 1;
        hand2IsInBox = boxNumber;
      }
    } else 
    {
      if (box[boxNumber].containsPoint(hand[1])==true && pointOnBack.equals(cutPlane1.classifyPoint(hand[1], 0).toString())) 
      { 
        constrainHand1 = 0;
      }

      if (box[boxNumber].containsPoint(hand[2])==true && pointOnBack.equals(cutPlane1.classifyPoint(hand[2], 0).toString())) 
      {
        constrainHand2 = 0;
      }
    }
  }

//ROW 2
  for (int boxNumber = 5; boxNumber <7; boxNumber++) {
    if ((box[boxNumber].containsPoint(hand[1])==true && pointIsInFront.equals(cutPlane2.classifyPoint(hand[1], 0).toString()))
      || (box[boxNumber].containsPoint(hand[2])==true && pointIsInFront.equals(cutPlane2.classifyPoint(hand[2], 0).toString())))

    {
      if (lockPad[boxNumber] == false) 
      {
        myTrigger(boxNumber);
        lockPad[boxNumber] = true;
      } else 
      {    
          notTrigged(boxNumber);
      }
    } else 
    {
          notTrigged(boxNumber);
      lockPad[boxNumber] = false;
    }
//------------------------------------------------------------------
    if (lockPad[boxNumber] == true) 
    {

      if (box[boxNumber].containsPoint(hand[1])==true && pointIsInFront.equals(cutPlane2.classifyPoint(hand[1], 0).toString())) 
      {

        constrainHand1 = 1;
        hand1IsInBox = boxNumber;
      }

      if (box[boxNumber].containsPoint(hand[2])==true && pointIsInFront.equals(cutPlane2.classifyPoint(hand[2], 0).toString())) 
      {
        constrainHand2 = 1;
        hand2IsInBox = boxNumber;
      }
    } else 
    {
      if (box[boxNumber].containsPoint(hand[1])==true && pointOnBack.equals(cutPlane2.classifyPoint(hand[1], 0).toString())) 
      { 
        constrainHand1 = 0;
      }

      if (box[boxNumber].containsPoint(hand[2])==true && pointOnBack.equals(cutPlane2.classifyPoint(hand[2], 0).toString())) 
      {
        constrainHand2 = 0;
      }
    }
  }
}
