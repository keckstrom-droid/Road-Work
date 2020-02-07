// Step 1. Import the video library.
import processing.video.*;
import processing.sound.*;

//Step 2. Declare a capture object.
Capture video;
PImage img = video;
int threshold;
float r, g, b;
SoundFile file;

// Step 5. Read from the camera when a new image is available!
void captureEvent(Capture video) {
  video.read();
}

void setup() {  
  size(640, 480);

  // Step 3. Initialize Capture object.

  background(0);
  video = new Capture(this, 640, 480);
  file = new SoundFile(this, "/sample.mp3");

  video.start();
}
void draw() {  
  img = video;

  for (int y = 0; y < video.height; y++) {




    for (int x = 0; x < 214; x++)
    {
      int loc = x + y*width;


      r = red(img.pixels[loc]);
      g = green(img.pixels[loc]);
      b = blue(img.pixels[loc]);

      if (r >= 140 & g >=60 & b <= 50)
      {
        threshold++;
      }
    }
    for (int x = 427; x < 640; x++)
    {
      int loc = x + y*width;


      r = red(img.pixels[loc]);
      g = green(img.pixels[loc]);
      b = blue(img.pixels[loc]);

      if (r >= 140 & g >=60 & b <= 50)
      {
        threshold++;
      }
    }
  }
  if (threshold > 50 && !file.isPlaying()) 
  {
    println("Road work ahead? Uh yeah I sure hope it does");
    file.play();
  }
  threshold = 0;
  image(video, 0, 0);
}
