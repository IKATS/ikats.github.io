---
title: Rollmean
date: 2018-01-15 15:00:00 +02:00
layout: default
---
# Rollmean Operator

This IKATS operator implements a moving average. A resample can be performed if requested.


## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 4 inputs from the user :

- **Period**: The value defining the resampling period (in *ms*)
- **Window period** : Duration of the moving window (in ms).
- **Window size** : Mutually exclusive with **Window period**. Size (in points) of the moving window. This is the number of observations used for calculating the statistic.
- **Alignment** : Result alignement :
    - 1: Left
    - 2: Center (default)
    - 3: Right

## Outputs

The operator has one output :

 - **TS_list** : the resulting TS List

Return to the [list of all operators](/operators.html)
