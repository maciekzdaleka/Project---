class GameObjects 
{
 float x , y;
 boolean alive;
 PVector position;
 PVector velocity;
 PVector forward;
   
   GameObjects()
  {
   alive=true;
   position= new PVector(400,600);
   velocity = new PVector(0,0);
   forward = new PVector(0,0);
  }
  
  void display()
  {
  }
  
  void move()
  {
  }
}
