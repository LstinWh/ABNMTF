function [A,gnd]=randpermData(A,gnd,C,n,l)
B=[];
D=[];
gndB=[];
gndD=[];
for i=1:C
    index=randperm(n/C);
%     size(A)
%     (i-1)*(n/C)+index(1:l/C)
    Btemp=A(:,(i-1)*(n/C)+index(1:l/C));
    B=[B,Btemp];
    gndBtemp=gnd((i-1)*(n/C)+1:(i-1)*(n/C)+(l/C));
    gndB=[gndB;gndBtemp];
    Dtemp=A(:,(i-1)*(n/C)+index(l/C+1:end));
    D=[D,Dtemp];
%     i
    gndDtemp=gnd((i-1)*(n/C)+(l/C)+1:i*(n/C));
    gndD=[gndD;gndDtemp];
    %% take the first two
%     Btemp=A(:,(i-1)*(n/C)+1:(i-1)*(n/C)+(l/C));
%     B=[B,Btemp];
%     gndBtemp=gnd((i-1)*(n/C)+1:(i-1)*(n/C)+(l/C));
%     gndB=[gndB;gndBtemp];
%     Dtemp=A(:,(i-1)*(n/C)+(l/C)+1:i*(n/C));
%     D=[D,Dtemp];
%     gndDtemp=gnd((i-1)*(n/C)+(l/C)+1:i*(n/C));
%     gndD=[gndD;gndDtemp];
end

clear A
A=[B,D];
clear gnd
gnd=[gndB;gndD];