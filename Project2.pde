int stage;
PFont startfont;
PFont normalfont;
PImage gameplan;
void setup()
{
  size(800,800);
  frameRate(60);
  smooth();
  stage = 1;
}

void draw()
{
  switch(stage)
  {
    case 1:
      splash();
      break;
    case 2:
     game();
      break;
    case 3:
      help();
      break;
    case 4:
      help();
      break;
   }
  
}
void game()
{
  gameplan = loadImage("background.png");
  gameplan.resize(800,800);
  background(gameplan);
}
void splash()
{
    background(0);
    startfont = createFont("start.ttf",40);
    normalfont = createFont("start.ttf",25);
    textFont(startfont);
    text("Zombie Destruction",100,300);
    textFont(normalfont);
    text("Press Space to start",200,400);
    text("Press H for help",250,500);
    if(keyPressed)
    {
      if(key == 'h' || key == 'H')
      {
        stage = 4;
      }
    }
    if(keyPressed)
    {
      if(key == ' ')
      {
        stage = 2;
      }
    }
}
void help()
{
    background(0);
    startfont = createFont("start.ttf",40);
    normalfont = createFont("start.ttf",25);
    textFont(normalfont);
    text("Zombie Destruction",100,300);
    textFont(normalfont);
    text("Press Space to go back",200,400);
    if(keyPressed)
    {
      if(key == 'b')
      {
        stage = 1;
      }
      else
      {
        stage = 4;
      }
    }
}

