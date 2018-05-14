---
title: Cut By Metric
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Cut By Metric

This IKATS operator cuts all the timeseries that satisfy a given metric, where metric is _________.

## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 4 inputs from the user :

- **Metric (M)** : The name of the metric referenced as M in equation
- **Cut condition** : The condition the Metric should satisfy
- **Group By** : Optional criteria used to group time series
- **Funcid pattern** : Uses Python string format to create a new funcid where (fid) will be replaced with the old funcid and (M) will be replaced with the metric name.

## Outputs

The operator has one output :

 - **Result** : _______


Return to the [list of all operators](/operators.html)
