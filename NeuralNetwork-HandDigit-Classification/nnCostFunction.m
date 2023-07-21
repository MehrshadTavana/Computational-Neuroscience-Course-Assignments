function [J ,gradiante] = nnCostFunction(NN_parameters, input_layer_size, hidden_layer_size, ...
                                   num_labels, X, y, lambda)

Theta1 = reshape(NN_parameters(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(NN_parameters((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
num_train = size(X, 1); 

y_k = zeros(num_train,num_labels);

for i = 1:num_train
    y_k(i,y(i)) = 1;
end

a1 = [ones(num_train, 1), X];
z2 = a1*Theta1';
a2 = [ones(size(z2, 1),1) ,sigmoid( z2 )]; 
z3 = a2*Theta2';
a3 = sigmoid( z3 );

Error_matrix = ( -y_k.*log(a3) ) - ( (1 - y_k) .* log(1-a3) );
cost_1 = sum(sum(Error_matrix))/num_train; 

Theta1(:,1) = 0;
Theta2(:,1) = 0;
s1 = Theta1.^2;
s2 = Theta2.^2; 
cost_2 = lambda/(2*num_train)*( sum(sum(s1)) + sum(sum(s2)) );

J = cost_1 + cost_2;

delta3 = (a3 - y_k);
delta2 = delta3*Theta2(:,2:end) .* diff_sigmoid(z2);

diff_p1_1 = (1/num_train)*delta2'*a1;
diff_p1_2 = (1/num_train)*delta3'*a2;

diff_lambda_1 = (lambda / num_train) * Theta1; 
diff_lambda_2 = (lambda / num_train) * Theta2; 

diff_theta1 = diff_p1_1 + diff_lambda_1;
diff_theta2 = diff_p1_2 + diff_lambda_2;
gradiante = [diff_theta1(:) ; diff_theta2(:)];

end