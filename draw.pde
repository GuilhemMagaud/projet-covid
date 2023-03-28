void draw() {
    fill(255,255,255);
    rect(0, 0, width, height);
    noStroke();

    //Déplacement et affichage de la balle (appelle des méthodes)
    for (int i = 0; i < nbreBalle; i++) {
        balles[i].bouge();
        balles[i].testCollision();
        balles[i].display();
        balles[i].initialiseTemps();
        balles[i].addTemps();
        balles[i].guerie();
    }
  
    textSize(20);
    text(millis()/1000, 1810, 600);
    //legend
    fill(sain);
    rect(1750,750,30,30);
    fill(#495057);
    text("sain",1810,770);
    fill(infecte);
    rect(1750,800,30,30);
    textSize(20);
    fill(#495057);
    text("infecte",1810,820);
    fill(guerie);
    rect(1750,850,30,30);
    textSize(20);
    fill(#495057);
    text("guerie",1810,870);
    fill(mort);
    rect(1750,900,30,30);
    fill(#495057);
    text("mort",1810,920);
  
    text(compteurBalleS,1700,770);
    text(compteurBalleI,1700,820);
    text(compteurBalleG,1700,870);
    text(compteurBalleM,1700,920);
  
    //condition d'arret du programme
    if (compteurBalleI == 0) {
        stop() ;
    }
}
