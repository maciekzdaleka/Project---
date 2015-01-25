class GameObjects 
{
 float x , y;
 boolean alive;
 boolean alivee;
 PVector position;
 PVector velocity;
 PVector forward;
 boolean fireDirection;
 float theta;
 float speed;
 float hx = 20;
 float hy = 20;
 boolean offset;
 
 
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
