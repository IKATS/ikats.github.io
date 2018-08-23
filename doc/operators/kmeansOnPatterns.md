---
title: kmeansOnPatterns
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# K-means on Patterns

This IKATS operator implements K-Means algorithm, like the [kmeans](/doc/operators/kmeans.html) operator, but with a different input: `patterns` instead of `SAX` words. The principle is the same, i.e., Clusters data by trying to separate samples in *n* groups with the nearest mean.


## Input and parameters

In the current implementation, this operator only takes one input of the functional type `patterns`, and this way is dedicated to be applied to the output of the [Random Projections](/doc/operators/randomProjections.html) operator.

It also takes 1 input from the user :

- **clusters** : The number of clusters to form as well as the number of centroids to generate


## Outputs

The operator has two outputs :

 - **Model** : a binary dump of the best model found by the procedure
 - **result** : Clusters visualisation of the inpout patterns, including centroïds positions

## Example
See [Tutorial : Decreased representation complexity using SAX](/doc/tutorials/tuto_sax.html)

<!--
## Warning


For the moment the visualisation tool is not completely implemented for this operator : only clusters are visualised, but the olinks and tooltips does not work. The developement is in progress.
-->


Return to the [list of all operators](/operators.html)
