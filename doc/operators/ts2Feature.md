---
title: Ts2Feature
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Ts2Feature

Transform a `Table` object by aggregating its components.


## Input and parameters

This operator only takes one input of the functional type `Table`. Each row of this table must be linked to a TS (see [discretize operator](/doc/operators/discretize.html)).

It also takes upto 3 inputs from the user :

- **Population label** : Property used to identify rows in the outputed Table. Must be a shared metadata for all TS linked concerned in the input table.
- **Aggregated by** : used to aggregate input columns in order to create new features.
- **Output table name** : Name of the output table

## Outputs

The operator has one output:

 - **Table** : The newly created table

 For an example : see [Tutorial : How to parse timeseries and create new features](/doc/tutorials/tuto_TS2Feature.html).


 Return to the [list of all operators](/operators.html)
