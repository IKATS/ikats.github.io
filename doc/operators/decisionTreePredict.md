---
title: sklearn_decision_tree_predict
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Decision Tree Predict

This IKATS operator implements `predict` algorithm for DecisionTree of `scikit-learn`. Should be used after a [Decision Tree Fit operator](/doc/operators/decisionTreeFit.html).

## Input and parameters

This operator takes two inputs :
- **Model** : The model, previously trained via [Decision Tree fit](/doc/operators/decisionTreeFit.html) operator
- **Population** : of the functional type `table` (e.g. : `test` output from [TrainTestSplit](/doc/operators/trainTestSplit.html))

It also takes 3 inputs from the user :

- **Target** : the name of the variable we want to predict in the input table
- **ID** : the name of the rows (or table key) of the input table
- **Table name** : Name of the outputed table, with features and predictions


## Outputs

The operator has two outputs :

 - **Confusion** : confusion_matrix as calculated in `scikit-learn`
 - **Score** : accuracy score (ratio of correctly predicted observations to the total observations)


Return to the [list of all operators](/operators.html).
