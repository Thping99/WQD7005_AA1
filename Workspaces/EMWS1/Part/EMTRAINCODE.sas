*------------------------------------------------------------*;
* Part: Create random partition;
*------------------------------------------------------------*;
data
EMWS1.Part_TRAIN(label="")
EMWS1.Part_VALIDATE(label="")
EMWS1.Part_TEST(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS1.FIMPORT_train;
if (200+1-_n_)*_genvalue_ <= (108 - _C000001) then do;
_C000001 + 1;
output EMWS1.Part_TRAIN;
end;
else if (200+1-_n_)*_genvalue_ <= (108 - _C000001 + 46 - _C000002) then do;
_C000002 + 1;
output EMWS1.Part_VALIDATE;
end;
else do;
_C000003 + 1;
output EMWS1.Part_TEST;
end;
run;
run;
