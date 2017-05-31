 int ancho=600;
 int alto= 600;
 int x = ancho/2;
 int y = alto - (alto/10);
 boolean derecha = false;
 boolean izquierda = false;
 int tam= (ancho+alto/2)/300;
 ArrayList<Disparo> balas = new ArrayList<Disparo>();
void setup ()
{
  size(600,600);
  background(0);
  fill(255);
 // disparos(x,y-tam*6);
}

 void draw(){
   background(0);
   nave();
   movimientoNave();
   for (Disparo x : balas){
     x.avanzeBala();
     x.hacerBala();
   }
   
 } 
 void keyPressed(){ // Se Activa Cuando se presiona una tecla
    println("" + keyCode);//  PARA VER LOS CODIGOS DE LAS TECLAS
   if (keyCode == 39 || keyCode == 68) // Si se presiona la tecla DERECHA o D
   {
     derecha= true; 
   }
   if (keyCode == 37 || keyCode == 65){// Si se presiona la tecla IZQUIERDA o A   
     izquierda = true;
   }
   if (keyCode == 32){// Si se presiona la barra espaciadora  
     Disparo aux = new Disparo(x,y);
     balas.add(aux);
   }
 }
 
 void keyReleased() // El Void KeyReleased se activa cuando se suelta una tecla
 {
   if (keyCode == 39 || keyCode == 68){
     derecha= false;
   }
   if (keyCode == 37|| keyCode == 65){
     izquierda=false;
   }
 }
 void movimientoNave(){
   if  (derecha == true){ //Si el valor derecha esta activado
   x= x+(height/200);
   }
   if (izquierda == true){// Si el valor izquierda esta activado 
   x= x-(height/200);
   }
 }
 
 void nave(){
  //int tam= (height+width/2)/300;
  noStroke();
  fill(255,0,0);//cuadros rojos
  rect(x,y,tam,tam*2);
  rect(x-tam,y-tam*2,tam,tam*3);
  rect(x+tam,y-tam*2,tam,tam*3);
  rect(x-tam*4,y+tam*4,tam*2,tam);
  rect(x-tam*4,y+tam*4,tam,tam*2);
  rect(x+tam*3,y+tam*4,tam*2,tam);
  rect(x+tam*4,y+tam*4,tam,tam*2);
  rect(x-tam*6,y+tam*2,tam,tam*2);
  rect(x+tam*6,y+tam*2,tam,tam*2);
  fill(0,0,255);//cuadros azules
  rect(x,y-tam*4,tam,tam*4);
  rect(x-tam*4,y,tam,tam);
  rect(x+tam*4,y,tam,tam);
  rect(x-tam*3,y-tam,tam,tam);
  rect(x+tam*3,y-tam,tam,tam);
  fill(255,255,255);//cuadros blancos
  rect(x,y-tam*6,tam,tam*2);
  rect(x-tam,y-tam*4,tam,tam*2);
  rect(x+tam,y-tam*4,tam,tam*2);
  rect(x-tam*4,y+tam,tam*4,tam*3);
  rect(x+tam,y+tam,tam*4,tam*3);
  rect(x-tam,y+tam*2,tam*3,tam*3);
  rect(x-tam*2,y-tam*2,tam,tam*3);
  rect(x+tam*2,y-tam*2,tam,tam*3);
  rect(x-tam*3,y,tam,tam);
  rect(x+tam*3,y,tam,tam);
  rect(x-tam*5,y+tam*4,tam,tam*2);
  rect(x+tam*5,y+tam*4,tam,tam*2);
  rect(x-tam*6,y+tam*4,tam,tam);
  rect(x+tam*6,y+tam*4,tam,tam);
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
    line(xshot,yshot-tam*6,xshot,yshot);
  }
  void avanzeBala(){
    yshot= yshot-4;
  }
  
  
}
