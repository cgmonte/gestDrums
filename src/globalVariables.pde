String pointIsInFront = "FRONT";
String pointOnBack = "BACK";

int row1BoxWidth = 70;
int row1BoxHeight = 50;
int row1BoxDepth = 50;
int startRow1 = 150;
int row1Spacing = 33;
int row1Height = 235;
int row1Depth = 0;

int row2BoxWidth = 80;
int row2BoxHeight = 60;
int row2BoxDepth = 60;
int startRow2 = 225;
int row2Spacing = 33;
int row2Height = 325;
int row2Depth =-100;

int screenZ = 200;
int boxesAlpha = 230;

float hand0x;
float hand0y;
float hand0z;
float hand1x;
float hand1y;
float hand1z;

color[] boxColor = new color[8];
color[] sphereColor = new color[5];
color blue = color(0, 0, 255, boxesAlpha);
color red = color(178, 34, 34, boxesAlpha);
color yellow = color(255, 255, 0, boxesAlpha);
color purple = color(147, 112, 219, boxesAlpha);
color green = color(50, 155, 50, boxesAlpha);
color white = color(255, 255, 255, boxesAlpha);

boolean[] lockPad = new boolean[8];

float handsMaxX = 1;
float handsMinX = 0;
float handsMaxY = 1;
float handsMinY = 0;
float handsMaxZ = 1;
float handsMinZ = 0;

int hand2IsInBox;
int hand1IsInBox;
int constrainHand2;
int constrainHand1;

