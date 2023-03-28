class Balle {
  //Déclaration des paramètres de base de la balle
  float x;
  float y;
  float vitesseX; 
  float vitesseY; 
  float diametre; //diametre pour la colision de balle
  float diametre2; //diametre de la balle
  color couleur;
  int id;
  int letemps; //temps initial de la balle
  int time; //temps général évoluant avec le temps de la simulation permet aussi de stocker cette variable temps.
  boolean infecter;

  //Constructeur de la balle
  Balle (float nouvX, float nouvY,float taille, color nouvCouleur, int i,int temps, boolean inf) {
    x= nouvX;
    y= nouvY;
    couleur= nouvCouleur;
    id=i;
    diametre=taille;
    diametre2=taille;
    letemps=temps;
    infecter = inf;
    time = 0;

    vitesseX = random(-1,1); 
    vitesseY = random(-1,1); 
  }
  
  //Dessin de la balle
  void display() {
    fill(couleur);
    ellipse(x, y, diametre2, diametre2);
  }
  
  //getter et setter 
  public int getTemps(){
    return letemps;
  }
  
  public void setTemps(int temps){
    this.letemps = temps;
  }
  public int getTime(){
    return time;
  }
  
  public void setTime(int times){
    this.time = times;
  }
  
  public boolean getinfecter(){
    return infecter;
  }
  
  public void setInfecter(boolean inf){
    this.infecter = inf;
  }

  //permet le déplacement de la balle
  void bouge() {
    if(x <0||x >width){
      vitesseX=-1*vitesseX;
    }
    if(y <0||y >height){
      vitesseY=-1*vitesseY;
    }
   x =  x+  vitesseX;
   y =  y+ vitesseY;
   
   // si la balle est dans l'etat mort elle ne bouge plus
   if (couleur == mort) {
     vitesseX = 0 ;
     vitesseY = 0 ;
     diametre = 0 ;
    }
  }
  
  
    void testCollision() {
        // Ici on va gérer la collision des balles contre les murs
        if (x > width-diametre) {
            vitesseX = vitesseX * -1;
        }
        if (y > height-diametre) {
            vitesseY = vitesseY * -1;
        }
    
        // Ici on va gérer les collisions inter-balles
        for(int i=id+1;i<nbreBalle;i++){
            float dx=balles[i].x - x;
            float dy=balles[i].y -y;
            float distance= sqrt(dx*dx+dy*dy);
            float minDist = balles[i].diametre/2 + diametre/2;
      
            if (distance < minDist) { 
                float angle = atan2(dy, dx);
                float targetX = x + cos(angle) * minDist;
                float targetY = y + sin(angle) * minDist;
                float ax = (targetX - balles[i].x) * rebond;
                float ay = (targetY - balles[i].y) * rebond;
                vitesseX -= ax;
                vitesseY -= ay;
                balles[i].vitesseX += ax;
                balles[i].vitesseY += ay;
                //si la balle est sain et qu'elle se fait toucher par une infectée alors elle risque de s'infecter
                if(balles[i].couleur==infecte && couleur==sain){
                    float aleatoire=random(0 , 1);
                    if (aleatoire >= tauxInfection){
                        couleur=infecte;
                        compteurBalleS=compteurBalleS-1;
                        compteurBalleI=compteurBalleI+1;
                    } 
                    else {
                        couleur=sain;
                    }
                }
                
                //si la balle est infectée et quelle se fait toucher par une sain alors elle risque de l'infectée        
                else if(couleur==infecte && balles[i].couleur==sain){
                    float aleatoire=random(0 , 1);
                    if (aleatoire >= tauxInfection){
                        balles[i].couleur = infecte; 
                        compteurBalleS=compteurBalleS-1;
                        compteurBalleI=compteurBalleI+1;
                    }
                    else{
                        balles[i].couleur = sain;
                    }
                }
            }
        }
    }


    //initialise le temps de la balle a 0 et lui spécifie qu'elle est infecter
    void initialiseTemps(){
        if (couleur==infecte && getinfecter() == false){
        setTemps(0);
        setInfecter(true);
        }
    }
  
    //permet de mettre a jour le compteur interne de la balle 
    void addTemps (){
        if (couleur==infecte && getinfecter() == true && millis() > getTime()) {
            setTemps(getTemps() + 1);     
            setTime(millis() + 1000);
        }
    }
   
    //spécifie a la balle a partir de combien de temps elle ne sera plus infectée
    void guerie (){
        if (getTemps() == finInfect && couleur==infecte){
            float r ;
            r = random(0 , 1) ;
            if (r >= tauxMortalité){
                couleur = guerie ;
                compteurBalleG += 1;
                compteurBalleI -= 1;
            }
            else {
                couleur = mort ;
                compteurBalleM += 1;
                compteurBalleI -= 1;
            }  
        }
    }
}
