// First download https://svs.gsfc.nasa.gov/vis/a010000/a011300/a011353/EO_Seasons2-1920-MASTER_high.mp4
// extract the frames like so
// ffmpeg -i EO_Seasons2-1920-MASTER_high.mp4 frames\frame%03d.bmp

void setup()
{
  size(960,540);
  textSize(15);
}

void draw()
{
  if(frameCount>=784) exit();
  
  background(0);
  String filename = String.format("frames\\frame%03d.bmp",frameCount);
  PImage frame = loadImage(filename);
  
  // 23.5 deg = 0.41 rad
  
  if(frameCount < 25)
  {
    image(frame, 0, 0);
    save(String.format("frames\\rotated%03d.png",frameCount));
    return;
  }
  
  float t = ((float)(frameCount-25) / 120);
  float angle = sin(t)*0.41;
  
  pushMatrix();
  stroke(255);
  translate(width/2,height/2);
  rotate(-angle);
  translate(-width/2,-height/2);
  image(frame,0,0);
  popMatrix();
  
  text("@kevpluck\nImages from NASA and EUMESAT's Meteosat-9 satellite",20,20);
  
  save(String.format("frames\\rotated%03d.png",frameCount));
}