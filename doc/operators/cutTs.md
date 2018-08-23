---
title: Cut TS
date: 2018-01-15 15:00:00 +02:00
layout: default
published: true
---
# Cut TS

Cutting involves selecting a smaller section of a timeseries or dataset. Possible uses include:
- making a timeseries more manageable when prototyping a model
- restricting points in a time series to a chosen time perios
- removing outliers that are too high or too low
- selecting points that fulfil criteria on another column
- selecting an interesting pattern from a time series to search for in other time series


Their are four ways to cut a TS in IKATS:

## [Cut DS](/doc/operators/cutDs.html)
Cut all time series in a dataset either between certain dates or by limiting to a maximum number of points.

## [Cut DS By Metric](/doc/operators/cutByMetric.html)
Cut timeseries where a particular condition.

## [Cut Y](/doc/operators/cutY.html)
Cut out values that do not match a certain expression. Useful for removing outlier values that are too high or too low.

## Cut Visual Area


In the visualisation menu of a TS, you can zoom on an interesting part and click on the button `Save visible area as a new TS`.
![Texte alternatif](/img/operators/cutTS_save_visible.png "IKATS save visible"){:width="600px"}

See an example on [Tutorial : Matching patterns](/doc/tutorials/tuto_matching_pattern.html).


Return to the [list of all operators](/operators.html)
