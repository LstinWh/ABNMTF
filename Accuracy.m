function [AC]=Accuracy(label,gnd)

% 求聚类后的标签与原标签的相似度
% -label 聚类后的标签
% -gnd 数据集中的原标签
% 
[m,n]=size(label);
[M,N]=size(gnd);
delta=0;
if M==m   
    for i=1:m
        if label(i,1)==gnd(i,1)
            delta=delta+1;
        end
    end
else
    disp('聚类标签有错误！');
end
AC=delta/m;