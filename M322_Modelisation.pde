  int nbreBalle = 500;
  int depBalleInf = 10;
  
  float rebond = 0.05;
  
  Balle[] balles = new Balle[nbreBalle];
  
  color sain=color(0);
  color infecte=color(246,52,13);
  color guerie= color (74,213,33);
  color mort=color (255, 204, 0);
  
  int compteurBalleS=nbreBalle-depBalleInf;
  int compteurBalleI=depBalleInf;
  int compteurBalleG=0;
  int compteurBalleM=0;
  
  float tauxMortalité = 0.05;
  float tauxInfection = 0.8;
  
  int finInfect = 13;

  int DepartTemps=millis();

  CreateNewWindow Graphwin;
  
void setup() {

  size(1900,1000);
  Graphwin = new CreateNewWindow(); //cree une nouvelle fenêtre
  
    for (int i = 0; i < nbreBalle; i++) {
      if(i<=depBalleInf){
        balles[i] = new Balle(random(0+20,width-20), random(0+20,height-20),10,  infecte,i,0, true);
      }
      else
        balles[i] = new Balle(random(0+20,width-20), random(0+20,height-20),10,  sain,i,-1, false);
  }
}
