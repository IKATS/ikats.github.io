---
title: Slope
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Slope

This IKATS operator produces a slope computation for an existing TS.

Considering 2 successive points A and B
* A : timestamp=T<sub>a</sub> and value=X<sub>a</sub>
* B : timestamp=T<sub>b</sub> and value=X<sub>b</sub>

The new point will be located at Ta with value X = (X<sub>b</sub> - X<sub>a</sub>) / (T<sub>b</sub> - T<sub>a</sub>)


## Input and parameters

This operator only takes one input of the functional type `TS_list`.


## Outputs

This operator produces 1 output:

 - **TS List** : the resulting TS list


Return to the [list of all operators](/operators.html)
