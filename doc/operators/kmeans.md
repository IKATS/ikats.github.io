---
title: kmeans
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Kmeans

This IKATS operator implements [K-Means](https://en.wikipedia.org/wiki/K-means_clustering) clustering algorithm, from `scikit-learn`. Clusters data by trying to separate samples in *n* groups with the nearest mean.


## Input and parameters

In the current implementation, this operator only takes one input of the functional type **SAX**.

It also takes 1 input from the user :

- **clusters** : The number of clusters to form as well as the number of centroids to generate


## Outputs

The operator has two outputs :

 - **Model** : a binary dump of the best model found by the procedure

 - **result** : Clusters visualisation, including centroïds positions

## Example
See [Tutorial : Decreased representation complexity using SAX](/doc/tutorials/tuto_sax.html)


## Warning

The operator is based on the values of PAA segments at the output of the [SAX](/doc/operators/sax.html) operator. It does not support null values, which may be the case if some data are missing. In this case, upstream use of the [resampling TS](/doc/operators/resample.html) operator may be useful.


Return to the [list of all operators](/operators.html)
