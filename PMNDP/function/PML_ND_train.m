function [W,obj] = PML_ND_train(X,Y,alpha,beta,lamda,enaf,theta,H,k)
Y=Y';
[~,num_dim] = size(X);


R = pdist2( Y'+eps, Y'+eps, 'cosine' );
options = [];
options.NeighborMode = 'KNN';
options.k =k;
options.t =1e+4;
options.WeightMode = 'Heatkernel';
S=constructW(X',options);
D=diag(sum(S));
L=D-S;

W  = (X'*X + enaf*eye(num_dim)) \ (X'*Y);
W1 = W;
Lip = sqrt(4* (norm(X'*X)^2+norm(alpha*(L-theta))^2));
bk = 1;
bk_1 = 1;

iter = 1; obji = 1;
% while 1
for iter=1:100

    W_s_k  = W + (bk_1 - 1)/bk * (W - W1);
    Gw_s_k = W_s_k - 1/Lip * (X'*X*W_s_k - X'*Y + alpha*L*W_s_k -alpha* theta*(W_s_k-H) + lamda*H*R);
    bk_1   = bk;
    bk     = (1 + sqrt(4*bk^2 + 1))/2;
    W1  = W;
    W    = softthres(Gw_s_k,beta/Lip);

    obj(iter)=0.5*norm((X*W-Y),'fro')^2+0.5*beta*sum(sum(abs(W)), 2)+0.5*alpha*trace(W'*L*W)-0.5*alpha*theta*trace((W-H)'*(W-H))+lamda*trace(R*W'*H);
    %     a1(1,iter)=0.5*norm((X*W-Y),'fro')^2
    %     a1(2,iter)=0.5*beta*sum(sum(abs(W)), 2)
    %     a1(3,iter)=0.5*trace(W'*L*W)-0.5*alpha*trace((W-H)'*(W-H))
    %     a1(4,iter)=enaf*trace(R*W'*H)

    cver = abs((obj(iter) - obji)/obji);
    obji = obj(iter);
    iter = iter + 1;
    if (cver < 10^-3 && iter > 2) , break, end
end
end
function W = softthres(W_t,lambda)
W = max(W_t-lambda,0) - max(-W_t-lambda,0);
end