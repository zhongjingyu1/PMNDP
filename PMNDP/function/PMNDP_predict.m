function [pre_label, modProb,res_once] = PMNDP_predict(weights, test_feature, test_target,pre_tat)
test_target=test_target';
modProb = test_feature * weights;
pre_label = modProb;
pre_label(pre_label>pre_tat) = 1;
pre_label(pre_label<=pre_tat) = 0;
HammingLoss = Hamming_loss(pre_label', test_target');
RankingLoss = Ranking_loss(modProb', test_target');
OneError = One_error(modProb', test_target');
Coverage = coverage(modProb', test_target');
AvgPrecision = Average_precision(modProb', test_target');
res_once = [HammingLoss, RankingLoss, OneError, Coverage,AvgPrecision];
end