---
title: sklearn_decision_tree_predict
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Decision Tree Predict

This IKATS operator implements predict algorithm for DecisionTree of `scikit-learn`

## Input and parameters

This operator takes two inputs :
- **Model** : previously trained in [Decision Tree fit](/doc/operators/decisionTreeFit.html) step
- **Population** : of the functional type **table** (Ex : `test` output from [TrainTestSplit](/doc/operators/trainTestSplit.html))

It also takes 3 inputs from the user :

- **Target** : the name of the variable we want to predict in the input table
- **ID** : the name of the rows (or table key) of the input table
- **Table name** : output with features and predictions


## Outputs

The operator has two outputs :

 - **Confusion** : confusion_matrix as calculated in `scikit-learn`
 - **Score** : accuracy score (ratio of correctly predicted observations to the total observations)


Return to the [list of all operators](/operators.html)
