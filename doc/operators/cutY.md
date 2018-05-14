---
title: cuty
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Cut Y

This IKATS operator cuts all the time series that satisfy a given expression, It is useful for removing outliers that are too high or too low.

## Input and parameters

This operator only takes one input of the functional type `TS_list`.

It also takes upto 2 inputs from the user :

- **Cut condition** : The python expression the point to be kept should satisfy e;g -10 < Y < 10
- **Funcid pattern** : Uses Python string format to create a new funcid where (fid) will be replaced with the old funcid and (M) will be replaced with the metric name.


## Outputs


The operator has two outputs :

 - **Ts list** : all points that validate the cut condition
 - **compl** : all others

## Pay attention :
- if the cut condition leads to an empty Ts list (nothing cut or all cut), component can be in error


Return to the [list of all operators](/operators.html)
