class GameObjects 
{
 float x , y, w;
 boolean alive;
 PVector position;
 PVector forward;
 PVector velocity;
 float speed;
   
   GameObjects()
  {
   alive=true;
   position= new PVector(400,700);
   forward = new PVector(0,0); 
   velocity = new PVector(0, 0);

}

  void move()
  {
  }
  
  void display()
  {
  }
}
