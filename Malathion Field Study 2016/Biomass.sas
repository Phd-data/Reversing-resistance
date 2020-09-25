Data Biomass;
input P450$ Herbicide$ REP BM;
datalines;
Check	Check	1	262
Check	Check	2	144.4
Check	Check	3	278.4
Check	Callisto	1	202
Check	Callisto	2	228.8
Check	Callisto	3	244
Check	Laudis	1	142.8
Check	Laudis	2	157.6
Check	Laudis	3	113.2
Check	Impact	1	50.8
Check	Impact	2	18
Check	Impact	3	17.2
Malathion	Callisto	1	267.6
Malathion	Callisto	2	147.2
Malathion	Callisto	3	182.8
Malathion	Laudis	1	26.8
Malathion	Laudis	2	11.2
Malathion	Laudis	3	24.8
Malathion	Impact	1	21.6
Malathion	Impact	2	26.4
Malathion	Impact	3	6.4
Amitrole	Callisto	1	46.4
Amitrole	Callisto	2	80
Amitrole	Callisto	3	79.6
Amitrole	Laudis	1	58.8
Amitrole	Laudis	2	20
Amitrole	Laudis	3	88.4
Amitrole	Impact	1	38.4
Amitrole	Impact	2	4
Amitrole	Impact	3	8.8
PBO	Callisto	1	168
PBO	Callisto	2	193.6
PBO	Callisto	3	173.6
PBO	Laudis	1	14.8
PBO	Laudis	2	23.6
PBO	Laudis	3	25.6
PBO	Impact	1	28.4
PBO	Impact	2	11.2
PBO	Impact	3	28.4
Malathion	Check	1	120
Malathion	Check	2	374.8
Malathion	Check	3	242
Amitrole	Check	1	158.4
Amitrole	Check	2	129.2
Amitrole	Check	3	285.2
PBO	Check	1	201.2
PBO	Check	2	130.4
PBO	Check	3	188
;
Proc print data=Biomass;
Run;
Proc glimmix data=Biomass;
class P450 Herbicide REP;
model BM=P450|Herbicide;
random intercept/subject=REP;
lsmeans P450*Herbicide/diff lines slice=(P450 Herbicide) slicediff=(P450 Herbicide) plot=meanplot(sliceby=Herbicide join) cl;
lsmestimate P450*Herbicide 'Callisto x Callisto+Malathion'  0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Callisto x Callisto+Amitrole'  -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Callisto x Callisto+PBO'       0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+Malathion'     0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+Amitrole'      0 0 0 -1 0 0 0 1 0 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+PBO'           0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;
 lsmestimate P450*Herbicide 'Impact x Impact+Malathion'     0 0 0 0 0 0 1 0 0 -1 1 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Impact x Impact+Amitrole'      0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Impact x Impact+PBO'           0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;
 run;


 Data BiomassR;
input P450$ Herbicide$ REP BM;
datalines;
Check	Callisto	1	0.115070094
Check	Callisto	2	0.1012
Check	Callisto	3	0.12654
Check	Laudis	1	0.374415888
Check	Laudis	2	0.309579439
Check	Laudis	3	0.504088785
Check	Impact	1	0.777453271
Check	Impact	2	0.82114486
Check	Impact	3	0.724649533
Malathion	Callisto	1	0.127686916
Malathion	Callisto	2	0.155140187
Malathion	Callisto	3	0.099182243
Malathion	Laudis	1	0.882593458
Malathion	Laudis	2	0.950934579
Malathion	Laudis	3	0.89135514
Malathion	Impact	1	0.905373832
Malathion	Impact	2	0.884345794
Malathion	Impact	3	0.971962617
Amitrole	Callisto	1	0.796728972
Amitrole	Callisto	2	0.64953271
Amitrole	Callisto	3	0.651285047
Amitrole	Laudis	1	0.742406542
Amitrole	Laudis	2	0.912383178
Amitrole	Laudis	3	0.612733645
Amitrole	Impact	1	0.831775701
Amitrole	Impact	2	0.982476636
Amitrole	Impact	3	0.961448598
PBO	Callisto	1	0.264018692
PBO	Callisto	2	0.151869159
PBO	Callisto	3	0.239485981
PBO	Laudis	1	0.935163551
PBO	Laudis	2	0.89661215
PBO	Laudis	3	0.887850467
PBO	Impact	1	0.875584112
PBO	Impact	2	0.950934579
PBO	Impact	3	0.875584112
Malathion	Check	1	0.012546
Malathion	Check	2	0.021546
Malathion	Check	3	0.0545
Amitrole	Check	1	0.206074766
Amitrole	Check	2	0.133995327
Amitrole	Check	3	0.150584112
PBO	Check	1	0.118574766
PBO	Check	2	0.428738318
PBO	Check	3	0.176401869
;
Proc print data=BiomassR;
Run;
Proc glimmix data=BiomassR;
class P450 Herbicide REP;
model BM=P450|Herbicide/d=beta;
random intercept/subject=REP;
lsmeans P450*Herbicide/diff lines slice=(P450 Herbicide) ilink slicediff=(P450 Herbicide) plot=meanplot(sliceby=Herbicide join) cl;
lsmestimate P450*Herbicide 'Callisto x Callisto+Malathion'  0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Callisto x Callisto+Amitrole'  -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Callisto x Callisto+PBO'       0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+Malathion'     0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+Amitrole'      0 0 0 -1 0 0 0 1 0 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+PBO'           0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;
 lsmestimate P450*Herbicide 'Impact x Impact+Malathion'     0 0 0 0 0 0 1 0 0 -1 1 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Impact x Impact+Amitrole'      0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Impact x Impact+PBO'           0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;
 run;



Data Control;
input P450$ Herbicide$ REP IR;
datalines;
Check	Callisto	1	0.15
Check	Callisto	2	0.15
Check	Callisto	3	0.15
Check	Laudis	1	0.25
Check	Laudis	2	0.25
Check	Laudis	3	0.3
Check	Impact	1	0.7
Check	Impact	2	0.4
Check	Impact	3	0.5
Malathion	Callisto	1	0.2
Malathion	Callisto	2	0.2
Malathion	Callisto	3	0.2
Malathion	Laudis	1	0.88
Malathion	Laudis	2	0.9
Malathion	Laudis	3	0.75
Malathion	Impact	1	0.88
Malathion	Impact	2	0.8
Malathion	Impact	3	0.9
Amitrole	Callisto	1	0.6
Amitrole	Callisto	2	0.5
Amitrole	Callisto	3	0.65
Amitrole	Laudis	1	0.7
Amitrole	Laudis	2	0.8
Amitrole	Laudis	3	0.65
Amitrole	Impact	1	0.7
Amitrole	Impact	2	0.9
Amitrole	Impact	3	0.9
PBO	Callisto	1	0.2
PBO	Callisto	2	0.15
PBO	Callisto	3	0.5
PBO	Laudis	1	0.88
PBO	Laudis	2	0.8
PBO	Laudis	3	0.75
PBO	Impact	1	0.9
PBO	Impact	2	0.88
PBO	Impact	3	0.75
Malathion	Check	1	0.01
Malathion	Check	2	0.01
Malathion	Check	3	0.01
Amitrole	Check	1	0.25
Amitrole	Check	2	0.25
Amitrole	Check	3	0.25
PBO	Check	1	0.15
PBO	Check	2	0.25
PBO	Check	3	0.01
;
Proc print data=Control;
Run;

Proc glimmix data=Control;
class P450 Herbicide REP;
model IR=P450|Herbicide/d=beta;
random intercept/subject=REP;
lsmeans P450*Herbicide/diff lines slice=(P450 Herbicide) slicediff=(P450 Herbicide) plot=meanplot(sliceby=Herbicide join) cl ilink;
lsmestimate P450*Herbicide 'Callisto x Callisto+Malathion'  0 0 0 0 1 0 0 0 -1 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Callisto x Callisto+Amitrole'  -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Callisto x Callisto+PBO'       0 0 0 0 1 0 0 0 0 0 0 0 -1 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+Malathion'     0 0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+Amitrole'      0 0 0 -1 0 0 0 1 0 0 0 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Laudis x Laudis+PBO'           0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1;
 lsmestimate P450*Herbicide 'Impact x Impact+Malathion'     0 0 0 0 0 0 1 0 0 -1 1 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Impact x Impact+Amitrole'      0 0 0 0 0 0 1 0 0 0 -1 0 0 0 0 0;
 lsmestimate P450*Herbicide 'Impact x Impact+PBO'           0 0 0 0 0 0 1 0 0 0 0 0 0 0 -1 0;
 run;
