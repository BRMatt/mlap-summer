function [loss,gradient]=GradDescent(training_data,classifications,theta,learning_rate)
    % training_set    - training data 
    % classifications - the class of each row of data
    % theta           - parameter vector
    size_of_data = size(training_data,1);
    loss=0;

    gradient=zeros(size_of_data);

    % Each item in the training set
    for i=1:size_of_data
        y_comp = dot(training_data(i,:),theta);

        error = classifications(i) - y_comp;

        gradient = gradient + (training_data(i,:) * error);

        loss = loss + (error .^ 2);
    end
end