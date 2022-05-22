import oscP5.*;
  
OscP5 oscP5;
ArrayList<PImage> images = new ArrayList<PImage>();
float messageValue;
float size;

String[] tracks = {
  "Gutiar",
  "Bass",
  "Minilogue",
};

String[] imageFiles = {
  "icons/sound.png",
  "icons/shape.png",
  "icons/place.png",
  "icons/memory.png",
};

void setup() {
  frameRate(30);
  fullScreen();
  pixelDensity(2);
  
  oscP5 = new OscP5(this,12000);

  for (String file : imageFiles) {
    images.add(loadImage(file));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < images.size(); i = i+1) {
    image(images.get(i), i*350+ 100, 200, 300, 300);
  }
  fill(0, 153, 204, 100);
  rect(0, 0, width, height);
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
