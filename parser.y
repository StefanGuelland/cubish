%{

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
	int ival;
	float fval;
	struct{
	    uint8_t r;
	    uint8_t g;
	    uint8_t b;
	} farbe_val;
	struct{
	    int x;
	    int y;
	    int z;
	} koordinate_val;
}

%token T_PLUS
%token T_MINUS
%token T_MAL
%token T_GETEILT
%token T_GETEILT_DURCH
%token T_DURCH
%token T_MODULO

%token T_KL_LINKS
%token T_KL_RECHTS

%token T_WIEDERHOLE
%token T_SOLANGE
%token T_WENN
%token T_DANN
%token T_SONST
%token T_ENDE
%token T_GLEICH
%token T_KLEINER
%token T_KLEINER_GLEICH
%token T_GROESSER
%token T_GROESSER_GLEICH
%token T_NICHT
%token T_UND
%token T_ODER

%token T_UEBERSCHNEIDET

%token T_KEYWORD_RGB
%token T_KEYWORD_SETZE
%token T_KEYWORD_AUF
%token T_KEYWORD_ERSTELLE
%token T_KEYWORD_ZAHL
%token T_KEYWORD_WUERFEL
%token T_KEYWORD_BOX
%token T_KEYWORD_VERSCHIEBE
%token T_KEYWORD_ROTIERE
%token T_KEYWORD_ANZEIGEN
%token T_KEYWORD_WARTE
%token T_KEYWORD_UM
%token T_KEYWORD_VON
%token T_KEYWORD_GRAD
%token T_KEYWORD_ENTFERNE
%token T_KEYWORD_FAERBE
%token T_KEYWORD_ZEITEINHEITEN
%token T_KEYWORD_MS

%token T_LINKS
%token T_RECHTS
%token T_SEPARATOR

%token T_X_AXE
%token T_Y_AXE
%token T_Z_AXE

%token T_NEWLINE
%token T_QUIT

%left T_PLUS
%left T_MINUS
%left T_MULTIPLY
%left T_DIVIDE

%token T_FARBE_BLAU
%token T_FARBE_GELB
%token T_FARBE_GRUEN
%token T_FARBE_ROT
%token T_FARBE_TUERKIS
%token T_FARBE_WEISS
%token T_FARBE_SCHWARZ

%token T_X_MIN
%token T_X_MAX
%token T_Y_MIN
%token T_Y_MAX
%token T_Z_MIN
%token T_Z_MAX

%token T_IDENTIFIER

%token<ival> T_INT
%token<fval> T_FLOAT

%token<farbe_val> T_FARBE
%token<koordinate_val> T_KOORDINATE

%type<koordinate_val> koordinate
%type<farbe_val> farbe

%start program

%%

koordinate: T_KOORDINATE { $$ = $1; }
     | T_KL_LINKS T_INT T_SEPARATOR T_INT T_SEPARATOR T_INT T_KL_RECHTS{
           $$.x = $2;
           $$.y = $4;
           $$.z = $6;
      }

farbe: T_FARBE { $$ = $1; }
     | T_KEYWORD_RGB T_KL_LINKS T_INT T_SEPARATOR T_INT T_SEPARATOR T_INT T_KL_RECHTS {
            $$.r = $3;
            $$.g = $5;
            $$.b = $7;
       }
     | T_FARBE_BLAU {
            $$.r = 0;
            $$.g = 0;
            $$.b = 255;
        }
     | T_FARBE_GELB {
            $$.r = 255;
            $$.g = 255;
            $$.b = 0;
        }
     | T_FARBE_GRUEN {
            $$.r = 0;
            $$.g = 255;
            $$.b = 0;
        }
     | T_FARBE_ROT {
            $$.r = 255;
            $$.g = 0;
            $$.b = 0;
        }
     | T_FARBE_TUERKIS {
             $$.r = 0;
             $$.g = 255;
             $$.b = 255;
         }
     | T_FARBE_WEISS {
            $$.r = 255;
            $$.g = 255;
            $$.b = 255;
        }
     | T_FARBE_SCHWARZ {
            $$.r = 0;
            $$.g = 0;
            $$.b = 0;
        }
;

cmd: T_KEYWORD_ERSTELLE T_KEYWORD_ZAHL T_IDENTIFIER {
              printf("Erstelle Zahl x \n");
     }
   | T_KEYWORD_ERSTELLE T_KEYWORD_WUERFEL T_KL_LINKS T_INT T_KL_RECHTS T_IDENTIFIER {
              printf("\t cmd erstelle wurfel mit Kantenlaenge %d\n",$4);
     }
   | T_KEYWORD_ERSTELLE T_KEYWORD_BOX T_KL_LINKS T_INT T_SEPARATOR T_INT T_SEPARATOR T_INT T_KL_RECHTS T_IDENTIFIER {
              printf("\t cmd erstelle box mit Kantenlaengen x: %d y: %d z: %d\n", $4, $6, $8);
     }
   | T_KEYWORD_VERSCHIEBE T_IDENTIFIER T_KEYWORD_UM koordinate {
              printf("\t cmd verschiebe um: X: %i Y: %i Z: %i \n", $4.x, $4.y, $4.z);
     }
   | T_KEYWORD_VERSCHIEBE T_IDENTIFIER T_KEYWORD_AUF koordinate {
              printf("\t cmd verschiebe auf: X: %i Y: %i Z: %i \n", $4.x, $4.y, $4.z);
     }
   | T_KEYWORD_FAERBE T_IDENTIFIER T_KEYWORD_UM farbe {
         printf("\t cmd faerbe um: Red: %i Green: %i Blue: %i \n", $4.r, $4.g, $4.b);
     }
   | T_KEYWORD_FAERBE T_IDENTIFIER T_KEYWORD_AUF farbe {
              printf("\t cmd faerbe auf: Red: %i Green: %i Blue: %i \n", $4.r, $4.g, $4.b);
     }
   | T_KEYWORD_ROTIERE T_KEYWORD_AUF T_X_AXE T_LINKS {
              printf("\tRotiere links auf x achse...\n");
     }
   | T_KEYWORD_ROTIERE T_KEYWORD_AUF T_X_AXE T_RECHTS {
              printf("\tRotiere rechts auf x achse...\n");
     }
   | T_KEYWORD_WARTE T_INT T_KEYWORD_ZEITEINHEITEN {
              printf("\tWarte x Zeiteinheiten...\n");
     }
   | T_KEYWORD_ENTFERNE T_IDENTIFIER {
              printf("\tEntferne Identifier\n");
     }
   | T_KEYWORD_SETZE T_KEYWORD_ZEITEINHEITEN T_KEYWORD_AUF T_INT T_KEYWORD_MS {
              printf("\t Setze Zeiteinheit auf xx ms\n");
     }
   | T_KEYWORD_ANZEIGEN {
              printf("\t Sende Inhalte an Cube... \n");
     }
;




math_exp:
    | T_KL_LINKS math_exp T_KL_RECHTS                         {printf("\t Klammern\n");}
    | T_IDENTIFIER T_PLUS T_IDENTIFIER                        {printf("\t Plus\n");}
    | T_IDENTIFIER T_MINUS T_IDENTIFIER                       {printf("\t Minus\n");}
    | T_IDENTIFIER T_MAL T_IDENTIFIER                         {printf("\t Mal\n");}
    | T_IDENTIFIER T_GETEILT T_IDENTIFIER                     {printf("\t Geteilt\n");}
    | T_IDENTIFIER T_MODULO T_IDENTIFIER                      {printf("\t Modulo\n");}
;

identifier_or_math_exp:
    | T_IDENTIFIER
    | math_exp
;

arith_exp:
    | identifier_or_math_exp T_GLEICH T_IDENTIFIER            {printf("\t Gleich\n");}
    | identifier_or_math_exp T_KLEINER T_IDENTIFIER           {printf("\t Kleiner\n");}
    | identifier_or_math_exp T_GROESSER T_IDENTIFIER          {printf("\t Groesser\n");}
    | identifier_or_math_exp T_KLEINER_GLEICH T_IDENTIFIER    {printf("\t Kleiner Gleich\n");}
    | identifier_or_math_exp T_GROESSER_GLEICH T_IDENTIFIER   {printf("\t Groesser Gleich\n");}
    | identifier_or_math_exp T_UEBERSCHNEIDET T_IDENTIFIER    {printf("\t Ueberschneidet\n");}
;

exp:
    | arith_exp                                               {printf("\t Arithmatischer Ausdruck\n");}
    | T_KL_LINKS arith_exp T_KL_RECHTS                        {printf("\t Arithmatischer Ausdruck\n");}
    | T_KL_LINKS math_exp T_KL_RECHTS arith_exp               {printf("\t Gemischter Ausdruck\n");}
;

smt:
    | cmd
    | smt T_SONST cmd
;

loop_and_exp:
    | T_WIEDERHOLE cmd T_SOLANGE exp                {printf("\t Schleife\n");}
    | T_WENN exp T_DANN smt                         {printf("\t If-Abfrage\n");}

;

line: T_NEWLINE
    | loop_and_exp T_NEWLINE
    | exp T_NEWLINE
    | cmd T_NEWLINE
    | koordinate T_NEWLINE {
           printf("\tX: %i Y: %i Z: %i \n", $1.x, $1.y, $1.z);
       }
    | farbe T_NEWLINE {
            printf("\tRed: %i Green: %i Blue: %i \n", $1.r, $1.g, $1.b);
        }
    | T_QUIT T_NEWLINE {
            printf("bye!\n"); exit(0);
        }
;

program:
	   | program line
;


%%

int main() {
	yyin = stdin;

	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}