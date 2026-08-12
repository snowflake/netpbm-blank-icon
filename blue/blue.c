// C code to generate a simple blue gradient image

#include <stdio.h>
int
main(){
  FILE *f = fopen("blue.ppm","wb");
  fprintf(f,"P6\n16 16\n255\n");
  int i;
  for (i=0; i<256; i++){
    fputc(0, f);
    fputc(0, f);
    fputc(i, f);
  }
  fclose(f);
}  
