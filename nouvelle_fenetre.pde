int diamettre=4;
graphe graph;

class CreateNewWindow extends PApplet {
    //constructeur de la nouvelle fenêtre
    CreateNewWindow(){
        super();
        PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    }

    int[] arrayOfFloatsSains = new int[compteurBalleS];
  
    void settings() {
        size(800,800);
        smooth();
        graph = new graphe(499,1,0,0);
    }
  
    void setup() {
        background(255);
    }
    
    void draw() {
      //affichage de la courbe
        fill(0, 0, 0);
        noStroke();
        
        //appelle des méthodes
        graph.addtempsgraph();
        graph.updategraph();
        
        //différente courbe pour le graphe
        fill(sain);
        ellipse(graph.getpointer()*150+diamettre,800-diamettre*graph.getcompteurBalleSgraph()/2.6,diamettre,diamettre);
        fill(infecte);
        ellipse(graph.getpointer()*150+diamettre,800-diamettre*graph.getcompteurBalleIgraph()/2.6,diamettre,diamettre);
        fill(guerie);
        ellipse(graph.getpointer()*150+diamettre,800-diamettre*graph.getcompteurBalleGgraph()/2.6,diamettre,diamettre);
        fill(mort);
        ellipse(graph.getpointer()*150+diamettre,800-diamettre*graph.getcompteurBalleMgraph()/2.6,diamettre,diamettre);
        
    }
}
