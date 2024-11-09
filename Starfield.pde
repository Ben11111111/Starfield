Particle [] p = new Particle[100];
void setup()
{

  background(0);
  size(800, 800);
  for (int i = 0; i < p.length; i++) {
    p[i] = new Particle();
    p[0] = new OddballParticle();
  }
}
void draw()
{

  background(0);
  for (int i = 0; i < p.length; i++) {

    p[i].show();
    p[i].move();
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor, mySize;
  Particle()
  {
    myX =400;
    myY =400;
    mySpeed= (double)(Math.random()*10);
    myAngle = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = 5;
  }
  void move() {


    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed;
    if (myX > 800 || myX < 0 || myY > 800 || myY < 0)
    {
      myX = 400;
      myY = 400;

      myAngle = Math.random() * 2 * Math.PI;
    }
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize );
  }
}


class OddballParticle extends Particle {
  boolean change;
  OddballParticle() {
    myX =400;
    myY =400;
    mySpeed= (double)(Math.random()*5)+5;
    myAngle = Math.random()*2*Math.PI;
    myColor = color(255, 255, 255);
    mySize = 40;
    change = false;
  }
  void move() {

    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed;

    if (!change &&((myX > 600 || myX < 200) || (myY > 600 || myY < 200)) ) {
      change = true;
      myAngle = (Math.random()*2)*Math.PI;
      myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    }
    if (myX > 800 || myX < 0 || myY > 800 || myY < 0)
    {
      myX = 400;
      myY = 400;
      change = false;
      myAngle = Math.random() * 2 * Math.PI;
    }
  }
}
