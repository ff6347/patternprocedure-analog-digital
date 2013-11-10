/*
Jens Rauenbusch, November 2013
@jensra
Potsdam, DE/GER

Kurs: Eingabe/Ausgabe (Basics), Prof. Hoinkis, FH Potsdam

Sprache: Deutsch

Umsetzung Muster (Konzeptkunst)
Version 3.0

FUNKTIONSBESCHREIBUNG
Dieses Programm erzeugt eine zufällige Anzahl von Dreiecken, die auf der Zeichenfläche
verteilt und zufällig ausgerichtet sind. Von den "Spitzen" der Dreiecke verläuft jeweils eine
Linie in Kurven.

HINWEIS
Die zugrunde liegende Regel für das Muster sieht vor, dass sich weder die Dreiecke noch die
Linien schneiden und dass weder Dreiecke noch Linien den Rand der Zeichenfläche berühren.
Die Umsetzung dieser Vorgabe würde ein Raster erfordern, das die Positionen der Dreiecke erfasst
und keine anderen Dreiecke an der gleichen Position zulässt.
Ein solches Raster würde den Programmieraufwand exorbitant steigern, aus diesem Grund wird auf
die Umsetzung dieser Vorgabe verzichtet.

ANMERKUNGEN ZUM CODE
Zum Teil sind Bestandteile des Codes auskommentiert, die zu Testzwecken
dennoch im Code verbleiben sollen.

Dieser Code ist ausdrücklich zur Weiterverwendung durch andere gedacht.

DANKSAGUNG
Danke an @fabiantheblind (Fabian Morón Zirfas), FH Potsdam

*/




int anzahl = int(random(3,6)); //Anzahl der Dreiecke bestimmen
Dreieck[] treeanglez = new Dreieck[anzahl]; //Array mit entsprechend vielen Dreiecken anlegen

//Variablen deklarieren, die später genutzt werden (Verwendungszweck siehe folgender Quellcode)
int xpos,ypos;
float rotation;
int breite,hoehe, laenge;
int formvariation;


//einmalige Ausführung: setup()
void setup(){
  //Schleife erzeugt zufällig platzierte Dreiecke in der entsprechenden Anzahl (s.o.)
  for (int i = 0; i<anzahl; i++){
    xpos = int(random(30,600));
    ypos = int(random(60,400));
    treeanglez[i] = new Dreieck(xpos,ypos); //(mehrere Instanzen der Klasse werden angelegt)
  } //Ende der Schleife

  size(800,500); //Fenstergröße festlegen
  background(255); //Hintergrundfarbe festlegen

  //Schleife zeigt alle Dreiecke an
  for (int i = 0; i<anzahl; i++){
   treeanglez[i].display();
  }

} //Ende setup()


//ständige Ausführung des Inhalts in draw()
void draw(){

} //Ende draw()



//Klasse Dreieck
class Dreieck{
  //Attribute (?)
  PVector pos; //Vektor anlegen, Grundlage für Dreiecke

  Dreieck(float _x, float _y){
    pos = new PVector(_x,_y);
  }

private void drawcurvevertex(ArrayList <PVector> coords) {
  beginShape(); //Formzeichnung beginnt

  for(int i = 0;i < coords.size(); i++){
      curveVertex(coords.get(i).x, coords.get(i).y); //geleiteter Startpunkt

  }
  endShape(); //Formzeichnung endet

}

private ArrayList <PVector> buildcoordslist(int [][] positions){
  ArrayList<PVector> thelist =  new ArrayList <PVector>();
  for(int i = 0; i < positions.length;i++){
    thelist.add(new PVector(positions[i][0],positions[i][1]));
  }
  
  return thelist;
}

void display(){

    noFill(); //keine Füllung der Dreiecke oder anderer Formen

    rectMode(CENTER); //"Anfasspunkt" der Objekte auf MITTE setzen
    pushMatrix(); //Matrix auf Mittelpunkt des Objektes setzen:
    translate(pos.x, pos.y); //Punkt (0|0) neu setzen

    rotation = random(0,7); //zufälligen Rotationswert bestimmen
    rotate(PI/rotation); //Rotation

    //zufällige Breite und Höhe bestimmen
    breite = int(random(10,70));
    hoehe = int(random(30,80));

     //Dreieck anlegen
    triangle(-(breite),hoehe,breite,hoehe,0,0);

    //Länge der Linie bestimmen und Linie anlegen
    laenge = int(random(30,90));


 //Für Vertex-Zeichnungen mindestens 4 curveVertex-Befehle
//Dabei ist der 1. Befehl der "geleitete" Startpunkt, bestimmt also die Startrichtung
//Der 2. Befehl ist die eigentliche Startkoordinate
//Der 3. Befehl (bei 4) ist die Endkoordinate der Kurve
//Der 4. Befehl bestimmt den "geleiteten" Endpunkt

//Sofern ein fünfter Befehl eingefügt wird, wird die Kurve zwischen 2.,3., und 5. Punkt gezeichnet

 //VARIATIONEN VON KURVEN
 formvariation = int(random(0,3));

 if (formvariation == 1){

 /*
 FORM A1
 */

int [][] positions1 = {{0,  -10},{0,0},{-10,-20},{40,-50},{0, -60},{0, -60}};
ArrayList <PVector> list1 = buildcoordslist(positions1);
drawcurvevertex(list1);


//beginShape(); //Formzeichnung beginnt
//
//  curveVertex(0,  -10); //geleiteter Startpunkt
//  curveVertex(0,0); //Startpunkt der Kurve
//
//  curveVertex(-10,-20); //Zwischenpunkt 1
//  curveVertex(40,-50); //Zwischenpunkt 2
//
//  curveVertex(0, -60); //Endpunkt
//  curveVertex(0, -60); //Richtung des Endpunktes
//
//endShape(); //Formzeichnung endet



/*
 FORM A2
 */
 int [][] positions2 = {{0,  -90},{0,-60},{-50,-90},{30,-110},{0, -120},{0, -120}};
 ArrayList <PVector> list2 = buildcoordslist(positions1);
drawcurvevertex(list2);

//beginShape(); //Formzeichnung beginnt
//
//  curveVertex(0,  -90); //geleiteter Startpunkt
//  curveVertex(0,-60); //Startpunkt der Kurve
//
//  curveVertex(-50,-90); //Zwischenpunkt 1
//  curveVertex(30,-110); //Zwischenpunkt 2
//
//  curveVertex(0, -120); //Endpunkt
//  curveVertex(0, -120); //Richtung des Endpunktes
//
//endShape(); //Formzeichnung endet

 } else if (formvariation == 2) {

   /*
 FORM B1
 */
 
  int [][] positions3 =   {{0,  -10},  {0,0},{40,-20},  {-10,-50},{0, -60},  {0, -60}};
 ArrayList <PVector> list3 = buildcoordslist(positions3);
drawcurvevertex(list3);

//beginShape(); //Formzeichnung beginnt
//
//  curveVertex(0,  -10); //geleiteter Startpunkt
//  curveVertex(0,0); //Startpunkt der Kurve
//
//  curveVertex(40,-20); //Zwischenpunkt 1
//  curveVertex(-10,-50); //Zwischenpunkt 2
//
//  curveVertex(0, -60); //Endpunkt
//  curveVertex(0, -60); //Richtung des Endpunktes
//
//endShape(); //Formzeichnung endet

/*
 FORM B2
 */
 int [][] positions4 = {{0,  -90},  {0,-60},  {30,-90},  {-50,-110},  {0, -190},  {0, -190}}; 
  ArrayList <PVector> list4 = buildcoordslist(positions4);
drawcurvevertex(list4);
//beginShape(); //Formzeichnung beginnt
//
//  curveVertex(0,  -90); //geleiteter Startpunkt
//  curveVertex(0,-60); //Startpunkt der Kurve
//
//  curveVertex(30,-90); //Zwischenpunkt 1
//  curveVertex(-50,-110); //Zwischenpunkt 2
//
//  curveVertex(0, -190); //Endpunkt
//  curveVertex(0, -190); //Richtung des Endpunktes
//
//endShape(); //Formzeichnung endet

 } else {

   /*
 FORM C1
 */
int [][] positions5 =   {{0,  -10},  {0,0},  {-20,-20},  {30,-50},  {0, -80},  {0, -80}};
 ArrayList <PVector> list5 = buildcoordslist(positions5);
drawcurvevertex(list5);
//beginShape(); //Formzeichnung beginnt
//
//  curveVertex(0,  -10); //geleiteter Startpunkt
//  curveVertex(0,0); //Startpunkt der Kurve
//
//  curveVertex(-20,-20); //Zwischenpunkt 1
//  curveVertex(30,-50); //Zwischenpunkt 2
//
//  curveVertex(0, -80); //Endpunkt
//  curveVertex(0, -80); //Richtung des Endpunktes
//
//endShape(); //Formzeichnung endet

/*
 FORM C2
 */
 
 int [][] positions6 =   {{0,  -90},  {0,-80},  {50,-90},  {-30,-110},  {0, -120},  {0, -120}};
  ArrayList <PVector> list6 = buildcoordslist(positions6);
drawcurvevertex(list6);
//beginShape(); //Formzeichnung beginnt
//
//  curveVertex(0,  -90); //geleiteter Startpunkt
//  curveVertex(0,-80); //Startpunkt der Kurve
//
//  curveVertex(50,-90); //Zwischenpunkt 1
//  curveVertex(-30,-110); //Zwischenpunkt 2
//
//  curveVertex(0, -120); //Endpunkt
//  curveVertex(0, -120); //Richtung des Endpunktes
//
//endShape(); //Formzeichnung endet


 } //Formvariationen enden hier

    popMatrix(); //Matrix zurücksetzen

  } //Ende display()
} //Ende Dreieck
