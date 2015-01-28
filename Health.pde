class Health extends GameObjects
{
  
   Health()
   {
      position.y = (random(-500,-50));  
      position.x = (random(50,750)); 
     
   }
   
   void display()
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
   
   void move()
   {
     position.add(velocity); 
    if (position.y  < height || position.y < 0 )
    {
      velocity.y = 2;
    }
    if(position.y > 400)
    {
      alive = false;
      position.y = (random(-500,-50));  
      position.x = (random(50,750));
    }
   }
   
   void touched()
   {
     health.play();
     health.rewind();
     alive = false;
     position.y = (random(-500,-50));  
     position.x = (random(50,750));
   }
   
}
