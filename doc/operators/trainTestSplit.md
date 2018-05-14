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

- **Column target name** : (*optional*) name of the column target in the input
- **repartition rate** : decimal rate. Usually between 0.7 and 0.9 depending on the size of available data
- **Output tables basename** : basename used in output tables. Ex : if *basename*=*split*, output tables will be called *split_Train* and *split_Test*


## Outputs


The operator has two tables as outputs :

 - **Train** : to train the model
 - **Test** : to test the model


Return to the [list of all operators](/operators.html)
