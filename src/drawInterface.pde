void drawInterface() {

  for (int i = 5; i <= 6; i++) {   
    padVertex[1].set(boxMin[i].add(tempRow2Z));
    padVertex[2].set(boxMax[i].sub(tempRow2Y));
    padVertex[3].set(boxMax[i].sub(tempRow2Z));
    padVertex[4].set(boxMin[i].add(tempRow2Y));
    
    //fill(boxColor[i]);
    
    vis[i].draw(boxColor[i], i);

    pushMatrix();
    beginShape();
    img = buf2.get(0, 0, buf2.width, buf2.height);
    texture(img);
    vertex(padVertex[1].getComponent(0), padVertex[1].getComponent(1), padVertex[1].getComponent(2), 0, 0);
    vertex(padVertex[2].getComponent(0), padVertex[2].getComponent(1), padVertex[2].getComponent(2), buf2.width, 0);
    vertex(padVertex[3].getComponent(0), padVertex[3].getComponent(1), padVertex[3].getComponent(2), buf2.width, buf2.height);
    vertex(padVertex[4].getComponent(0), padVertex[4].getComponent(1), padVertex[4].getComponent(2), 0, buf2.height);
    endShape();
    popMatrix();
  }
  
    for (int i = 1; i <= 3; i++) {   
    padVertex[1].set(boxMin[i].add(tempZ));
    padVertex[2].set(boxMax[i].sub(tempY));
    padVertex[3].set(boxMax[i].sub(tempZ));
    padVertex[4].set(boxMin[i].add(tempY));

    //fill(boxColor[i]);
    
    vis[i].draw(boxColor[i], i);

    pushMatrix();
    beginShape();
    img = buf.get(0, 0, buf.width, buf.height);
    texture(img);
    vertex(padVertex[1].getComponent(0), padVertex[1].getComponent(1), padVertex[1].getComponent(2), 0, 0);
    vertex(padVertex[2].getComponent(0), padVertex[2].getComponent(1), padVertex[2].getComponent(2), buf.width, 0);
    vertex(padVertex[3].getComponent(0), padVertex[3].getComponent(1), padVertex[3].getComponent(2), buf.width, buf.height);
    vertex(padVertex[4].getComponent(0), padVertex[4].getComponent(1), padVertex[4].getComponent(2), 0, buf.height);
    endShape();
    popMatrix();
  }
}

