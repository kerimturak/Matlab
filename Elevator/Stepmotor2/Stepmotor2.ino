#include <Stepper.h> // Include the header file
#define STEPS 32// change this to the number of steps on your motor
Stepper stepper(STEPS, 8, 10, 9, 11);// create an instance of the stepper class using the steps and pins
int val = 0;
int flr = 1;
int one = 1024;
int two = 2048;
int three = 4096;
int trigPin = 13; 
int echoPin = 12;  
int j=0;

long zaman;
long mesafe;
void setup() {
  Serial.begin(9600);
  stepper.setSpeed(600);
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin,INPUT); 

  cli();
  /* Ayarlamaların yapılabilmesi için öncelikle kesmeler durduruldu */

  /* Timer1 kesmesi saniyede bir çalışacak şekilde ayarlanacaktır (1 Hz)*/
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1  = 0;
  OCR1A = 15624;
  /* Bir saniye aralıklar için zaman sayıcısı ayarlandı */
  TCCR1B |= (1 << WGM12);
  /* Adımlar arasında geçen süre kristal hızının 1024'e bölümü olarak ayarlandı */
  TCCR1B |= (1 << CS12) | (1 << CS10);
  TIMSK1 |= (1 << OCIE1A);
  /* Timer1 kesmesi aktif hale getirildi */

  sei();
  /* Timer1 kesmesinin çalışabilmesi için tüm kesmeler aktif hale getirildi */

}

/* Arduino otomatik olarak her saniye aşağıdaki fonksiyonu çalıştıracaktır */
ISR(TIMER1_COMPA_vect){
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);  
  zaman = pulseIn(echoPin, HIGH);
  mesafe= (zaman /29.1)/2;    
  Serial.println(mesafe);
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
        stepper.step(one);flr = 1;
      }
      else if(flr==3)
      {
        stepper.step(two);flr = 1;
      }
      else if(flr==4)
      {
        stepper.step(three);flr = 1;
      }
      break;
      
    case 2:
      if(flr==2){}
      else if(flr==1)
      {
        stepper.step(-one);flr = 2;
      }
      else if(flr==3)
      {
        stepper.step(one);flr = 2;
      }
      else if(flr==4)
      {
        stepper.step(two);flr = 2;
      }
      break;
      
    case 3:
      if(flr==3){}
      else if(flr==1)
      {
        stepper.step(-two);
        flr = 3;
      }
      else if(flr==2)
      {
        stepper.step(-one);flr = 3;
      }
      else if(flr==4)
      {
        stepper.step(one);flr = 3;
      }
      break;
      
      case 4:
      if(flr==4){}
      else if(flr==1)
      {
        stepper.step(-three);flr = 4;
      }
      else if(flr==2)
      {
        stepper.step(-two);flr = 4;
      }
      else if(flr==3)
      {
        stepper.step(-one);flr = 4;
      }
      break;
      }
  }
  delay(100); 
}
