function [predLabel,W] = Truth_label_export(data,partial_labels,k,delta,gamma,mu1,mu2,tar)

Y=partial_labels';
[~,label_num] = size(Y);
fea_num = size(data,2);
ins_num = size(data,1);
predLabel=zeros(ins_num,label_num);

options = [];
options.NeighborMode = 'KNN';
options.k =k;
options.t =1e+4;
options.WeightMode = 'Heatkernel';

S=constructW(data,options);
D=diag(sum(S));
L=D-S;

y_negitive=ones(ins_num,label_num)-Y;

negitive=delta*(L+delta*eye(ins_num,ins_num))\y_negitive;
R = pdist2( y_negitive'+eps, y_negitive'+eps, 'cosine' );
A=data'*data+mu1*ones(fea_num,fea_num);
B=mu2*R;
C=data'*y_negitive;
W = lyap(A, B, C);


position=(L+delta*eye(ins_num,ins_num))\(delta*ones(ins_num,label_num)+gamma*data*W)-negitive;
for i=1:ins_num
    position_norm1(i,:)=(position(i,:)-min(min(position(i,:))))/(max(max(position(i,:)))-min(min(position(i,:))));
end
position_norm=position_norm1./(repmat(sum(position_norm1,2),1,label_num)+eps);

for i=1:ins_num
    [val,idx] = max(position_norm(i,:));
    predLabel(i,idx)=1;
end

for i=1:ins_num
    for j=1:label_num
        if position_norm(i,j)>tar
            predLabel(i,j)=1;
        end
    end
end
end