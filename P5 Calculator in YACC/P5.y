%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char *msg);
	extern int value[];
%}


%token NUM ID
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%

SS: SS S
  | S
  
S : A ';'		{printf ("Result = %d\n",$$); }

A : ID '=' A		{value[$1]=$3; $$=$3;}
  | E			{$$=$1;}
  
E : E '+' T		{$$ = $1 + $3;}
  | E '-' T		{$$ = $1 - $3;}
  | T			{$$ = $1;}										
  
T : T '*' F		{$$ = $1 * $3;}
  | T '/' F		{	if($3 == 0){printf("Div by zero encountered\n");exit(0);}
  				$$ = $1 / $3;}
  | F			{$$ = $1;}
  
F : NUM		{$$ = $1;}
  | ID 		{printf("%d\n",value[$1]); $$= value[$1];}
  | '(' E ')'		{$$ = $2;}
  
%%


void yyerror(char *msg)
{
	printf("Invalid\n");
}
int main()
{

yyparse();
return 0;
}
