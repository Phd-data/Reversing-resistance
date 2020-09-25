Data malathion;
input cyt$ herb$ trt rep y;
datalines;
Check	Check	1	1	65.5
Check	Check	1	2	36.1
Check	Check	1	3	69.6
Check	Callisto	2	1	50.5
Check	Callisto	2	2	57.2
Check	Callisto	2	3	61
Check	Laudis	3	1	35.7
Check	Laudis	3	2	39.4
Check	Laudis	3	3	28.3
Check	Impact	4	1	12.7
Check	Impact	4	2	4.5
Check	Impact	4	3	4.3
Malathion	Callisto	5	1	86.9
Malathion	Callisto	5	2	36.8
Malathion	Callisto	5	3	25.7
Malathion	Laudis	6	1	6.7
Malathion	Laudis	6	2	2.8
Malathion	Laudis	6	3	6.2
Malathion	Impact	7	1	5.4
Malathion	Impact	7	2	6.6
Malathion	Impact	7	3	1.6
Amitrole	Callisto	8	1	11.6
Amitrole	Callisto	8	2	20
Amitrole	Callisto	8	3	19.9
Amitrole	Laudis	9	1	14.7
Amitrole	Laudis	9	2	5
Amitrole	Laudis	9	3	22.1
Amitrole	Impact	10	1	9.6
Amitrole	Impact	10	2	1
Amitrole	Impact	10	3	2.2
PBO	Callisto	11	1	62
PBO	Callisto	11	2	48.4
PBO	Callisto	11	3	23.4
PBO	Laudis	12	1	3.7
PBO	Laudis	12	2	5.9
PBO	Laudis	12	3	6.4
PBO	Impact	13	1	7.1
PBO	Impact	13	2	2.8
PBO	Impact	13	3	7.1
Malathion	Check	14	1	30
Malathion	Check	14	2	93.7
Malathion	Check	14	3	60.5
Amitrole	Check	15	1	39.6
Amitrole	Check	15	2	32.3
Amitrole	Check	15	3	71.3
PBO	Check	16	1	50.3
PBO	Check	16	2	58.6
PBO	Check	16	3	67
;
Proc print;
Run;
Proc glimmix data=malathion;
class cyt herb rep;
model y=cyt|herb;
random intercept/subject=rep;
lsmeans cyt*herb/diff lines plot=meanplot(sliceby=herb join cl) cl;
lsmeans cyt/diff lines;
lsmeans herb/diff lines;
run;
proc glimmix data=malathion;
class cyt herb rep;
model y=cyt|herb;
lsmeans cyt*herb/diff lines plot=meanplot(sliceby=herb join cl) cl;
random intercept/subject=rep;
 lsmestimate herb*cyt 'Callisto x Callisto+Malathion' 0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Callisto x Callisto+Amitrole'  -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Callisto x Callisto+PBO'       0 0 0 0 1 0 1 0 0 0 0 0 -1 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+Malathion'     0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+Amitrole'      0 0 0 -1 0 0 0 1 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+PBO'           0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;
 lsmestimate herb*cyt 'Impact x Impact+Malathion'     0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;
 lsmestimate herb*cyt 'Impact x Impact+Amitrole'      0 0 -1 0 0 0 1 0 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Impact x Impact+PBO'           0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;
 run;



Data control;
input cyt$ herb$ trt rep y;
datalines;
Check	Callisto	2	1	0.15
Check	Callisto	2	2	0.15
Check	Callisto	2	3	0.15
Check	Laudis	3	1	0.25
Check	Laudis	3	2	0.25
Check	Laudis	3	3	0.3
Check	Impact	4	1	0.7
Check	Impact	4	2	0.4
Check	Impact	4	3	0.5
Malathion	Callisto	5	1	0.2
Malathion	Callisto	5	2	0.2
Malathion	Callisto	5	3	0.2
Malathion	Laudis	6	1	0.88
Malathion	Laudis	6	2	0.9
Malathion	Laudis	6	3	0.75
Malathion	Impact	7	1	0.88
Malathion	Impact	7	2	0.8
Malathion	Impact	7	3	0.9
Amitrole	Callisto	8	1	0.60
Amitrole	Callisto	8	2	0.50
Amitrole	Callisto	8	3	0.65
Amitrole	Laudis	9	1	0.7
Amitrole	Laudis	9	2	0.8
Amitrole	Laudis	9	3	0.65
Amitrole	Impact	10	1	0.7
Amitrole	Impact	10	2	0.9
Amitrole	Impact	10	3	0.9
PBO	Callisto	11	1	0.2
PBO	Callisto	11	2	0.15
PBO	Callisto	11	3	0.5
PBO	Laudis	12	1	0.88
PBO	Laudis	12	2	0.8
PBO	Laudis	12	3	0.75
PBO	Impact	13	1	0.9
PBO	Impact	13	2	0.88
PBO	Impact	13	3	0.75
Malathion	Check	14	1	0.01
Malathion	Check	14	2	0.01
Malathion	Check	14	3	0.01
Amitrole	Check	15	1	0.25
Amitrole	Check	15	2	0.25
Amitrole	Check	15	3	0.25
PBO	Check	16	1	0.15
PBO	Check	16	2	0.25
PBO	Check	16	3	0.01
;
Proc print;
Run;
Proc glimmix data=control;
class cyt herb rep;
model y=cyt|herb/dist=beta;
random intercept/subject=rep;
lsmeans cyt|herb/diff lines plot=meanplot(sliceby=herb join cl) cl ilink;
*lsmeans cyt/diff lines;
*lsmeans herb/diff lines;
run;
proc glimmix data=control;
class cyt herb rep;
model y=cyt|herb/dist=beta;
random intercept/subject=rep;
lsmeans cyt|herb/diff lines plot=meanplot(sliceby=herb join cl) cl ilink;
random intercept/subject=rep;
 lsmestimate herb*cyt 'Callisto x Callisto+Malathion' 0 0 0 0 1 0 0 -1 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Callisto x Callisto+Amitrole'  -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Callisto x Callisto+PBO'       0 0 0 0 1 0 1 0 0 0 0 -1 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+Malathion'     0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+Amitrole'      0 0 0 -1 0 0 1 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+PBO'           0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;
 lsmestimate herb*cyt 'Impact x Impact+Malathion'     0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;
 lsmestimate herb*cyt 'Impact x Impact+Amitrole'      0 0 -1 0 0 1 0 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Impact x Impact+PBO'           0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;
 run;




 Data biored;
input cyt$ herb$ trt rep y;
datalines;
Check	Callisto	2	1	0.254062038
Check	Callisto	2	2	0.155096012
Check	Callisto	2	3	0.098966027
Check	Laudis	3	1	0.47267356
Check	Laudis	3	2	0.418020679
Check	Laudis	3	3	0.581979321
Check	Impact	4	1	0.812407681
Check	Impact	4	2	0.933530281
Check	Impact	4	3	0.93648449
Malathion	Callisto	5	1	0.159527326
Malathion	Callisto	5	2	0.456425406
Malathion	Callisto	5	3	0.177252585
Malathion	Laudis	6	1	0.901033973
Malathion	Laudis	6	2	0.958641064
Malathion	Laudis	6	3	0.908419498
Malathion	Impact	7	1	0.920236337
Malathion	Impact	7	2	0.902511078
Malathion	Impact	7	3	0.976366322
Amitrole	Callisto	8	1	0.828655835
Amitrole	Callisto	8	2	0.704579025
Amitrole	Callisto	8	3	0.70605613
Amitrole	Laudis	9	1	0.782865583
Amitrole	Laudis	9	2	0.926144756
Amitrole	Laudis	9	3	0.673559823
Amitrole	Impact	10	1	0.858197932
Amitrole	Impact	10	2	0.985228951
Amitrole	Impact	10	3	0.967503693
PBO	Callisto	11	1	0.084194978
PBO	Callisto	11	2	0.285081241
PBO	Callisto	11	3	0.654357459
PBO	Laudis	12	1	0.94534712
PBO	Laudis	12	2	0.912850812
PBO	Laudis	12	3	0.905465288
PBO	Impact	13	1	0.895125554
PBO	Impact	13	2	0.958641064
PBO	Impact	13	3	0.895125554
Malathion	Check	14	1	0.039881832
Malathion	Check	14	2	0.132939439
Malathion	Check	14	3	0.106351551
Amitrole	Check	15	1	0.267355982
Amitrole	Check	15	2	0.375184638
Amitrole	Check	15	3	0.242245199
PBO	Check	16	1	0.257016248
PBO	Check	16	2	0.141802068
PBO	Check	16	3	0.010339734
;
Proc print;
Run;
Proc glimmix data=biored;
class cyt herb rep;
model y=cyt|herb/dist=beta;
random intercept/subject=rep;
lsmeans cyt|herb/diff lines plot=meanplot(sliceby=herb join cl) cl ilink;
*lsmeans cyt/diff lines;
*lsmeans herb/diff lines;
run;
proc glimmix data=biored;
class cyt herb rep;
model y=cyt|herb/dist=beta;
random intercept/subject=rep;
lsmeans cyt|herb/diff lines plot=meanplot(sliceby=herb join cl) cl ilink;
random intercept/subject=rep;
 lsmestimate herb*cyt 'Callisto x Callisto+Malathion' 0 0 0 0 1 0 0 -1 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Callisto x Callisto+Amitrole'  -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Callisto x Callisto+PBO'       0 0 0 0 1 0 1 0 0 0 0 -1 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+Malathion'     0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+Amitrole'      0 0 0 -1 0 0 1 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Laudis x Laudis+PBO'           0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;
 lsmestimate herb*cyt 'Impact x Impact+Malathion'     0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;
 lsmestimate herb*cyt 'Impact x Impact+Amitrole'      0 0 -1 0 0 1 0 0 0 0 0 0 0 0 0;
 lsmestimate herb*cyt 'Impact x Impact+PBO'           0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;
 run;
