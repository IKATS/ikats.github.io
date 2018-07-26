---
title: Save as a dataset
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Save as a dataset

Create (and save) a dataset from a TS list.
This new dataset is available in `Data Mgt/Datasets` (see [Tutorial 0 : Check Installation](/doc/tutorials/tuto_basics.html) for details).

## Input and parameters

This operator only takes one input of the functional type `TS_list`.

It also takes 3 parameters from the user :

- **Selection** : select a subset of the TS list in input
- **Dataset Name** : the name of the future dataset
- **Description** : Information for dataset users

### Warning
Dataset name must be unique and not contain any space.


## Outputs

The operator has 2 outputs:

- **TS list** : List of timeseries
- **Name** : Name of the dataset created (same as parameter)


Return to the [list of all operators](/operators.html)
