import oscP5.*;
  
OscP5 oscP5;
int dim;
float messageValue;
float size;

void setup() {
  fullScreen();
  
  oscP5 = new OscP5(this,12000);

  dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
}

void draw() {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

void drawGradient(float x, float y) {
  int radius = floor( dim * size )/2;
  float h = messageValue * 360;
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}

void oscEvent(OscMessage message) {
  if (message.addrPattern().equals("/Minilogue/hi")) {
    messageValue = message.get(0).floatValue();
  }
  else if (message.addrPattern().equals("/Minilogue/low")) {
    size = message.get(0).floatValue();
  } else {
    println(message.addrPattern());
  }
}
