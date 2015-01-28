class Zombie extends GameObjects
{
  Zombie()
  {
    position.x = (random(-500,-50));
    position.y = random(350,350);
  }
  
  void move()
  {
   
   position.add(velocity); 
   if (position.x  < width || position.x < 0 )
   {
      velocity.x = 2;
   }
   if(position.x > 800)
   {
      position.x = (random(-500,-50));  
   }
    
  }
  
  void display()
  {
    pushMatrix();
    noStroke();
    translate(position.x,position.y);
    fill(0,255,0);
    rect(0,0,30,30);
    fill(random(0,255),random(0,255),random(0,255));
    rect(7,7,5,5);
    rect(20,7,5,5);
    rect(12,20,7,5);
    fill(0,255,0);
    rect(10,30,10,50);
    rect(0,40,10,10);
    rect(20,40,10,10);
    rect(0,80,10,10);
    rect(20,80,10,10);
    popMatrix();
  }
  
  void touched()
  {
     position.x = (random(-500,-50));
  }
}
