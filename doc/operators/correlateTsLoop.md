---
title: Correlate TS Loop
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Correlate TS Loop Operator

This IKATS operator implements correlation on all pairs of time series in a dataset. It uses the function Persons from the popular machine learning Python library `scikit-learn`. The results, The results are then converted to a color scale and displayed sing a matrix.

# Principle of correlation.

Correlation is a measure of how strongly related two variables are. It measures how much the variation in one variable explains the variation in another variable. Correlation can range from -1 (perfect negative correlation) to 1 (perfect correlation) with values closer to

![Alternate Text](/img/operators/crossValidation.png "Overview of the cross validation procedure")

Overview of the cross validation procedure ([source](https://upload.wikimedia.org/wikipedia/commons/1/1c/K-fold_cross_validation_EN.jpg))

## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes 2 inputs from the user :

- **Method** : The type of correlation used. At present only Pearson's correlation is implemented.
- **Group by** : The metadata column used to sort the time series when the correlation matrix is displayed.


## Outputs

The operator has one output :

 - **Correlation_matrix** : _______




Return to the [list of all operators](/operators.html)
