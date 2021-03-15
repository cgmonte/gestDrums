import java.awt.Frame;
import java.awt.BorderLayout;
import toxi.geom.*;
import toxi.processing.*;
import controlP5.*; 
import oscP5.*;
import netP5.*;
import SimpleOpenNI.*;
import ddf.minim.*;
import de.looksgood.ani.*;

void setup() {
  size(640, 480, P3D);

  /*creates a graphics buffer to which waveforms will be drawn.
   this buffer will later feed a PImage that will be used
   as textures on the pads.*/
  buf = createGraphics(row1BoxWidth*2, int(sqrt(sq(row1BoxHeight*2)+sq(row1BoxDepth*2))), P2D);  
  buf2 = createGraphics(row2BoxWidth*2, int(sqrt(sq(row2BoxHeight*2)+sq(row2BoxDepth*2))), P2D);




  //frameRate(30); 
  smooth();

  cp5 = new ControlP5(this); //creates new controllers
  cf = addControlFrame("Controls", 565, 390); //add a new frame where controlers will be placed

  oscP5 = new OscP5(this, 12345); //sets 12345 as the incoming port for OSC messages

  gfx = new ToxiclibsSupport(this); //creates gfx to draw toxiclibs objects

    hand = new Vec3D[5]; //objects to be filled with hand position data
  ball = new Sphere[5]; //spheres that will show the hand position data
  padVertex = new Vec3D[5]; //vertexes of the visible pads
  /*in this loop I initialize all object arrays that need 4 objects*/
  for (int i = 1; i <= 4; i++) {
    hand[i] = new Vec3D();
    ball[i] = new Sphere(7);
    padVertex[i] = new Vec3D();
    sphereColor[i] = color(10, 0, 254);
  }

  box = new AABB[8]; //detection boxes
  boxMax = new Vec3D[8]; //vectors to store boxes edges coordinates 
  boxMin = new Vec3D[8]; //vectors to store boxes other edges coordinates
  vis = new Vis[8];
  /*in this loop I initialize all object arrays that need 7 objects*/
  for (int i = 0; i <= 7; i++) {
    box[i] = new AABB();
    boxMax[i] = new Vec3D();
    boxMin[i] = new Vec3D();
    vis[i] = new Vis();
    lockPad[i] = false; //booleans to prevent retriggering, one for each pad
    boxColor[i] = color(255, 255, 255, boxesAlpha); //colors for each pad
  }

  cut3Points1 = new Triangle3D(); //this triangle will define a plane that will help with detection
  cut3Points2 = new Triangle3D(); //this other triangle will define another plane for the same reason

  testSphere = new Sphere(7); //this only for the purpose of testing coordinates

  /*vectors used to add and subtract to other vectors*/
  tempX = new Vec3D(row1BoxWidth*2, 0, 0);
  tempY = new Vec3D(0, row1BoxHeight*2, 0);
  tempZ = new Vec3D(0, 0, row1BoxDepth*2);

  tempRow2X = new Vec3D(row2BoxWidth*2, 0, 0);
  tempRow2Y = new Vec3D(0, row2BoxHeight*2, 0);
  tempRow2Z = new Vec3D(0, 0, row2BoxDepth*2);

  /*loads samples and adds listeners to the waveform objects*/
  minim = new Minim(this);
  kick = minim.loadSample("BD2.wav", 200);
  snare = minim.loadSample("SD2.wav", 200);
  hihat = minim.loadSample("HH2.wav", 200);
  crash = minim.loadSample("crash.wav", 200);
  tom1 = minim.loadSample("tom1.wav", 200);
  tom2 = minim.loadSample("tom2.wav", 200);
  tom3 = minim.loadSample("tom3.wav", 200);

  snare.addListener(vis[1]);
  kick.addListener(vis[2]);
  hihat.addListener(vis[3]);
  crash.addListener(vis[4]);
  tom1.addListener(vis[5]);
  tom2.addListener(vis[6]);
  tom3.addListener(vis[7]);


  /*creats the cam object that will be used to capture kinects RGB camera image*/
  cam = new SimpleOpenNI(this);
  cam.enableRGB();
  cam.setMirror(true); //mirrors camera image

    Ani.init(this);
}

void draw() {
  smooth();
  //  ortho();
  //camera(mouseX*3, height/2.0, (mouseY*4) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  background(124, 200, 40);

  /*draws the screen and applies the camera image to it as a texture*/
  pushMatrix();
  translate(width / 2, height / 2);
  beginShape();
  img = cam.rgbImage();
  cam.update();
  texture(img);
  vertex(-320-screenZ, -240-screenZ, -screenZ, 0, 0);
  vertex(320+screenZ, -240-screenZ, -screenZ, 640, 0);
  vertex(320+screenZ, 240+screenZ, -screenZ, 640, 480);
  vertex(-320-screenZ, 240+screenZ, -screenZ, 0, 480);
  endShape();
  popMatrix();



  detectionShapes(); //function that defines the detection shapes without drawing them to screen

  /*the two following switches change the case whenever a hand is detected inside a box. the hand vector
   is always defined by the OSC messages received from the tracker/server, but it's constrained to a box
   if it's inside one. see collisionDetec() for more details.*/
  switch(constrainHand1) {
  case 0: 
    hand[1].set(map(hand0x*1.25, handsMinX, handsMaxX, 0, 640*1.25), map(hand0y, handsMinY, handsMaxY, 0, 480), map(hand0z, handsMinZ, handsMaxZ, 300, -10));
    sphereColor[1] = color(255); //change sphere color if it's outside detection area
    break;
  case 1: 
    hand[1].set(map(hand0x*1.25, handsMinX, handsMaxX, 0, 640*1.25), map(hand0y, handsMinY, handsMaxY, 0, 480), map(hand0z, handsMinZ, handsMaxZ, 300, -10));
    hand[1].constrain(box[hand1IsInBox]);
    sphereColor[1] = color(255, 0, 254); //change sphere color if it's inside detection area
    break;
  }

  switch(constrainHand2) {
  case 0: 
    hand[2].set(map(hand1x*1.25, handsMinX, handsMaxX, 0, 640*1.25), map(hand1y, handsMinY, handsMaxY, 0, 480), map(hand1z, handsMinZ, handsMaxZ, 300, -10));
    sphereColor[2] = color(255);
    break;
  case 1: 
    hand[2].set(map(hand1x*1.25, handsMinX, handsMaxX, 0, 640*1.25), map(hand1y, handsMinY, handsMaxY, 0, 480), map(hand1z, handsMinZ, handsMaxZ, 300, -10));
    hand[2].constrain(box[hand2IsInBox]);
    sphereColor[2] = color(255, 0, 254);
    break;
  }

  /*Draw 2 tracking spheres according to hand position*/
  noStroke();
  for (int i = 1; i <= 2; i++) {
    //    sphereColor[i] = color(constrain(cutPlane1.getDistanceToPoint(hand[i]), 255, 0), 0, 254);
    fill(sphereColor[i]);    
    ball[i].set(hand[i]);
    gfx.sphere(ball[i], 100, true);
  }

  pointLight(255, 255, 255, 340, 190, 150);
  //ambientLight(20, 20, 20);

  collisionDetec(); //function where all the logic for collisions is defined
  drawInterface(); //function where all visible pads are drawn

//  saveFrame();
}

//void keyPressed() {
//  if (key=='q') {
//    hand[1].set(150, 220, 40);
//  } else if (key=='a') {
//    hand[1].set(150, 100, 10);
//  }
//
//  if (key=='w') {
//    hand[2].set(250, 220, 40);
//  } else if (key=='s') {
//    hand[2].set(250, 100, 10);
//  }
//}

