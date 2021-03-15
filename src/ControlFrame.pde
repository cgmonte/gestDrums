/*Class to create the controls on a different window*/

public class ControlFrame extends PApplet {
  int w, h;
  int abc = 100;

  public void setup() {
    size(w, h);
    frameRate(25);      

    cp5 = new ControlP5(this);

    range = cp5.addRange("X correction")
      // disable broadcasting since setRange and setRangeValues will trigger an event
      .setBroadcast(false) 
        .setPosition(50, 50)
          .setSize(400, 40)
            .setHandleSize(20)
              .setRange(0, 2)
                .setRangeValues(0, 2)
                  // after the initialization we turn broadcast back on again
                  .setBroadcast(true)
                    .setColorForeground(color(255, 40))
                      .setColorBackground(color(255, 40))  
                        ;

    range = cp5.addRange("Y correction")
      // disable broadcasting since setRange and setRangeValues will trigger an event
      .setBroadcast(false) 
        .setPosition(50, 100)
          .setSize(400, 40)
            .setHandleSize(20)
              .setRange(0, 2)
                .setRangeValues(0, 2)
                  // after the initialization we turn broadcast back on again
                  .setBroadcast(true)
                    .setColorForeground(color(255, 40))
                      .setColorBackground(color(255, 40))  
                        ;

    range = cp5.addRange("Z correction")
      // disable broadcasting since setRange and setRangeValues will trigger an event
      .setBroadcast(false) 
        .setPosition(50, 150)
          .setSize(400, 40)
            .setHandleSize(20)
              .setRange(0, 2)
                .setRangeValues(0, 2)
                  // after the initialization we turn broadcast back on again
                  .setBroadcast(true)
                    .setColorForeground(color(255, 40))
                      .setColorBackground(color(255, 40))  
                        ;

    cp5.loadProperties("properties.ser");
  }

  public void draw() {
    smooth();
    background(abc);
    fill(60);
    noStroke();
    rect(50, 200, 195, 120);

    rect(255, 200, 195, 120);

    fill(255);

    text("HAND 1 COORDINATES", 67, 225);
    text("X = "+hand0x, 67, 255);
    text("Y = "+hand0y, 67, 280);
    text("Z = "+hand0z, 67, 305);

    text("HAND 2 COORDINATES", 265, 225);
    text("X = "+hand1x, 267, 255);
    text("Y = "+hand1y, 267, 280);
    text("Z = "+hand1z, 267, 305);
  }

  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }

  public ControlP5 control() {
    return cp5;
  }

  ControlP5 cp5;
  Object parent;

  void controlEvent(ControlEvent theControlEvent) {
    if (theControlEvent.isFrom("X correction")) {
      // min and max values are stored in an array.
      // access this array with controller().arrayValue().
      // min is at index 0, max is at index 1.
      handsMaxX = theControlEvent.getController().getArrayValue(1);
      handsMinX = theControlEvent.getController().getArrayValue(0);
      //println("range update, done.");
    }

    if (theControlEvent.isFrom("Y correction")) {
      handsMaxY = theControlEvent.getController().getArrayValue(1);
      handsMinY = theControlEvent.getController().getArrayValue(0);
    }
    if (theControlEvent.isFrom("Z correction")) {
      handsMaxZ = theControlEvent.getController().getArrayValue(1);
      handsMinZ = theControlEvent.getController().getArrayValue(0);
    }
  }

  void keyPressed() {
    if (key=='1') {
      cp5.saveProperties("properties.ser");
    } else if (key=='2') {
      cp5.loadProperties("properties.ser");
    }
  }
}

ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}
