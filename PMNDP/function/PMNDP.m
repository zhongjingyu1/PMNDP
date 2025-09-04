function [rr,ground_truth_labels_predict_peicison] = PMNDP(dataName)
load(dataName);
display(dataName)
partial_labels=candidate_labels;

k=5;
mu1=0.5;
mu2=0.5;

delta = 0.5;
gamma = 0.1;
tar = 0.25;
alpha = 2^2;
beta = 2^-10;
lamda = 2^-10;
enaf = 1;
theta = 0.5;
pre_tat = 0.5;


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
    [W,~] = PMNDP_train(train_data,train_p_target,alpha,beta,lamda,enaf,theta,H,k);
    test_data = data(test_ind,:);
    test_p_target = Truth_label(:, test_ind);
    [~, ~ , res_once] = PMNDP_predict(W, test_data, test_p_target,pre_tat);
    result(i,:)=res_once;
end
rr(1,:)=sum(result)/nfold;
rr(2,:)=std(result);
A=(Truth_label==target);
ground_truth_labels_predict_peicison=sum(sum(A))/(size(A,1)*size(A,2));
end