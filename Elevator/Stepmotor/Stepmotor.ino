#include <Stepper.h> // Include the header file
#define STEPS 32// change this to the number of steps on your motor
Stepper stepper(STEPS, 8, 10, 9, 11);// create an instance of the stepper class using the steps and pins
int val = 0;
int flr = 1;
int one = 1024;
int two = 2048;
int trigPin = 13; 
int echoPin = 12;  
 
long zaman;
long mesafe;
void setup() {
  Serial.begin(9600);
  stepper.setSpeed(600);
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin,INPUT); 
}

void loop() {
  while(Serial.available()>0)
  {
    val = Serial.parseInt(); // istenilen kat
    switch(val){
    case 1:
      if(flr==1){}
      else if(flr==2)
      {
        stepper.step(one);
        flr = 1;
      }
      else if(flr==3)
      {
        stepper.step(two);
        flr = 1;
      }
      break;
    case 2:
      if(flr==2){}
      else if(flr==1)
      {
        stepper.step(-one);
        flr = 2;
      }
      else if(flr==3)
      {
        stepper.step(one);
        flr = 2;
      }
      break;
    case 3:
      if(flr==3){}
      else if(flr==2)
      {
        stepper.step(-one);
        flr = 3;
      }
      else if(flr==1)
      {
        stepper.step(-two);
        flr = 3;
      }
      break;
}
  }
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);  
  zaman = pulseIn(echoPin, HIGH);
  mesafe= (zaman /29.1)/2;    
  Serial.println(mesafe);
  delay(1000); 
}
