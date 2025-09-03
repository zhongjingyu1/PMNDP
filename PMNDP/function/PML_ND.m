function [rr,ground_truth_labels_predict_peicison] = PML_ND(dataName)
load(dataName);
display(dataName)
partial_labels=candidate_labels;

k=5;
mu1=0.5;
mu2=0.5;
param_all = select_parameter(dataName);
delta=param_all(1);
gamma=param_all(2);
tar=param_all(3);
alpha=param_all(4);
beta=param_all(5);
lamda=param_all(6);
enaf=param_all(7);
theta=param_all(8);
pre_tat=param_all(9);

nfold = 10;
[n_sample,~]= size(data);
result=zeros(nfold,5);
n_test = round(n_sample/nfold);
I = 1:n_sample;
[Truth_label,H] =Truth_label_export(data,partial_labels,k,delta,gamma,mu1,mu2,tar);
Truth_label=Truth_label';
for i=1:nfold%
    fprintf('data2 processing,Cross validation: %d\n', i);
    start_ind = (i-1)*n_test + 1;
    if start_ind+n_test-1 > n_sample
        test_ind = start_ind:n_sample;
    else
        test_ind = start_ind:start_ind+n_test-1;
    end
    train_ind = setdiff(I,test_ind);
    train_data = data(train_ind, :);
    train_p_target = Truth_label(:,train_ind);
    [W,~] =PML_ND_train(train_data,train_p_target,alpha,beta,lamda,enaf,theta,H,k);
    test_data = data(test_ind,:);
    test_p_target = Truth_label(:, test_ind);
    [~, ~ , res_once] = PML_ND_predict(W, test_data, test_p_target,pre_tat);
    result(i,:)=res_once;
end
rr(1,:)=sum(result)/nfold;
rr(2,:)=std(result);
A=(Truth_label==target);
ground_truth_labels_predict_peicison=sum(sum(A))/(size(A,1)*size(A,2));
end