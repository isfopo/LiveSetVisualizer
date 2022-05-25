import oscP5.*;

OscP5 oscP5;
ArrayList<PImage> images = new ArrayList<PImage>();
int fade = 0;
color hue = color(0, 0, 0);

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

  overlays();
}

void oscEvent(OscMessage message) {
  if (message.addrPattern().equals("/fade")) {
    fade = message.get(0).intValue();
  }
  else if (message.addrPattern().equals("/hue")) {
    colorMode(HSB);
    hue = color(message.get(0).intValue(), 255, 255);
  }
  else if (message.addrPattern().equals("/reset")) {
    println("you hit reset - now everything will be different");
  }
}

void overlays() {
  fill(hue, 100);
  rect(0, 0, width, height);
  fill(0, fade);
  rect(0, 0, width, height);
}