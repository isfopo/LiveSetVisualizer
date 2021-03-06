import oscP5.*;

OscP5 oscP5;
ArrayList<PImage> images = new ArrayList<PImage>();
int fade = 0;
int hue = 0;

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

color[] colors = {
  color(0, 153, 204, 100)
};

void setup() {
  frameRate(30);
  fullScreen();
  pixelDensity(2);
  colorMode(HSB, 400);
  
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
  fill(hue, 255, 255, 100);
  rect(0, 0, width, height);
  fill(0, fade);
  rect(0, 0, width, height);
}

void oscEvent(OscMessage message) {
  if (message.addrPattern().equals("/fade")) {
    fade = message.get(0).intValue();
  } else if (message.addrPattern().equals("/hue")) {
    hue = message.get(0).intValue();
  }
}
