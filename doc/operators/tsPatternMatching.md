---
title: TS Pattern Matching
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# TS Pattern Matching



## Input and parameters

This operator only takes one input of the functional type `DS_name`.

It also takes upto 3 inputs from the user :

- **Pattern** : pattern that we seek to find in the TS. To define a pattern, view a TS, zoom in on the interesting area then click on the "save visible area as a new TS" button. Must be less than 500 points.
- **Rate sliding** : The computed translation of search window : experssed as a pourcentage off the pattern size (number of points)
- **Metric** :  algorithm choosen for measuring similarity between two temporal sequences. Choices are DTW (dynamic time warping), FAST_DTW, MANHATTAN
- **Scores limitation** : Number of results, sorted by best scores
- **Normalize mode** : NO_NORM, MEAN_VARIANCE



## Outputs

The operator has one output:

 - **matched** : _______


Return to the [list of all operators](/operators.html)
