#include <iostream>
#include <wiringPi.h>

const int pwmPin = 18;
const int ledPin = 23;
const int butPin = 17;

const int pwmValue = 75;

int main (int argc, char *argv[])
{
	std::cout << "Hello button world!!" << std::endl;
	wiringPiSetupGpio(); 
	pinMode (pwmPin, PWM_OUTPUT);
	pinMode (ledPin, OUTPUT);
	pinMode (butPin, INPUT);
	pullUpDnControl(butPin, PUD_UP);
	
	while (true)
	{
		if(digitalRead(butPin))
		{
			pwmWrite(pwmPin, pwmValue);
			digitalWrite(ledPin, LOW);
		}
		else
		{
			pwmWrite(pwmPin, 1024 - pwmValue);
			digitalWrite(ledPin, HIGH);
			delay(75);
			digitalWrite(ledPin, LOW);
			delay(75);
		}
	}
	return 0 ;
}