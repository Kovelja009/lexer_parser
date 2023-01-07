// import section
package Lexer;
import Parser.sym;
import java_cup.runtime.*;
import KWTable.*;
%%
// declaration section
%class MPLexer
%function next_token
%line
%cup
%column
%debug
%eofval{
return new Symbol( sym.EOF);
%eofval}

%{
   public int getLine()
   {
      return yyline;
   }
%}

%{
//extra class members
KWTable kwTable = new KWTable();
Symbol getKW()
{
return new Symbol( kwTable.find( yytext()) );

}
%}

//states
%state COMMENT
//macros
slovo = [a-zA-Z]
cifra = [0-9]
oc16 = [0-9A-F]
znak = [!\"#\$%&\'()\*\+\,\-\.\/:;<=>\?@\[\]\\\^_`{}\~�]
%%
// rules section
\/\/ { yybegin( COMMENT ); }
<COMMENT>~\n { yybegin( YYINITIAL ); }

[\t\n\r ] { ; }
\( { return new Symbol( sym.LP ); }
\) { return new Symbol( sym.RP ); }
\{ { return new Symbol( sym.LV ); }
\} { return new Symbol( sym.RV ); }

//operators
and { return new Symbol( sym.AND ); }
or { return new Symbol( sym.OR ); }
\% { return new Symbol( sym.MOD ); }
\+ { return new Symbol( sym.PLUS ); }
\* { return new Symbol( sym.MUL ); }
\- { return new Symbol( sym.MIN ); }
\/  { return new Symbol( sym.DIV ); }
condemn { return new Symbol( sym.LESS ); }
curse { return new Symbol( sym.LESSE ); }
forgive { return new Symbol( sym.GREAT ); }
bless { return new Symbol( sym.GREATE ); }
judge { return new Symbol( sym.EQ ); }
do_not_judge { return new Symbol( sym.NEQ ); }
//separators
; { return new Symbol( sym.DOTCOMMA ); }
, { return new Symbol( sym.COMMA ); }
let_there_be { return new Symbol( sym.ASSIGN ); }


\'({cifra} | {znak} | {slovo})*\' { return new Symbol( sym.CONST ); }
//keywords
({slovo}+)(({slovo}| _ )*)({slovo}+) { return getKW(); }
//id-s
({slovo} | _)({slovo}|{cifra}| _ )* { return new Symbol(sym.ID ); }
//constants
{cifra}+ { return new Symbol( sym.CONST ); }
\${oc16}+ { return new Symbol( sym.CONST ); }
0\.{cifra}+(E[+\-]{cifra}+)? { return new Symbol( sym.CONST );}
'[^]' { return new Symbol( sym.CONST ); }
truth  { return new Symbol( sym.CONST ); }
lie { return new Symbol( sym.CONST ); }
//error symbol
. { if (yytext() != null && yytext().length() > 0) System.out.println( "ERROR: " + yytext() ); }
