import oscP5.*;
  
OscP5 oscP5;
PImage img;
float messageValue;
float size;

void setup() {
  frameRate(30);
  fullScreen();
  background(255);
  
  oscP5 = new OscP5(this,12000);
  img = loadImage("icons/memory.png");
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(255);
  image(img, 0, 0, 400, 400);
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
