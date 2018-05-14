---
title: Discretize
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Discretize

This IKATS operator reduces the number of points in a timeseries by combining sections of the time series into buckets and applying one of four functions (min, max, mean, or standard deviation).


## Input and parameters

This operator only takes one input of the functional type **DS_name**.

It also takes upto 3 inputs from the user :

- **Number of buckets** : How many buckets to divide the time series into.
- **Table name** : The name given to the table   
:warning: must be unique
- **Operators** : Select upto 4 operators to be applied to each bucket. Each bucket-operator combination will have a column in the output table with the suffix operator_bucketNo. The four operators are:
        - MIN: the minimum value in each bucket
        - MAX: the maximum value in each bucket
        - AVG: the mean of all the values in the bucket
        - STD: the standard deviation of all the values in the bucket

## Outputs

The operator has one output:

 - **Table** : _______


 See this [Tutorial](/doc/tuto_TS2Feature.html) for a practical example


Return to the [list of all operators](/operators.html)
