---
title: Quality indicators
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Quality indicators

This IKATS operator compute the quality stats related to `time` or/and `values`:


  - time
    - qual_min_period : Lowest period encountered
    - qual_max_period : Highest period encountered
    - qual_ref_period : Most occurring period
    - qual_average_period : global average period
    - qual_hist_period : Period histogram with occurrence count for each period
    - qual_hist_period_pc : Percentage version of the histogram (between [0,1])


  - values :
    - qual_min_value
    - qual_max_value
    - qual_average
    - qual_nb_points
    - qual_variance


## Input and parameters

This operator only takes one input of the functional type **TS_list**.

2 parameters can also be switched (On/Off) :

- **Value metadata** : Compute metadata related to value information
- **Time metadata** : Compute metadata related to time information


## Outputs


The operator has two outputs :

 - **Ts list** : The same as in input
 - **MD List** : A table of all TS with calculated indicators


Return to the [list of all operators](/operators.html)
