class GameObjects 
{
 float x , y;
 boolean alive;
 PVector position;
 PVector velocity;
 PVector forward;
 float theta;
 float speed;
 float hx = 20;
 float hy = 20;
 boolean offset;
 boolean reset;
 
   GameObjects()
  {
   alive=true;
   position= new PVector(0,0);
   velocity = new PVector(0,0);
   forward = new PVector(0,0);
   fireDirection = false;
  }
  
  void display()
  {
  }
  
  void move()
  {
  }
  



}
