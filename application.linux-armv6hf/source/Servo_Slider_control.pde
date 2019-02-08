import processing.serial.*;
import cc.arduino.*;
import controlP5.*;

ControlP5 controlP5;
Table table;
String text;

Arduino arduino;
int servoAngle = 90;
int servoAnglea = 90;
int servoAngleb = 90;
int servoAnglec = 90;
int servoAngled = 90;
int servoAnglee = 90;
void setup() {

 size(450,400);

 //println (Arduino.list());
 arduino = new Arduino(this, Arduino.list()[0], 57600);

 for (int i = 0; i <= 13; i++)
 arduino.pinMode(i, Arduino.OUTPUT);

 controlP5 = new ControlP5(this);
 controlP5.addSlider("servoAngle",0,180,servoAngle,20,10,180,20);
controlP5.addSlider("servoAnglea",0,180,servoAnglea,20,50,180,20);
controlP5.addSlider("servoAngleb",0,180,servoAngleb,20,90,180,20);
controlP5.addSlider("servoAnglec",0,180,servoAngle,20,130,180,20);
controlP5.addSlider("servoAngled",0,180,servoAngle,20,170,180,20);
controlP5.addSlider("servoAnglee",0,180,servoAngle,20,210,180,20);
controlP5.addButton("Save Angles",1,240,260,180,20);
controlP5.addTextfield("Name",20,260,180,20);


table = new Table();

table.addColumn("ID");
table.addColumn("servoAngle");
table.addColumn("servoAnglea");
table.addColumn("servoAngleb");
table.addColumn("servoAnglec");
table.addColumn("servoAngled");
table.addColumn("servoAnglee");


saveTable(table, "Desktop/new.csv");
}
void draw() {
 arduino.analogWrite(9, servoAngle);
 arduino.analogWrite(8, servoAnglea);
 arduino.analogWrite(7, servoAngleb);
 arduino.analogWrite(6, servoAnglec);
 arduino.analogWrite(5, servoAnglec);
 arduino.analogWrite(4, servoAnglec);
 
 //delay(15);
}

void controlEvent(ControlEvent theEvent) {
 if(theEvent.isController()){
  if(theEvent.getController().getName()=="Save Angles"){
    println("Data Saved to new.csv");
     TableRow newRow = table.addRow();
     text = controlP5.get(Textfield.class,"Name").getText();
     newRow.setString("ID", text);
     newRow.setFloat("servoAngle", servoAngle);
     newRow.setFloat("servoAnglea", servoAnglea);
     newRow.setFloat("servoAngleb", servoAngleb);
     newRow.setFloat("servoAnglec", servoAnglec);
    newRow.setFloat("servoAngled", servoAngled);
     newRow.setFloat("servoAnglee", servoAnglee);
     saveTable(table, "Values/new.csv");
  }
 }
}
