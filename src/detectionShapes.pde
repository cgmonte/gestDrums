void detectionShapes () {

  stroke(255);

  fill(boxColor[1]);
  box[1].set(new Vec3D(startRow1, row1Height, row1Depth));
  box[1].setExtent(new Vec3D(row1BoxWidth, row1BoxHeight, row1BoxDepth));

  fill(boxColor[2]);
  box[2].set(new Vec3D(startRow1+row1Spacing+(row1BoxWidth*2), row1Height, row1Depth));
  box[2].setExtent(new Vec3D(row1BoxWidth, row1BoxHeight, row1BoxDepth));

  fill(boxColor[3]);
  box[3].set(new Vec3D(startRow1+(row1Spacing*2)+(row1BoxWidth*4), row1Height, row1Depth));
  box[3].setExtent(new Vec3D(row1BoxWidth, row1BoxHeight, row1BoxDepth));

//  fill(boxColor[4]);
//  box[4].set(new Vec3D(startRow1+(row1Spacing*3)+(row1BoxWidth*6), row1Height, row1Depth));
//  box[4].setExtent(new Vec3D(row1BoxWidth, row1BoxHeight, row1BoxDepth));

  fill(boxColor[5]);
  box[5].set(new Vec3D(startRow2, row2Height, row2Depth));
  box[5].setExtent(new Vec3D(row2BoxWidth, row2BoxHeight, row2BoxDepth));

  fill(boxColor[6]);
  box[6].set(new Vec3D(startRow2+row2Spacing+(row2BoxWidth*2), row2Height, row2Depth));
  box[6].setExtent(new Vec3D(row2BoxWidth, row2BoxHeight, row2BoxDepth));

//  fill(boxColor[7]);
//  box[7].set(new Vec3D(startRow2+(row2Spacing*2)+(row2BoxWidth*4), row2Height, row2Depth));
//  box[7].setExtent(new Vec3D(row2BoxWidth, row2BoxHeight, row2BoxDepth));

//  for (int i=1; i<=7; i++) {
//    gfx.box(box[i], true);
//  }

  for (int i=1; i<=7; i++) {
    boxMax[i] = box[i].getMax();
    boxMin[i] = box[i].getMin();
  }

  //PLANE ROW1
  cut3Points1.set(boxMin[1].add(tempY), boxMax[1].sub(tempZ), boxMin[1].add(tempZ));
  cutPlane1 = new Plane(cut3Points1);
  fill(21, 120, 234, 120);
  noStroke();
  //  gfx.plane(cutPlane1, 900);

  //PLANE ROW2
  cut3Points2.set(boxMin[5].add(tempRow2Y), boxMax[5].sub(tempRow2Z), boxMin[5].add(tempRow2Z));
  cutPlane2 = new Plane(cut3Points2);
  fill(80, 120, 50, 120);
  noStroke();
  //  gfx.plane(cutPlane2, 900);

  //  println(box[1].getComponent(0));
//    fill(255, 0, 0, 255);
//    testSphere.set(boxMin[5].add(tempRow2Y));
//  //  println(box[1].getMax().sub(tempY).sub(tempX));
//  //  testSphere.add(new Vec3D(100, 0, 0));
//    gfx.sphere(testSphere, 100, true);
}

