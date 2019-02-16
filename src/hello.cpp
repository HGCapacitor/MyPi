#include <iostream>
#include <wiringPi.h>

int main (int argc, char *argv[])
{
	std::cout << "Hello world!!" << std::endl;
	wiringPiSetup () ;
	pinMode (0, OUTPUT) ;
	for (;;)
	{
		digitalWrite (0, HIGH) ; delay (500) ;
		digitalWrite (0,  LOW) ; delay (500) ;
	}
	return 0 ;
}