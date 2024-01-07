if upcase(NAME) = "AGE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_CHURN" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "TOTALPURCHASES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "TOTALSPENT" then do;
ROLE = "INPUT";
end;
