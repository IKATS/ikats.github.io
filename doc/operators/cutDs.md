---
title: cut_ds
date: 2018-01-15 15:00:00 +02:00
layout: default
---
# CUT DS Operator

This IKATS operator cuts all the timeseries provided keeping points in a time range (cut on X axis). If requested, a downsampling can be performed on results.

## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 3 inputs from the user :

- **Start Date** : Dates before the Start Date will be excluded
- **End Date** : Dates after the End Date will be excluded
- **Number of points** : (Optionnal) Maximum number of points retained by the time cut (downsampling).

## Outputs

The operator has one output :

 - **TS list** : all the points of the cutted dataset.


Return to the [list of all operators](/operators.html)
