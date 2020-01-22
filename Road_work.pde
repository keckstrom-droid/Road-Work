import processing.video.*;
import processing.sound.*;
import java.util.*;


  Capture cam;
  SoundFile file;
  PImage img, trial;
  
void setup()
{


  String[] cameras = Capture.list();
  size(640, 480);
  file = new SoundFile(this, "sample.mp3");
  cam = new Capture(this, cameras[0]);
  cam.start();

}
void draw()
{
 background(0);
 scale(-1, 1);
 image(cam, -cam.width, 0);
 if (keyPressed) 
 {
   file.play();
   save("capture.jpg");
 }
}
void captureEvent(Capture cam) 
{
  cam.read();
}
