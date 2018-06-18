---
title: kmeansOnPatterns
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# kmeansOnPatterns

This IKATS operator implements K-Means algorithm, like the kmeans operator, but with a different input ! patterns instead of SAX words. The principle is the same, i.e., clusters data by trying to separate samples in n groups of equal variance, minimizing a criterion known as the inertia or within-cluster sum-of-squares.


## Input and parameters

In the current implementation, this operator only takes one input of the functional type **patterns**, and this way is dedicated to be applied to the output of the **randomProjections** operator.

It also takes 1 input from the user :

- **clusters** : The number of clusters to form as well as the number of centroids to generate


## Outputs

The operator has two outputs :

 - **Model** : a binary dump of the best model found by the procedure
 - **result** : Clusters visualization of the inpout patterns, including centroïds positions

## Example
The  [SAX and K-means tutorial](/doc/tutorials/tuto_random_projection.html) will be soon completed with the kmeans visualisation.


## Warning

For the moment the visualization tool is not completely implemented for this operator : onlyclusters are visualised, but the olinks and tooltips does not work.The developement is in progress.


Return to the [list of all operators](/operators.html)
