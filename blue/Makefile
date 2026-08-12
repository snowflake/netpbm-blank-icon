

all:  blue

blue: blue.c
	cc -o blue blue.c

ico:
	./blue
	cat blue.ppm | pamtowinicon -v > blue.ico
	cat blue.ico | winicontopam -v > blue.pam

clean:
	rm -f blue blue.ico blue.ppm blue.pam



