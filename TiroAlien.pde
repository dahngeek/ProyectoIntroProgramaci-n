class DisparoAlien{
  int tirox=0;
  int tiroy=0;
  DisparoAlien(int xtiro, int ytiro){
    tirox=xtiro;
    tiroy=ytiro;
  }
  void hacerTiro(){
    fill(255,0,0);
    stroke(255,0,0);
    rect(tirox,tiroy+fall,tam,tam*3);
  }
  void avanzeTiro(){
    boolean colisiono=false;
    for(int a = 0; a<tiros.size(); a++){
       DisparoAlien tiroActual = tiros.get(a);
        if(tiroActual.colisiono(tirox,tiroy)){
          colisiono = true;
          tiros.remove(a);
          golpes=golpes+1;
          break;
        }
    }
    if (colisiono){
      tiroy=height+tam;
    }else{
      tiroy=tiroy+tam;
    }
  }
  Boolean sale(){
    if (tiroy>height){
      return true;
    }
    return false; 
  }
  boolean colisiono(int xbala, int ybala){
    boolean colisiona = false;
    for(int i =0; i<usuarios.size();i++){
       NaveUsuario naveActual = usuarios.get(i);
       int x = naveActual.x;
       int y = naveActual.y;
       if (dist(xbala,ybala+tam*3+fall,x,y)<=tam*4 ||dist(xbala,ybala+tam*3,x,y)<=tam*5 ||dist(xbala,ybala,x,y)<=tam*5 
          || dist(xbala,ybala,x+tam*5,y+tam*4)<=tam*2 || dist(xbala,ybala+tam*3,x+tam*5,y+tam*4)<=tam*2 || dist(xbala,ybala+tam*3+fall,x+tam*5,y+tam*4)<=tam*2
          || dist(xbala,ybala,x-tam*5,y+tam*4)<=tam*2 || dist(xbala,ybala+tam*3,x-tam*5,y+tam*4)<=tam*2 || dist(xbala,ybala+tam*3+fall,x-tam*5,y+tam*4)<=tam*2
          ){
          colisiona = true;
          naveActual.reducirSalud();
          break;
     }
    }
    return colisiona;
  }
}