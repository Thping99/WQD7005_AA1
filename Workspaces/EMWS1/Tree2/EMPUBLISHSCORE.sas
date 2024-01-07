****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Churn = 'Predicted: Churn' ;
label V_Churn = 'Validated: Churn' ;
label _WARN_ = 'Warnings' ;
 
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(TotalPurchases ) AND
  TotalPurchases  <                 14.5 THEN DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_Churn  =                    1;
  V_Churn  =                    1;
  END;
ELSE DO;
  IF  NOT MISSING(Age ) AND
    Age  <                 37.5 THEN DO;
    IF  NOT MISSING(TotalSpent ) AND
                    2350.6 <= TotalSpent  THEN DO;
      _NODE_  =                    7;
      _LEAF_  =                    3;
      P_Churn  =     0.66666666666666;
      V_Churn  =                    1;
      END;
    ELSE DO;
      _NODE_  =                    6;
      _LEAF_  =                    2;
      P_Churn  =                 0.04;
      V_Churn  =  2.3140940118987E-18;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    4;
    P_Churn  =                    0;
    V_Churn  =                    0;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
