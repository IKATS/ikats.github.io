---
title: Correlate TS Loop
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Correlate TS Loop Operator

This IKATS operator implements correlation on all pairs of time series in a dataset. It uses the function Persons from the popular machine learning Python library [scikit-learn](http://scikit-learn.org/stable/). The results are then converted to a color scale and displayed using an interactive heatmap.

## Principle of the operator

Correlation is a measure of how strongly related two variables are. It measures how much the variation in one variable explains the variation in another variable. Correlation can range from -1 (perfect negative correlation) to 1 (perfect correlation). Values closer to 0 means *no linear link between variables*.

## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes 2 inputs from the user :

- **Method** : The type of correlation used. For now, only Pearson's correlation is implemented.
- **Group by** : The metadata column used to sort the time series when the correlation matrix is displayed.


## Outputs

The operator has one output :

 - **Correlation_matrix** : a correlation matrix averaged over the entire dataset


 For an example : see [Tutorial 5 : Features correlation](/doc/tutorials/tuto_corr.html).

Return to the [list of all operators](/operators.html)
