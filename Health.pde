class Health extends GameObjects
{
   Health()
   {
      position.y = (random(-500,-50));  //spawn points of the health
      position.x = (random(50,750)); 
   }
   
   void display()//displaying the health box
   {
     pushMatrix();
     translate(position.x,position.y);
     fill(random(0,255),random(0,255),random(0,255));
     noStroke();
     rect(0,0,40,40);
     fill(255,0,0);
     ellipse(20,20,30,30);
     fill(255);
     startfont = createFont("start.ttf",20);
     textFont(startfont);
     text("L",15,25);
     popMatrix(); 
   }
   
   void move()// movment of the health box
   {
      position.add(velocity); 
      
      if (position.y  < height || position.y < 0 )
      {
        velocity.y = 2;
      }
      if(position.y > 400)// when it hits the ground its automatically removed and we set new spawn points
      {
        alive = false;
        position.y = (random(-500,-50));  
        position.x = (random(50,750));
      }
   }
   
   void touched()//when the player touches it the program removes the object and set new spawn points.
   {
     health.play();
     health.rewind();
     alive = false;
     position.y = (random(-500,-50));  
     position.x = (random(50,750));
   }
   
}
