%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW9
% 11/01/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3
train = dlmread('train.txt');
test = dlmread('test.txt');
test_size = size(test,1);
train_size = size(train,1);
KList = [1 5 11 15];
prediction = zeros(test_size,size(KList,2));
correct_prediction_count = zeros(1,size(KList,2));

for i = 1:test_size
    temp = repmat(test(i:i,1:2),train_size,1);
    temp = train(:,1:2)-temp;
    temp = sum(temp.^2,2);
    temp = [temp train(:,3)];
    [~, order] = sort(temp(:,1));
    temp = temp(order,:);
    for k = 1:size(KList,2)
        count_1 = 0;
        count_2 = 0;
        K = KList(k);
        for j = 1:K
            if(temp(j,2) == 1)
                count_1 = count_1 +1;
            else
                count_2 = count_2 +1;
            end
        end
        if(count_1 > count_2)
            prediction(i, k) = 1;
            if test(i,3) == 1
                correct_prediction_count(k) =  correct_prediction_count(k)+1;
            end
        else
            prediction(i, k) = 2;
            if test(i,3) == 2
                correct_prediction_count(k) =  correct_prediction_count(k)+1;
            end
        end
    end
end

accuracy = correct_prediction_count/test_size;

for k = 1:size(KList,2)
    figure
    title(sprintf('K = %d, Accuracy = %f',KList(k),accuracy(k))), hold on;
    for i = 1:test_size
        if test(i,3) ~= prediction(i,k)
            plot(test(i,1), test(i,2), 'kO'), hold on;
        end
        if prediction(i,k) == 1
            plot(test(i,1), test(i,2), 'r.'), hold on;
        else
            plot(test(i,1), test(i,2), 'b.'), hold on;
        end
    end
    hold off;
end

