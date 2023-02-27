clear
clc

% load and 
load COIL20.mat
fea = NormalizeFea(fea); 
X=fea';
C=20; 
n=1440; 
l=140;

alpha_search=[1];
K_search = [3];

%lambda_search = [0];
%lambda_search=[0,0.001,0.01,0.1,1,10,100,1000]; % label informatin 
%mu_search=[0,0.001,0.01,0.1,1,10,100,1000]; % graph information
for alpha=alpha_search
    for K=K_search
        clear res

            para.alpha=alpha;
            para.k=C;
            para.maxiter=100;

                [Xiter,gnditer]=randpermData(X,gnd,C,n,l);
                
                P_old=zeros(l,C);     
                for ss=1:C                 
                    for cc=1:l          
                        if gnditer(cc,1)==ss 
                            P_old(cc,ss)=1;
                        end
                    end
                end
                I_S=eye(n-l);      
                P=zeros(n,n-l+C);
                P(1:l,1:C)=P_old;
                P(l+1:end,C+1:end)=I_S;
                
                [~, W, ~] = CAN(Xiter, C, K);
                
                W=refineW(W,l,C);
                A=diag(sum(W,2));                       
                [U,V]=ABNMTF(X,P,para,A,W,l);
                H=V;
                Hnew=H(l+1:end,:);
                nClass=C;
                gndnew=gnditer(l+1:end);
                
                accuracy = eval_clustering_accuracy(Hnew',gndnew,nClass,50)                
    end
end