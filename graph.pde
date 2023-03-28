class graphe{
    int compteurBalleSgraph;
    int compteurBalleIgraph;
    int compteurBalleGgraph;
    int compteurBalleMgraph;
    float duree; //temps actuelle du graphe
    int dure2; //stockage du temps actuelle de la simulation
    float pointer; //pointeur utilisé pour afficher le graphe en fonction du temps
    
    //constructeur du graphe
    graphe(int cSgraph ,int cIgraph, int cGgraph, int cMgraph){
        this.compteurBalleSgraph = cSgraph;
        this.compteurBalleIgraph = cIgraph;
        this.compteurBalleGgraph = cGgraph;
        this.compteurBalleMgraph = cMgraph;
        this.duree = 0.0;
        this.dure2 = 0;
        this.pointer = 0.0;
    }
    
    void setup() {
        background(255);
    }
    
    //getter et setter
    float getpointer(){
        return pointer;
    }
    
    void setpointer(float pointe){
        pointer = pointe;
    }
    
    float getDuree(){
        return duree;
    }
  
    void setDuree(float dure){
        duree = dure;
    }
    
    int getDure2(){
        return dure2;
    }
  
    void setDure2(int dur){
        dure2 = dur;
    }
    
    public int getcompteurBalleSgraph(){
        return compteurBalleSgraph;
    }
    
    void setcompteurBalleSgraph(int g){
        compteurBalleSgraph = g;
    }
    
    int getcompteurBalleIgraph(){
        return compteurBalleIgraph;
    }
  
    void setcompteurBalleIgraph(int g){
        compteurBalleIgraph = g;
    }
    
    int getcompteurBalleGgraph(){
        return compteurBalleGgraph;
    }
  
    void setcompteurBalleGgraph(int g){
        compteurBalleGgraph = g;
    }
    
    int getcompteurBalleMgraph(){
        return compteurBalleMgraph;
    }
  
    void setcompteurBalleMgraph(int g){
        compteurBalleMgraph = g;
    }
    
    //permet d'initialiser le temps du graphe au temps de la simulation
    void addtempsgraph(){
        if (millis() > getDure2()){
            setDure2(millis()+1);
            setDuree(getDuree() + 0.001);
            setpointer(getpointer() + 0.001);
        }
    }
    
    //met le graphe a jour
    void updategraph(){
        if(getDuree() == 0.001){
            setcompteurBalleSgraph(compteurBalleS);
            setcompteurBalleIgraph(compteurBalleI);
            setcompteurBalleGgraph(compteurBalleG);
            setcompteurBalleMgraph(compteurBalleM);
            setDuree(0);
        }
    }
}
