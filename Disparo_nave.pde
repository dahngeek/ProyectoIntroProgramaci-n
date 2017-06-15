void dibujarBalas(){
  for (int bal = 0; bal<balas.size(); bal++ ){
     Disparo balaActual = balas.get(bal);
     if(balaActual.salio()){
       balas.remove(bal);
     } else {
       balaActual.avanzeBala();
       balaActual.hacerBala();
     }
   }
}

class Disparo{
    int xshot=0;
    int yshot=0;
    Disparo(int xball, int yball){
      xshot=xball;
      yshot=yball;
    }
    void hacerBala(){
      fill(0,255,0);
      stroke(0,255,0);
      //line(xshot,yshot-tam*6,xshot,yshot);
      rect(xshot,yshot,tam,tam*3);
    }
    void avanzeBala(){
      boolean colisiona = false;
      
      for(int a = 0; a<alienigenas.size(); a++){
        Alien alienActual = alienigenas.get(a);
        if(alienActual.colisiona(xshot,yshot-tam*6)){
          colisiona = true;
          alienigenas.remove(a);
          if (alienActual.puedeDisparar)
          {
          score=score + 15;//si el alien puede disparar entonces vale 15 puntos
          }
         else{
          score=score+10; //si el alien no dispara vale 10 puntos
         }
          break; //Deja de evaluar porque sabemos que colisionó con esta bala
        }
      }
      
      if(colisiona){
        yshot = -tam*3;
      } else{
        yshot= yshot-tam*6;
      }
    }
    boolean salio(){
      if (yshot<0){
        return true;
      }
      return false;
    }
}
