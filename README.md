# Uncertainty Quantification Neural Network from Similarity and Sensitivity

## Abstract

Uncertainty quantification (UQ) from similar events brings transparency. However, the presence of an irrelevant event may degrade the performance of similarity-based algorithms. This paper presents a UQ technique from similarity and sensitivity. A traditional neural network (NN) for the point prediction is trained at first to obtain the sensitivity of different input parameters at different points. The relative range of each input parameter is set based on sensitivity. When the sensitivity of one parameter is very high, a small deviation in that parameter may result in a large deviation in output. While selecting similar events, we allow a small deviation in highly sensitive parameters and a large deviation in less sensitive parameters. Uncertainty bounds are computed based on similar events. Similar events contain exact matches and slightly different samples. Therefore, we train a NN for bound correction. The bound-corrected uncertainty bounds (UB) provide a fair and domain-independent uncertainty bound. Finally, we train NNs to compute UB directly. The end-user need to run the final NN to obtain UB, instead of following the entire process. The code of the proposed method is also uploaded to Github. Also, users need to run only the fifth script to train a NN of a different UB.



### Steps of Training NN for the Uncertainty-bound:

A1. Finding indexes of similarity and sensitivity based similar patterns for each input pattern in the dataset.

A2. Training sample density NN to compute the prediction strength (Optional).

A3. Plotting similar events. (Optional).

A4. Bound correction for uncertainty bounds.

A5. Finding a certain UB from similar patterns and train NN for UB.


### About the training data and input-output pattern:

The data used for the NN training is a time-series data. The dataset contains five columns. First four column represents the input combination and the last column represents the corresponding output.


The code can be used for different datasets where the last column is the output and other columns are input.

- Detailed description of codes are available as comments in codes.

- A1, A4, and A5 are for Neural Network training. A2, A3 are for inspection.

- A1 is time-consuming for large dataset.


### Link to the paper:
https://www.researchgate.net/publication/342548674_Uncertainty_Quantification_Neural_Network_from_Similarity_and_Sensitivity
