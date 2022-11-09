%option noyywrap

%{
#include <stdio.h>
#include <string.h>

#define YY_DECL int yylex()

int words = 0;
int chars = 0;
int lines = 0;

%}

letter      [a-zA-Z]
string		'"' ((char - ["\"\\"]) | ('\\' ["\"\\nt"]))* '"'
digit       [0-9]
ID          {letter}({letter}|{digit})*
delim       [ \t\n]
NUMBER      {digit}+(\.{digit}+)?(E[+\-]?(digit)+)?
ws          {delim}+

%%
"/*"    				{
							int c;
							while((c = input()) != 0) {
								if(c == '*') {
									if((c = input()) == '/')
										break;
									else
										unput(c);
								}
							}
						}
						
"int"	{words++; chars += strlen(yytext);
		 printf("%s : TYPE\n", yytext);
		}

"char"	{words++; chars += strlen(yytext);
		 printf("%s : TYPE\n", yytext);
		}
		
"write" {words++; 
		 chars += strlen(yytext);
		 printf("%s : KEYWORD\n", yytext);
		}

"print" {words++; 
		 chars += strlen(yytext);
		 printf("%s : KEYWORD\n", yytext);
		}

"if" 	{words++; 
		 chars += strlen(yytext);
		 printf("%s : IF\n", yytext);
		}

"else" 	{words++; 
		 chars += strlen(yytext);
		 printf("%s : ELSE\n", yytext);
		}

"while"	{words++; 
		 chars += strlen(yytext);
		 printf("%s : WHILE\n", yytext);
		}

"putc" 	{words++; 
		 chars += strlen(yytext);
		 printf("%s : PUTC\n", yytext);
		}

		
{ID}	{words++; chars += strlen(yytext);
		 printf("%s : IDENTIFIER\n",yytext);
		}
			
{NUMBER}	{words++; chars += strlen(yytext);
			  printf("%s : NUMBER\n",yytext);
			}
			
";"		{chars++;
		 printf("%s : SEMICOLON\n", yytext);
		}
		
"="		{chars++;
		 printf("%s : EQUAL\n", yytext);
		}

"+"		{chars++;
		 printf("%s : PLUS\n", yytext);
		}

"-"		{chars++;
		 printf("%s : MINUS\n", yytext);
		}


"*"		{chars++;
		 printf("%s : MULTIPLY\n", yytext);
		}

"/"		{chars++;
		 printf("%s : DIVIDE\n", yytext);
		}

"%"		{chars++;
		 printf("%s : MOD\n", yytext);
		}

"<"		{chars++;
		 printf("%s : LESS THAN\n", yytext);
		}

"<="	{chars++; chars++;
		 printf("%s : LESS THAN OR EQUAL\n", yytext);
		}

">"		{chars++;
		 printf("%s : GREATER THAN\n", yytext);
		}

">="	{chars++; chars++;
		 printf("%s : GREATER THAN OR EQUAL\n", yytext);
		}

"=="	{chars++; chars++;
		 printf("%s : EQUAL\n", yytext);
		}

"!="	{chars++; chars++;
		 printf("%s : NOT EQUAL\n", yytext);
		}

"!"		{chars++;
		 printf("%s : UNARY NOT\n", yytext);
		}

"&&"	{chars++; chars++;
		 printf("%s : LOGICAL AND\n", yytext);
		}

"||"	{chars++; chars++;
		 printf("%s : LOGICAL OR\n", yytext);
		}


"("		{chars++;
		 printf("%s : LEFT PARENTHESIS\n", yytext);
		}

")"		{chars++;
		 printf("%s : RIGHT PARENTHESIS\n", yytext);
		}

"{"		{chars++;
		 printf("%s : LEFT BRACE\n", yytext);
		}

"}"		{chars++;
		 printf("%s : RIGHT BRACE\n", yytext);
		}

","		{chars++;
		 printf("%s : COMMA\n", yytext);
		}


[(\n\r)|(\n)|(\r)|(\r\n)]		{lines++; chars=0;}
[ \t]	{chars++;}
.		{chars++;
         printf("%s : Unrecognized symbol at line %d char %d\n", yytext,lines,chars);
		}
		


%%
int main(int argc, char**argv)
{
	#ifdef YYDEBUG
		yydebug = 1;
	#endif

	printf("Compiler started. \n\n");

	if (argc > 1){
	  if(!(yyin = fopen(argv[1], "r")))
          {
		perror(argv[1]);
		return(1);
	  }
	}
	yylex();
}