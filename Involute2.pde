
//colors
public color green = color(0, 255, 0);
public color darkGreen = color(0,100,0);
public color red = color(255, 0, 0);
public color blue = color(0, 0, 255);
public color yellow = color(255, 246, 41);
public color orange = color(255, 181, 41);
public color purple = color(113, 41, 255);
public color black = color(0,0,0);
public color white = color(255,255,255);

PrintWriter output;
PrintWriter output3;
void setup(){
  size(800,800);
  background(black);
  output= createWriter("positions.txt");
  output.println("model = Sketchup.active_model");
  output3= createWriter("ArcPositions.txt");
  //output2.println("model = Sketchup.active_model");
  stroke(red);
  strokeWeight(15);
  involute(10,360);
  
  strokeWeight(4);
  for(float i=0;i<360;i++){
    float deg = radians(i);
    stroke(i,i,i);
    //if(i==0){
      invertedInvolute(10,360, 20*cos(deg), 20*sin(deg));
    //}
  }
  float deg;
  float newDeg;
  float x;
  float y;
  float Nx;
  float Ny;
  for(float i=13;i<180;i++){ //13
    println(i);
    deg = radians(i);
    newDeg = radians(i+1);
    stroke(red);
    strokeWeight(2);
    point(20*cos(deg)*1.2+384,20*sin(deg)*1.1+390);
    x=(20*cos(deg)*1.2+384);
    y=(20*sin(deg)*1.1+390);
    Nx=(20*cos(newDeg)*1.2+384);
    Ny=(20*sin(newDeg)*1.1+390);
    output3.println("model.entities.add_line(["+x+","+y+",0"+"],["+Nx+","+Ny+",0"+"])");
  }
  fill(red);
  rect(370,411,37,12);
  stroke(red);
  strokeWeight(10);
  point(403,407);
  stroke(red);
  strokeWeight(8);
  line(370,412,363,406);
  strokeWeight(2);
  noFill();
  stroke(blue);
  circle(383,387,42);
  stroke(black);
  point(383,387);
}


void involute(float radius, float divisions){
  float x;
  float y;
  float deg;
  float newDeg;
  float newX;
  float newY;
  for(float i=0;i<719;i=i+(720/divisions)){
    deg = radians(i);
    newDeg = radians(i+2);
    x=radius*(cos(deg)+deg*sin(deg));
    y=radius*(sin(deg)-deg*cos(deg));
    newX=radius*(cos(newDeg)+newDeg*sin(newDeg));
    newY=radius*(sin(newDeg)-newDeg*cos(newDeg));
    line(x+400,y+400,newX+400,newY+400);
    //output.println("model.entities.add_line(["+(x+400)+","+(y+400)+",0"+"],["+(newX+400)+","+(newY+400)+",0"+"])");
  }
  //output.println("model.entities.add_line(["+(x+400)+","+(y+400)+",0"+"],["+(newX+400)+","+(newY+400)+",0"+"])");
}
void invertedInvolute(float radius, float divisions, float deltaX, float deltaY){
  float x;
  float y;
  float deg;
  float newDeg;
  float newX;
  float newY;
  for(int i=100;i<719;i+=(720/divisions)){
    deg = radians(i+530);
    newDeg = radians(i+2+530);
    x=-radius*(cos(deg)+deg*sin(deg));
    y=-radius*(sin(deg)-deg*cos(deg));
    newX=-radius*(cos(newDeg)+newDeg*sin(newDeg));
    newY=-radius*(sin(newDeg)-newDeg*cos(newDeg));
    line(x+400+deltaX,y+400+deltaY,newX+400+deltaX,newY+400+deltaY);
    //output.println("model.entities.add_line(["+(x+400)+","+(y+400)+",0"+"],["+(newX+400)+","+(newY+400)+",0"+"])");
  }
}
