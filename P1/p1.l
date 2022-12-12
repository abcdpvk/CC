%{
	
int lines=0;
int keywords=0;
int identifiers=0;
int operators=0;
int values=0;
int symbols=0;


char keywordsFlag[20];
 /*char string[50];*/
%}


%%


\n {++lines; }
"int"|"float"|"while"|"if"|"else"|"for"|"do"|"void"  {keywords++; printf("\nLine => %d Keywords = %s",lines,yytext);}
"<="|"=="|"="|"++"|"-"|"*"|"+" {operators++; printf("\nLine => %d Operators = %s",lines,yytext);}
[(){}|, ;] {symbols++; printf("\nLine => %d Symbols = %s",lines,yytext);}
[0-9]*"."[0-9]+ {values++; printf("\nLine => %d Values = %s",lines,yytext);}
[0-9]+ {values++; printf("\nLine => %d Values = %s",lines,yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {identifiers++; printf("\nLine => %d Identifiers = %s",lines,yytext);}


%%
	
int main(){
	yylex();
	printf("\n\n \t--------------OUTPUT------------- ");
	printf("\n Total number of keywords = %d\n", keywords); 
	printf("\n Total number of identifiers = %d\n", identifiers); 
	printf("\n Total number of operators = %d\n", operators); 
	printf("\n Total number of values = %d\n", values); 
	printf("\n Total number of symbols = %d\n", symbols); 

}

int yywrap()
{}
