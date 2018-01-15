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
}

%token T_PLUS
%token T_MINUS
%token T_MAL
%token T_GETEILT
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

%token T_COLOUR_BLUE
%token T_COLOUR_YELLOW
%token T_COLOUR_GREEN
%token T_COLOUR_RED
%token T_COLOUR_WHITE
%token T_COLOUR_BLACK

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


%type<ival> expression

%type<farbe_val> farbe

%start calculation

%%

farbe: T_FARBE { $$ = $1; }
     | T_KEYWORD_RGB T_KL_LINKS T_INT T_SEPARATOR T_INT T_SEPARATOR T_INT T_KL_RECHTS {
            $$.r = $3;
            $$.g = $5;
            $$.b = $7;
       }
;

cmd: T_KEYWORD_FAERBE T_IDENTIFIER T_KEYWORD_UM farbe {
         printf("\t cmd faerbe: Red: %i Green: %i Blue: %i \n", $4.r, $4.g, $4.b);
     }
;

calculation:
	   | calculation line
;

line: T_NEWLINE
    | expression T_NEWLINE {
            printf("\tResult: %i\n", $1);
        }

    | cmd T_NEWLINE
    | farbe T_NEWLINE {
            printf("\tRed: %i Green: %i Blue: %i \n", $1.r, $1.g, $1.b);
        }
    | T_KEYWORD_ANZEIGEN T_NEWLINE {
            printf("Zeichne auf Cube\n");
        }
    | T_QUIT T_NEWLINE {
            printf("bye!\n"); exit(0);
        }
;

expression: T_INT				{ $$ = $1; }
	  | expression T_PLUS expression	{ $$ = $1 + $3; }
	  | expression T_MINUS expression	{ $$ = $1 - $3; }
	  | expression T_MULTIPLY expression	{ $$ = $1 * $3; }
	  | T_KL_LINKS expression T_KL_RECHTS		{ $$ = $2; }
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