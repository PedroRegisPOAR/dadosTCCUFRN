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
param hs{S};

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


minimize CUSTO: sum{e in E} D[e];


subject to FLOW {i in N}: sum{ (ii, e) in dn: i = ii} Q[e] - sum{ (ii,e) in dp: i = ii} Q[e] = dem[i];

subject to RQF {e in E}: QF[e] = (2*Q[e] - QT[e])/2;

subject to HW {(j,e,i) in NEN}: H[i] - H[j] = w*(QF[e]**(a))*L[e]*(C**(-a))/D[e]**b;

# Reservatórios fixos.
subject to Rhs {i in S}: H[i] = hs[i];


subject to RQD1 {e in E}: sum{t in T} y[e,t] = 1;
subject to RQD2 {e in E}: sum{t in T} QD[t]*y[e,t] >= QF[e];
subject to RQD3 {e in E}: sum{t in T} TD[t]*y[e,t] = D[e];


subject to DMIN {e in E}: D[e] >= dmin;
subject to DMAX {e in E}: D[e] <= dmax;


subject to PMIN {i in N}: H[i] >= pmin + Z[i];
subject to PMAX {i in N}: H[i] <= pmax + Z[i];


# Obriga que exatamente 1 dos yh seja igual a 1.
subject to RPMIN1: sum{i in N union S} yh[i] = 1;


# Força que um dos trechos da rede tenha a pressão mínima
subject to RPMIN2 {i in N union S}: (H[i] - Z[i] - pmin)*yh[i] = 0;
