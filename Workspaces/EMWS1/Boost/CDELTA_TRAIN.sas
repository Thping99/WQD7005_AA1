if upcase(NAME) = "AGE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "FAVORITECATEGORY" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LOCATION" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MEMBERSHIPLEVEL" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "OCCUPTATION" then do;
ROLE = "REJECTED";
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
else 
if upcase(NAME) = "WEBSITEVISITSPERMONTH" then do;
ROLE = "INPUT";
end;
