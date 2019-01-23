---
title: Cut By Metric
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Cut DS By Metric

This IKATS operator cuts all the timeseries that satisfy a condition on a given metric (eg metric *city* contains word "Paris").

## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 4 inputs from the user :

- **Metric (M)** : The name of the metric referenced as M in equation
- **Cut condition** : The condition the Metric should satisfy
- **Group By** : Optional criteria used to group time series
- **Funcid pattern** : Uses Python string format to create a new funcid where `{fid}` is replaced by the old funcid and `{M}` by the metric name (e.g. `newTS_{fid}_{metric}`)

## Outputs

The operator has one output :

 - **Ts list** : all points that validate the cut condition.

A tutorial is available in [tutorial: Advanced filtering with `Cut-DS by metric`](/doc/tutorials/tuto_cut_DS_metric.html)

Return to the [list of all operators](/operators.html)
