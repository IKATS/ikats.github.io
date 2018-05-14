---
title: Rollmean
date: 2018-01-15 15:00:00 +02:00
layout: default
---
# Rollmean Operator

This IKATS operator implements a moving mean



## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 3 inputs from the user :

- **Window period** : Duration of the moving window (in ms).
- **Window size** : Mutually exclusive with **Window period**. Size of the moving window. This is the number of observations used for calculating the statistic.
- **Alignment** : Label position encoded by :
    - 1: Left
    - 2: Center
    - 3: Right

## Outputs

The operator has one output :

 - **Result** : the resulting TS

Return to the [list of all operators](/operators.html)
