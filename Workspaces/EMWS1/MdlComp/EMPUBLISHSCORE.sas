drop _temp_;
if (P_Churn ge 1) then do;
b_Churn = 1;
end;
else
if (P_Churn ge 0.66666666666666) then do;
_temp_ = dmran(1234);
b_Churn = floor(2 + 2*_temp_);
end;
else
if (P_Churn ge 0.04) then do;
_temp_ = dmran(1234);
b_Churn = floor(4 + 2*_temp_);
end;
else
if (P_Churn ge 0) then do;
_temp_ = dmran(1234);
b_Churn = floor(8 + 2*_temp_);
end;
else
do;
b_Churn = 20;
end;
