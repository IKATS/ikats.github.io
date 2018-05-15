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

## [Cut DS](doc_operator_cut.md)
Cut all time series in a dataset either between certain dates or by limiting to a maximum number of points

## [Cut DS By Metric](doc_operator_cutbymetric.md)
Cut timeseries where a particular condition holds in __________ wait for Ford ds to write

## [Cut Y](doc_operator_cutY.md)
Cut out values that do not match a certain expression. Useful for removing outlier values that are too high or too low.

## Cut Visual Area

in the visualization menu of a TS, you can zoom on an interesting part and click on the button `Save visible area as a new TS`.

See an example on [Tutorial 9 : Matching patterns](/doc/tutorials/tuto_matching_pattern.html)


Return to the [list of all operators](/operators.html)
