%macro em_hpfst_score;
 
  %if %sysfunc(exist(work._score_temp)) %then %do;
     proc delete data=work._score_temp;
     run;
  %end;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
 
%let hpvvn= %sysfunc(getoption(VALIDVARNAME));
options validvarname=V7;
  proc hp4score data=&hpfst_score_input(keep=
Age
FavoriteCategory
Gender
Location
MembershipLevel
Occuptation
TotalPurchases
TotalSpent
WebsiteVisitsPerMonth
  ); 
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
    score file="C:\Users\Tsu\Desktop\DM Revision\AA1_Tsu Hiao Ping\Workspaces\EMWS1\HPDMForest\OUTMDLFILE.bin" out=work._outtemp;
  %end;
  %else %do;
    score file="&EM_USER_OUTMDLFILE" out=work._outtemp;
  %end;
    PERFORMANCE  DETAILS nthreads=1;
  run;
 
options validvarname=&hpvvn;
  data work._score_temp;
     merge &hpfst_score_input work._outtemp;
  run;
 
  proc delete data=work._outtemp;
  run;
 
  data &hpfst_score_output;
    set work._score_temp;
%mend;
 
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Residual Vars: Churn;
*------------------------------------------------------------*;
Length R_Churn 8;
Label R_Churn = 'Residual: Churn';
R_Churn = Churn - P_Churn;
