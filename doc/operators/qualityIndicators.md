---
title: Quality indicators
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Quality indicators

This IKATS operator compute some statistics `time` or/and `values` for each TS provided. These statistics can be seen in the `MDEdit` menu (see [Tutorial 1 : Basics](/doc/tutorials/tuto_basics.html) for details).

## Description
The statistics calculated by `Quality Indicators` operator are:
  - time
    - qual_min_period : Lowest period encountered
    - qual_max_period : Highest period encountered
    - qual_ref_period : Most occurring period
    - qual_average_period : global average period (e.g.: `3600000.0`)
    - qual_hist_period : Occurrence count of each period (e.g.: `{"3600000": 45252}`)
    - qual_hist_period_pc : Percentage version (between 0 and 1)


  - values :
    - qual_min_value : The value of minimum
    - qual_max_value : The value of maximum
    - qual_average : The average
    - qual_nb_points : The number of points of the TS
    - qual_variance : The variance of the TS


## Input and parameters

This operator only takes one input of the functional type `TS_list`.

2 parameters can also be switched (On/Off) :

- **Value metadata** : Compute metadata related to value information
- **Time metadata** : Compute metadata related to time information


## Outputs


The operator has two outputs :

 - **Ts list** : The same as in input
 - **MD List** : A table of all TS with calculated indicators

Return to the [list of all operators](/operators.html)
