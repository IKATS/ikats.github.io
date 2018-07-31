---
title: sklearn_decision_tree_fit
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Decision Tree Fit

This IKATS operator implements the `fit` algorithm of DecisionTree of `scikit-learn`.


## Input and parameters

This operator only takes one input of the functional type **Table**.

It also takes 4 inputs from the user :

- **Target** : the name of the variable we want to predict in the input table
- **ID** : the name of the rows (or table key) of the input table
- **Max Depth** : the maximum depth of the tree. The default value of zero means there is no constraint on the depth of the tree.
- **Class Balancing** : (*default False*) Apply a weight balancing on the items, inversely proportional to class frequencies in the input data according to the following formula: weight(label_i) = N_samples / (N_classes * Count(label_i))

## Outputs

The operator has two outputs :

 - **Model** : a binary dump of the best model found by the procedure, to be used by the Decision Tree Predict operator
 - **Dot** : the visualisation of the best found decision tree in the GraphViz format. For a proper visualize, you can copy the `Dot Text` into a [graph visualization tool](http://www.webgraphviz.com/).

See examples in [Tutorial : Geolocation prediction using Random Trees](/doc/tutorials/tuto_ML.html).

Return to the [list of all operators](/operators.html).
