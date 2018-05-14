---
title: cut_ds
date: 2018-01-15 15:00:00 +02:00
layout: default
---
# CUT DS Operator

This IKATS operator cuts all the timeseries in one of two ways:

- by leaving only those points in a given time range
- limiting the maximum number of points that are in a TS


## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 3 inputs from the user :

- **Start Date** : Dates before the Start Date will be excluded
- **End Date** : Dates after the End Date will be excluded
- **Number of points** : _______________________

## Outputs

The operator has one output :

 - **Result** : _______


Return to the [list of all operators](/operators.html)
