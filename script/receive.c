#include "stdio.h"
#include "sys/alt_stdio.h"
#define switches (volatile char *) 0x2070
#define leds (volatile char *) 0x2060
#define transEn (volatile char *) 0x2050
#define charSent (volatile char *) 0x2040
#define parallelDataOut (volatile char *) 0x2030
#define load (volatile char *) 0x2020
#define parallelDataIn (volatile char *) 0x2010
#define charReceived (volatile char *) 0x2000


int main(){
	int sent = 0;
	int read = 0;
	int write = 1;
	char temp;
	alt_putstr("Hello from Nios II!\n");


	while (1) {
	          while (read) {
	              if (sent){
	                  *parallelDataOut = alt_getchar();
	                  sent = 0;
	              }

	              *load = 1;
	              *transEn = 1;
	              usleep(10);
	              *load = 0;


	              while (1){
	                          if (*charSent){
	                              *transEn = 0;
	                              sent = 1;
	                              break;
	                          }
	               }
	              if (*parallelDataOut == '\n') {
	                 //  alt_putchar('w');
	                   write = 1;
	                   read = 0;
	                   sent = 0;
	                   temp ='a';
	              }
	          }
	        //int count = 0;
	       while (write) {
	            if (*charReceived) {
	                temp = *parallelDataIn;
	                alt_putchar(temp);
	            }
	            //count++;

	            if (temp == '\n') {
	               // alt_putchar('r');
	                write = 0;
	                read = 1;
	                sent = 1;
	                //alt_putchar(count);
	            }
	        }
	    }
	    return 0;
	}
