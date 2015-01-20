class Bullet extends GameObjects
{
 
   float  speed,playerx,playery;
  int fireDirection;
  Bullet() 
  {
    position.x =400;
    position.y = 620;

    speed = 10;
  }
  void display() {
   
 println(fireDirection);  
    position.x = position.x + cos(fireDirection/180*PI)*speed;
    position.y = position.y + sin(fireDirection/180*PI)*speed;
    ellipse(position.x, position.y, 30, 10);
    
    if (position.x  > 0 && position.x  < width && position.y > 0 && position.x  < height) {
    }
    else {
    // objects.remove();
    }
  }
 
}

