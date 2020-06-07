PImage robo;
PImage robo1;
float[] posX=new float[10000];
float[] posY=new float[10000];
float x=100,y=100;
float vx=1,vy=0;
int gameover=0,score=0;
float speeds=1,foodX=200,foodY=200;int lengths=10;
//snake[] snakes = new snake[1];
void setup()
{
  size(960,600);
  robo = loadImage("ROBO9.jpg");
  robo1= loadImage("game-over.jpg");
//   snakes[0]= new snake();
}

void draw()
{
  if(gameover==0){
    //background(100);
    image(robo,0,0,960,600);
    food();
    display(x,y);
    takefood();
    speed(vx,vy);
    boundary();
    score();
  }
  if(gameover==1)
  {
    image(robo1,0,0,960,600);
  }
  over();
  println(mouseX,mouseY);
}

void keyPressed()
{
if(!(vx==0 && vy==speeds)) {  if(key=='w'){  vx=0;  vy=-speeds;  } }  
if(!(vx==speeds && vy==0)) {  if(key=='a'){  vx=-speeds;  vy=0;  } }
if(!(vx==0 && vy==-speeds)){  if(key=='s'){  vx=0;  vy=speeds;   } }
if(!(vx==-speeds && vy==0)){  if(key=='d'){  vx=speeds;  vy=0;   } } 
  if(key=='p'){  gameover=2-gameover;}
}

void food()
{
  //background(255);
  fill(0,255,0);
  rect(foodX,foodY,20,20);  
}

void takefood()
{
  float d = dist(x,y,foodX,foodY);
  if(d<10)
  {  
    foodX=random(10,width-10);
    foodY=random(10,height-10);
    lengths+=20;
    speeds+=.5;
    score++;
  }
}

void display(float x,float y)
  {
    rect(posX[lengths-1],posY[lengths-1],20,20);
    posX[lengths-1]=x;
    posY[lengths-1]=y;
    for(int i=0;i<lengths-1;i++)
    { 
      fill(0,random(150,255),0,78);
      noStroke();
      rect(posX[i],posY[i],20,20);

      posX[i] = posX[i+1];
      posY[i] = posY[i+1];
      
    }
    fill(0,70);
    rect(posX[lengths-1],posY[lengths-1],20,20);
    color c=get(260,129);
    fill(255,0,0);
    ellipse(posX[lengths-1]+8,posY[lengths-1]+8,9,5);
    fill(0,0,0);
    ellipse(posX[lengths-1]+8,posY[lengths-1]+8,3,3);


  }
  

void speed(float vx,float vy)
  {
   
    x = x+vx;
    y = y+vy;
  }  

void over()
{
  for(int i=4;i<lengths-10;i++)
  {
    float a=dist(posX[i],posY[i],x,y);
      if(a<1)
        gameover=1;
  }
  
}

void boundary()
{ 
  if(x>width-4)
    x=10;
  if(x<3)
    x=width-10;
    if(y>height-4)
    y=10;
  if(y<3)
    y=height-10;
}

void score()
{
  fill(0);
  rect(-10,0,50,30);
  fill(0,0,255);
  textSize(30);
  text("score = "+score,10,20);
}
