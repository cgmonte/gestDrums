class Vis implements AudioListener
{
  private float[] left;
  private float[] right;
  private int sampleIndex;
  private int anotherSampleIndex;


  Vis()
  {
    left = null; 
    right = null;
  }

  synchronized void samples(float[] samp)
  {
    left = samp;
  }

  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }

  synchronized void draw(color backgroundColor, int boxNumber)
  {
    if (boxNumber < 5) {

      buf.beginDraw();
      buf.smooth();
      buf.background(backgroundColor, 0);
//      println(left[sampleIndex]);


      if (boxNumber==1) {
        buf.fill(lerpColor(backgroundColor, white, map(left[sampleIndex]*65, 0, 15, 0, 1)));
      }

      if (boxNumber==2) {
        buf.fill(lerpColor(backgroundColor, white, map(left[sampleIndex]*10, 0, 20, 0, 1)));
      }

      if (boxNumber==3) {
        buf.fill(lerpColor(backgroundColor, white, map(left[sampleIndex]*400, 0, 30, 0, 1)));
      }

      buf.rect(0, 0, buf.width, buf.height, 20);

      buf.noFill();
      buf.stroke(0);
      buf.strokeWeight(2);

      buf.beginShape();
      for ( int i = 0; i < buf.width; i++ )
      {         
        buf.vertex(i, (buf.height*0.5)+left[sampleIndex]*(buf.height*0.6));
        sampleIndex++;
        if (sampleIndex >= left.length) {
          sampleIndex = 0;
        }
      }
      buf.endShape();

      buf.noStroke();
      anotherSampleIndex++;
      if (anotherSampleIndex >= left.length) {
        anotherSampleIndex = 0;
      }
      buf.endDraw();
    } else if (boxNumber > 4) {

      buf2.beginDraw();
      buf2.smooth();
      buf2.background(backgroundColor, 0);

      if (boxNumber==5) {
        buf2.fill(lerpColor(backgroundColor, white, map(left[sampleIndex]*15, 0, 70, 0, 1)));
      }

      if (boxNumber==6) {
        buf2.fill(lerpColor(backgroundColor, white, map(left[sampleIndex]*35, 0, 60, 0, 1)));
      }

      buf2.rect(0, 0, buf2.width, buf2.height, 20);

      buf2.noFill();
      buf2.stroke(0);
      buf2.strokeWeight(3);

      buf2.beginShape();
      for ( int i = 0; i < buf2.width; i++ )
      {         
        buf2.vertex(i, (buf2.height*0.5)+left[sampleIndex]*(buf2.height*0.6));
        sampleIndex++;
        if (sampleIndex >= left.length) {
          sampleIndex = 0;
        }
      }
      buf2.endShape();

      buf2.noStroke();
      anotherSampleIndex++;
      if (anotherSampleIndex >= left.length) {
        anotherSampleIndex = 0;
      }
      buf2.endDraw();
    }
  }
}

