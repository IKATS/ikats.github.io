---
title: Slope
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Slope

This IKATS operator produces a slope computation for an existing TS.

Considering 2 successive points A and B
* A : timestamp=Ta and value=Xa
* B : timestamp=Tb and value=Xb

The new point will be located at Ta with value X = (Xb - Xa) / (Tb - Ta)


## Input and parameters

This operator only takes one input of the functional type `TS_list`.


## Outputs

This operator produces 1 output:

 - **result** : a new TS list


Return to the [list of all operators](/operators.html)
