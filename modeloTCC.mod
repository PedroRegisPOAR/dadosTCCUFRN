set E;
set N;
set S;
set dp within {N union S, E};
set dn within {N union S, E};
set T;

param dmin;
param dmax;
param pmin;
param pmax;
param pi := 4*atan(1);
param TD{T};
param QD{T};

param QT{E};
var QF{E};
param q;


param dem{N};
param L{E};
param Z{N union S};


param C;
param w;
param a;
param b;

param QP{N};

var Q{E} >= 0;
var D{E} >= 0;
var H{N union S} >= 0;
var y{E, T} binary;
var yh{N union S} binary;

set NEN = setof {(i,e1) in dp, (j,e2) in dn: e1 = e2} (j,e2,i);

minimize CUSTO: sum{ e in E} D[e];

subject to FLOW {i in N}: sum{ (ii, e) in dn: i = ii} Q[e] - sum{ (ii,e) in dp: i = ii} Q[e] = dem[i];

subject to RQF {e in E}: QF[e] = (2*Q[e] - QT[e])/2;

subject to HW { (j,e,i) in NEN}: H[i] - H[j] = w*(QF[e]**(a))*L[e]*(C**(-a))/D[e]**b;


#subject to UMC {e in E}: sum{j in T} y[e,j] = 1;
subject to UMC2 {e in E}: sum{j in T} TD[j]*y[e,j] = D[e];

subject to RQD {e in E}: sum{j in T} y[e,j] = 1;
subject to RQD2 {e in E}: sum{j in T} QD[j]*y[e,j] >= QF[e];

subject to DMIN { e in E}: D[e] >= dmin;
subject to DMAX { e in E}: D[e] <= dmax;

subject to PMIN { i in N}: H[i] >= pmin + Z[i];
subject to PMAX { i in N}: H[i] <= pmax + Z[i];


subject to RPMIN1: sum{i in N union S} yh[i] = 1;
#subject to RPMIN2 {i in N union S}: (H[i] - Z[i] - pmin)*yh[i] = 0;

#subject to RPMIN2 {i in N union S}: H[i]*yh[i] = (pmin + Z[i])*yh[i];
subject to RPMIN2 {i in N union S}: (H[i] - Z[i])*yh[i] = pmin*yh[i];


#subject to R {(i,j,e) in NOS}: (H[i] - Z[i] + (Z[i] - Z[j] ) - (H[j] - H[i]) )*yh[i] = pmin*yh[i];


