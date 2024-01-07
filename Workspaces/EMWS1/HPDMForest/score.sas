data sasep.out;
   dcl package score sc();
   dcl double "Age";
   dcl double "TotalPurchases";
   dcl double "TotalSpent";
   dcl double "WebsiteVisitsPerMonth";
   dcl nchar(12) "Location";
   dcl nchar(8) "MembershipLevel";
   dcl double "P_Churn" having label n'Predicted: Churn';
   dcl nchar(4) "_WARN_" having label n'Warnings';
   keep "P_Churn" "_WARN_";
    
   varlist allvars [_all_];
    
   method init();
      sc.setvars(allvars);
      sc.setKey(n'56B739DF5EA6B962358EBBE0A364F77A176BD215');
   end;
    
   method run();
      set sasep.in;
      sc.scoreRecord();
   end;
enddata;
