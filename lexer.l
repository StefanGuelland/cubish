%option noyywrap
%option caseless
%option yylineno

%{
#include <stdio.h>
#include <stdint.h>
#include "Identifier.h"
#include "ParseTreeNode_Interface.h"
#include "ParseTreeNodeBool_Interface.h"
#include "ParseTreeNodeInt_Interface.h"

#define YY_DECL int yylex()

#include "parser.hpp"

%}

%%

[ \t]	; // ignore all whitespace
(^(\/\*)[A-Za-z0-9 ]*(\*\/)$|(\/\/)[\A-Za-z0-9 ]+) ; //ignores c-style comments

#[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]   {
    char buffer[3] = {0,0,0};
    strncpy ( buffer, yytext+1, 2);
    yylval.farbe_val.r = strtol(buffer, NULL,16);
    strncpy ( buffer, yytext+3, 2);
    yylval.farbe_val.g = strtol(buffer, NULL,16);
    strncpy ( buffer, yytext+5, 2);
    yylval.farbe_val.b = strtol(buffer, NULL,16);
    printf("hex gefunden \n");
    return T_FARBE;
}
-?[0-9]+		        {yylval.ival = atoi(yytext); return T_INT;}
\n	    	        ;//{//return T_NEWLINE;}
"exit"		        {return T_QUIT;}
"quit"		        {return T_QUIT;}

"Wiederhole"        {return T_WIEDERHOLE;}
"Solange"           {return T_SOLANGE;}
"Wenn"              {return T_WENN;}
"Dann"              {return T_DANN;}
"Sonst"             {return T_SONST;}
"Ende"              {return T_ENDE;}

"Gleich"		    {return T_GLEICH;}
"Kleiner"		    {return T_KLEINER;}
"Kleiner Gleich"	{return T_KLEINER_GLEICH;}
"Groesser"		    {return T_GROESSER;}
"Groesser Gleich"	{return T_GROESSER_GLEICH;}

"Plus"		        {return T_PLUS;}
"Minus"		        {return T_MINUS;}
"Mal"		        {return T_MAL;}
"Geteilt Durch"		{return T_GETEILT;}
"Geteilt"           {return T_GETEILT;}
"Modulo"		    {return T_MODULO;}

"Nicht"		        {return T_NICHT;}
"Und"		        {return T_UND;}
"Oder"		        {return T_ODER;}

"Ueberschneidet"	{return T_UEBERSCHNEIDET;}


"rgb"               {return T_KEYWORD_RGB;}
"Setze"             {return T_KEYWORD_SETZE;}
"Auf"               {return T_KEYWORD_AUF;}
"Erstelle"          {return T_KEYWORD_ERSTELLE;}
"Zahl"              {return T_KEYWORD_ZAHL;}
"Wuerfel"           {return T_KEYWORD_WUERFEL;}
"Box"               {return T_KEYWORD_BOX;}
"Verschiebe"        {return T_KEYWORD_VERSCHIEBE;}
"Rotiere"           {return T_KEYWORD_ROTIERE;}
"Anzeigen"          {return T_KEYWORD_ANZEIGEN;}
"Warte"             {return T_KEYWORD_WARTE;}
"Von"               {return T_KEYWORD_VON;}
"Um"                {return T_KEYWORD_UM;}
"Grad"              {return T_KEYWORD_GRAD;}
"Entferne"          {return T_KEYWORD_ENTFERNE;}
"Faerbe"            {return T_KEYWORD_FAERBE;}
"Zeiteinheiten"     {return T_KEYWORD_ZEITEINHEITEN;}
"Zeiteinheit"       {return T_KEYWORD_ZEITEINHEITEN;}
"ms"                {return T_KEYWORD_MS;}

"Links"             {return T_LINKS;}
"Rechts"            {return T_RECHTS;}

"("		            {return T_KL_LINKS;}
")"		            {return T_KL_RECHTS;}
","                 {return T_SEPARATOR;}

"X-Achse"           {return T_X_AXE;}
"Y-Achse"           {return T_Y_AXE;}
"Z-Achse"           {return T_Z_AXE;}

"Blau"              {return T_FARBE_BLAU;}
"Gelb"              {return T_FARBE_GELB;}
"Gruen"             {return T_FARBE_GRUEN;}
"Rot"               {return T_FARBE_ROT;}
"TUERKIS"           {return T_FARBE_TUERKIS;}
"Weiß"              {return T_FARBE_WEISS;}
"Schwarz"           {return T_FARBE_SCHWARZ;}

"X-Minimal"         {return T_X_MIN;}
"X-Maximal"         {return T_X_MAX;}
"Y-Minimal"         {return T_Y_MIN;}
"Y-Maximal"         {return T_Y_MAX;}
"Z-Minimal"         {return T_Z_MIN;}
"Z-Maximal"         {return T_Z_MAX;}

[a-zA-Z][a-zA-Z0-9]*   {
    yylval.str_val = Identifier_add(yytext, yyleng);
    return T_IDENTIFIER;
    }

%%