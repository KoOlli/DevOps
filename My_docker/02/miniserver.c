#include <fcgi_stdio.h>
#include <fcgi_config.h>
#include <fcgiapp.h>
#include <stdio.h>

int main(void) {
  while (FCGI_Accept() >= 0) {
    printf("Content-type: text/html\r\n\r\nHello World!\r\n");
  }
  return 0;
}