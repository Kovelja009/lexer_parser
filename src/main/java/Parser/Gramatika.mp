PROGRAM -> alpha CODE omega
CODE -> in_the_beginning_there_was_nothing() { BLOCK }
BLOCK -> VarList StmntList | StmntList | VarList
VarList -> VarList Declare | Declare
Declare -> Type NameList;
          | Type NameList let_there_be ArgExpression; --proba
NameList -> NameList , id | id
Type -> int | char | boolean | string | real

StmntList -> StmntList Statement | Statement
Statement -> trial(Expression) { StmntList }
           | trial(Expression) { StmntList } spare { StmntList }
           | while(Expression) { StmntList }
           | betray;
           | heal;
           | return Expression;
           | return ArgExpression;
           | read(NameList);
           | show(NameList);

Expression -> Expression or AndExpression | AndExpression
AndExpression -> AndExpression and Relation | Relation
Relation -> ArgExpression CHECK ArgExpression
CHECK -> judge | do_not_judge | condemn | forgive | curse | bless

ArgExpression -> ArgExpression + Term | ArgExpression - Term | Term
Term -> Term * Factor | Term / Factor | Term % Factor | Factor
Factor -> id | CONST | (ArgExpression)