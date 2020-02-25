Neural Network-based Uncertainty Bounds from Similar Events


Steps of Training NN for the Uncertainty-bound:

A1. Finding indexes error-based similar pattern for each input pattern in the dataset.

A2. Training sample density NN for each pattern for indicating the prediction strength (Optional).

A3. Plotting similar events. (Optional).

A4. Bound correction for uncertainty bounds.

A5. Finding a certain UB from similar patterns and train NN for UB.


About the training data and input-output pattern:

The data used for the NN training is a time-series data. The dataset contains five columns. First four column represents the input combination and the last column represents the corresponding output.


The code can be used for different datasets where the last column is the output and other columns are input.

*Detailed description of codes are available as comments in codes.

* A1, A4, and A5 is for Neural Network training. A2, A3 are for inspection.

*A1 is time-consuming for large dataset.
