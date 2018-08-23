---
title: TrainTestSplit
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# TrainTestSplit

This IKATS operator implements the train_test_split function from `scikit-learn`.




## Input and parameters

This operator only takes one input of the functional type `Table`.

It also takes 3 parameters :

- **Column target name** : name of the column target in the input (*optional*)
  - **repartition rate** : decimal repartition rate between train and test set. Usually between 0.7 and 0.9 depending on the size of available data (e.g a value of 0.7 means a split *70% train set* - *30% test set*)
- **Output tables basename** : basename used in output tables. E.g. if `basename='split'`, output tables will be called `'split_Train'` and `'split_Test'`


## Outputs


The operator has two `Tables` as outputs :

 - **Train** : the `Table` corresponding to the train set
 - **Test** : the `Table` corresponding to the test set (to validate a model)


Return to the [list of all operators](/operators.html)
