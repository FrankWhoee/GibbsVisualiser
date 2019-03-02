import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);

float Gibbs = 0;
float Enthalpy = 50;
float Temperature = 50;
float Entropy = 1;

color GibbsC = color(0,255,0);
color EnthalpyC = color(0,167,255);
color TemperatureC = color(255,0,0);
color EntropyC = color(255,153,0);

int scaling = 50;

final int w = 1500;
final int h = 750 ;

void setup() {
  size(1500,750);
  noStroke();
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("Gibbs")
     .setPosition(10,10)
     .setRange(-1000000,1000000) //<>//
     .setSize(200,5)
     ;
  
  cp5.addSlider("Enthalpy")
     .setPosition(10,30)
     .setRange(-100000,100000)
     .setSize(200,5)
     ;
     
  cp5.addSlider("Temperature")
     .setPosition(10,50)
     .setRange(-1000,1000)
     .setSize(200,5)
     ;
     
  cp5.addSlider("Entropy")
     .setPosition(10,70)
     .setRange(-1000,1000)
     .setSize(200,5)
     ;
     
  cp5.getController("Gibbs").getCaptionLabel().setColor(GibbsC);
  cp5.getController("Entropy").getCaptionLabel().setColor(EntropyC);
  cp5.getController("Temperature").getCaptionLabel().setColor(TemperatureC);
  cp5.getController("Enthalpy").getCaptionLabel().setColor(EnthalpyC);
  
}

void mouseWheel(MouseEvent event){
  scaling += event.getCount();
  scaling = scaling < 1 ? 1 : scaling;
  println(scaling);
}

void draw() {
  background(0);
  Gibbs = Enthalpy - Temperature * Entropy;
  cp5.getController("Gibbs").setValue(Gibbs);
  
  
  textAlign(CENTER);
  textSize(20);
  
  stroke(GibbsC);
  fill(GibbsC);
  if(Gibbs < 0){text("-",(2* w)/6,h/2);}
  noFill();
  circle((2* w)/6,h/2,Gibbs/scaling);
  
  stroke(EntropyC);
  fill(EntropyC);
  if(Entropy < 0){text("-",(3*w)/6,h/2);}
  noFill();
  circle((3*w)/6,h/2,Entropy/scaling);
  
  stroke(TemperatureC);
  fill(TemperatureC);
  if(Temperature < 0){text("-",(4*w)/6,h/2);}
  noFill();
  circle((4*w)/6,h/2,Temperature/scaling);
  
  stroke(EnthalpyC);
  fill(EnthalpyC);
  if(Enthalpy < 0){text("-",(5*w)/6,h/2);}
  noFill();
  circle((5*w)/6,h/2,Enthalpy/scaling);
}

void slider(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}
