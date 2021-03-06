%{

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "artnet_client.h"
#include <string.h>

#include "ParseTreeNode_Interface.h"
#include "ParseTreeNodeBool_Interface.h"
#include "ParseTreeNodeInt_Interface.h"

#include "parseTree/SetzeIntegerIdentifier.h"
#include "parseTree/ProgramBlock.h"
#include "parseTree/ErstelleZahl.h"
#include "parseTree/ErstelleWuerfel.h"
#include "parseTree/ErstelleBox.h"
#include "parseTree/VerschiebeUm.h"
#include "parseTree/VerschiebeAuf.h"
#include "parseTree/FaerbeUm.h"
#include "parseTree/FaerbeAuf.h"
#include "parseTree/Anzeigen.h"
#include "parseTree/Warte.h"

#include "parseTree/Wiederhole.h"
#include "parseTree/Wenn.h"

#include "parseTree/Gleich.h"
#include "parseTree/Groesser.h"
#include "parseTree/Kleiner.h"

#include "parseTree/Integer.h"
#include "parseTree/IntegerIdentifier.h"
#include "parseTree/Plus.h"
#include "parseTree/Minus.h"
#include "parseTree/Mal.h"
#include "parseTree/Geteilt.h"
#include "parseTree/Modulo.h"

extern int yylex();
extern int yyparse();
extern FILE* yyin;
extern int yyget_lineno  (void);

void yyerror(const char* s);
%}

%define parse.error verbose
%define parse.lac full

%union {
	int ival;
	float fval;
	const char* str_val;
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
	ParseTreeNode_Interface* parseTreeEntry;
	ParseTreeNodeBool_Interface* parseTreeBoolEntry;
	ParseTreeNodeInt_Interface* parseTreeIntEntry;
}




%token T_WIEDERHOLE
%token T_SOLANGE
%token T_WENN
%token T_DANN
%nonassoc T_SONST
%token T_ENDE

/*Lex and YACC S. 225*/
%nonassoc LOWER_THAN_ELSE

%left T_GLEICH
%left T_KLEINER
%left T_KLEINER_GLEICH
%left T_GROESSER
%left T_GROESSER_GLEICH

%left T_NICHT
%left  T_UND
%left  T_ODER

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

%token<ival> T_INT
%token<fval> T_FLOAT

%token<str_val> T_IDENTIFIER
%token<farbe_val> T_FARBE
%token<koordinate_val> T_KOORDINATE


%left T_PLUS
%left T_MINUS
%left T_MAL
%left T_GETEILT
%left T_MODULO

%left T_KL_LINKS
%left T_KL_RECHTS

%type<koordinate_val> koordinate
%type<farbe_val> farbe

%type<parseTreeIntEntry> math_exp
%type<parseTreeBoolEntry> arith_exp

%type<parseTreeEntry> program_start
%type<parseTreeEntry> program
%type<parseTreeEntry> line
%type<parseTreeEntry> cmd
%type<parseTreeEntry> loop_and_exp

%start program_start

%%

koordinate: T_KOORDINATE { $$ = $1; }
     | T_KL_LINKS math_exp T_SEPARATOR math_exp T_SEPARATOR math_exp T_KL_RECHTS{
           //$$.x = $2;
           //$$.y = $4;
           //$$.z = $6;
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
              printf("Erstelle Zahl %s \n", $3);
              $$ = new ParseTree::ErstelleZahl($3);
     }
   | T_KEYWORD_ERSTELLE T_KEYWORD_WUERFEL T_KL_LINKS T_INT T_KL_RECHTS T_IDENTIFIER {
              printf("\t cmd erstelle wurfel %s mit Kantenlaenge %d\n", $6, $4);
              $$ = new ParseTree::ErstelleWuerfel($6, $4);
     }
   | T_KEYWORD_ERSTELLE T_KEYWORD_BOX T_KL_LINKS T_INT T_SEPARATOR T_INT T_SEPARATOR T_INT T_KL_RECHTS T_IDENTIFIER {
              printf("\t cmd erstelle box %s mit Kantenlaengen x: %d y: %d z: %d\n", $10, $4, $6, $8);
              $$ = new ParseTree::ErstelleBox($10, $4, $6, $8);
     }
   | T_KEYWORD_VERSCHIEBE T_IDENTIFIER T_KEYWORD_UM koordinate {
              printf("\t cmd verschiebe %s um: X: %i Y: %i Z: %i \n", $2, $4.x, $4.y, $4.z);
              $$ = new ParseTree::VerschiebeUm($2, $4.x, $4.y, $4.z);
     }
   | T_KEYWORD_VERSCHIEBE T_IDENTIFIER T_KEYWORD_AUF koordinate {
              printf("\t cmd verschiebe %s auf: X: %i Y: %i Z: %i \n", $2, $4.x, $4.y, $4.z);
              $$ = new ParseTree::VerschiebeAuf($2, $4.x, $4.y, $4.z);
     }
   | T_KEYWORD_FAERBE T_IDENTIFIER T_KEYWORD_UM farbe {
              printf("\t cmd faerbe %s um: Red: %i Green: %i Blue: %i \n", $2, $4.r, $4.g, $4.b);
              $$ = new ParseTree::FaerbeUm($2, $4.r, $4.g, $4.b);
     }
   | T_KEYWORD_FAERBE T_IDENTIFIER T_KEYWORD_AUF farbe {
              printf("\t cmd faerbe %s auf: Red: %i Green: %i Blue: %i \n", $2, $4.r, $4.g, $4.b);
              $$ = new ParseTree::FaerbeAuf($2, $4.r, $4.g, $4.b);
     }
   | T_KEYWORD_ROTIERE T_KEYWORD_AUF T_X_AXE T_LINKS {
              printf("\tRotiere links auf x achse...\n");
     }
   | T_KEYWORD_ROTIERE T_KEYWORD_AUF T_X_AXE T_RECHTS {
              printf("\tRotiere rechts auf x achse...\n");
     }
   | T_KEYWORD_WARTE math_exp T_KEYWORD_ZEITEINHEITEN {
              printf("\tWarte x Zeiteinheiten...\n");
              $$ = new ParseTree::Warte(2);
     }
   | T_KEYWORD_ENTFERNE T_IDENTIFIER {
              printf("\tEntferne Identifier %s \n", $2);
     }
   | T_KEYWORD_SETZE T_KEYWORD_ZEITEINHEITEN T_KEYWORD_AUF math_exp T_KEYWORD_MS {
              printf("\t Setze Zeiteinheit auf xx ms\n");
     }
   | T_KEYWORD_SETZE T_IDENTIFIER T_KEYWORD_AUF math_exp {
             printf("\t Setze %s auf wert %d \n", $2, $4);
              $$ = new ParseTree::SetzeIntegerIdentifier($2, $4);

     }
   | T_KEYWORD_ANZEIGEN {
              printf("\t Sende Inhalte an Cube... \n");
              $$ = new ParseTree::Anzeigen();
     }
;


math_exp:
      T_IDENTIFIER                                     {
           $$ = new ParseTree::IntegerIdentifier($1);
    }
    | T_INT                                            {
         $$ = new ParseTree::Integer($1);
    }

    |T_KL_LINKS math_exp T_KL_RECHTS                 {
        printf("\t Klammern\n");
        $$ = $2;
    }
    | math_exp T_PLUS    math_exp                     {
        printf("\t Plus\n");
        $$ = new ParseTree::Plus($1, $3);
    }
    | math_exp T_MINUS   math_exp                     {
        printf("\t Minus\n");
        $$ = new ParseTree::Minus($1, $3);
    }
    | math_exp T_MAL     math_exp                     {
        printf("\t Mal\n");
        $$ = new ParseTree::Mal($1, $3);
    }
    | math_exp T_GETEILT math_exp                     {
        printf("\t Geteilt\n");
        $$ = new ParseTree::Geteilt($1, $3);
    }
    | math_exp T_MODULO  math_exp                     {
        printf("\t Modulo\n");
        $$ = new ParseTree::Modulo($1, $3);
    }
;


arith_exp:
      T_NICHT arith_exp                                {printf("\t Nicht\n");}
    | arith_exp T_UND             arith_exp            {printf("\t Und\n");}
    | arith_exp T_ODER            arith_exp            {printf("\t Oder\n");}
    | T_KL_LINKS arith_exp T_KL_RECHTS                 {
        printf("\t Klammern\n");
        $$ = $2;
    }
    | math_exp  T_GLEICH          math_exp             {
        printf("\t Gleich\n");
        $$ = new ParseTree::Gleich($1, $3);
    }
    | math_exp  T_KLEINER         math_exp             {
        printf("\t Kleiner\n");
        $$ = new ParseTree::Kleiner($1, $3);
    }
    | math_exp  T_GROESSER        math_exp             {
        printf("\t Groesser\n");
        $$ = new ParseTree::Groesser($1, $3);
    }
    | math_exp  T_KLEINER_GLEICH  math_exp             {printf("\t Kleiner Gleich\n");}
    | math_exp  T_GROESSER_GLEICH math_exp             {printf("\t Groesser Gleich\n");}
    | math_exp  T_UEBERSCHNEIDET  math_exp             {printf("\t Ueberschneidet\n");}
;

loop_and_exp:
      T_WIEDERHOLE program T_SOLANGE arith_exp             {
            printf("\t Schleife\n");
            $$ = new ParseTree::Wiederhole($2, $4);
      }
    | T_WIEDERHOLE program T_SOLANGE T_NEWLINE arith_exp   {
           printf("\t Schleife\n");
           $$ = new ParseTree::Wiederhole($2, $5);
     }
    | T_WENN arith_exp T_DANN  cmd     %prec LOWER_THAN_ELSE   {
            printf("\t If-Abfrage\n");
            $$ = new ParseTree::Wenn($2, $4, NULL);
        } /* prioritaet runtersetzen*/
    | T_WENN  arith_exp  T_DANN  cmd T_SONST  cmd {
            printf("\t If-Else-Abfrage\n");
            $$ = new ParseTree::Wenn($2, $4, $6);
        }
;

line:

      cmd {$$ = $1;}
    | koordinate {
           printf("\tX: %i Y: %i Z: %i \n", $1.x, $1.y, $1.z);
       }
    | farbe {
            printf("\tRed: %i Green: %i Blue: %i \n", $1.r, $1.g, $1.b);
        }
    | T_QUIT {
            printf("bye!\n"); exit(0);
        }

    | loop_and_exp
;

program:
         line {
            printf("\tProgram line only\n");
            $$ = $1;

       }
       /*| program T_NEWLINE { $$ = $1; }
       | T_NEWLINE program { $$ = $2; }*/
	   | program line {
	        printf("\tProgram\n");
            $$ = new ParseTree::ProgramBlock($1, $2);
	   }
;

program_start:
        program {
            $$ = $1;
            printf("Starte Program\n");
            $$->Execute();
        }

%%

#include <cstdio>

int main(int argc, char* argv[]) {
    if(argc == 1)
	    yyin = stdin;
	else
	    yyin = fopen(argv[1], "r");
	artnet_client_init();

	do {
		yyparse();
	} while(!feof(yyin));


	artnet_client_deinit();
	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s on Line: %d\n", s, yyget_lineno());
	exit(1);
}