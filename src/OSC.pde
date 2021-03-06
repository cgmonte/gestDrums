void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */

  if (theOscMessage.checkAddrPattern("/normalized/hand0")==true) {
    /* check if the typetag is the right one. */
    if (theOscMessage.checkTypetag("fff")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      float firstValueX = theOscMessage.get(0).floatValue();  
      float secondValueY = theOscMessage.get(1).floatValue();
      float thirdValueZ = theOscMessage.get(2).floatValue();
      hand0x = firstValueX;
      hand0y = secondValueY;
      hand0z = thirdValueZ;
      //println("hand0 x: "+firstValueX+", y: "+secondValueY+", z: "+thirdValueZ);
      return;
    }
  } 

  if (theOscMessage.checkAddrPattern("/normalized/hand1")==true) {
    /* check if the typetag is the right one. */
    if (theOscMessage.checkTypetag("fff")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      float firstValueX = theOscMessage.get(0).floatValue();  
      float secondValueY = theOscMessage.get(1).floatValue();
      float thirdValueZ = theOscMessage.get(2).floatValue();
      hand1x = firstValueX;
      hand1y = secondValueY;
      hand1z = thirdValueZ;
      //println("hand1 x: "+firstValueX+", y: "+secondValueY+", z: "+thirdValueZ);
      return;
    }
  } 
}
